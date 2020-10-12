package com.job.util;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.io.FileUtils;

@Component("jobFileUtils")
public class JobFileUtils {
	/* 이미지 업로드 */
	public List<JobFileVO> parseInsertFileInfo(HttpServletRequest request, String path) throws Exception {
		String url = this.getClass().getResource("").getPath();
		String rootPath = url.substring(1, url.indexOf(".metadata")) + path;

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<JobFileVO> list = new ArrayList<JobFileVO>();
		JobFileVO vo = new JobFileVO();

		File file = new File(rootPath);
		if (file.exists() == false) {
			file.mkdirs();
		}
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(rootPath + storedFileName);
				multipartFile.transferTo(file);
				vo.setOriginalfilename(originalFileName);
				vo.setStoredfilename(storedFileName);
				vo.setFilesize(multipartFile.getSize());
				list.add(vo);
			}
		}
		return list;
	}

	/* 이미지 다운로드 */
	public void downloadFile(String storedFileName, String path, String originalFileName, HttpServletResponse response)
			throws Exception {
		String url = this.getClass().getResource("").getPath();
		String rootPath = url.substring(1, url.indexOf(".metadata")) + "job/src/main/webapp/resources/images/upload/"+path;
		byte fileByte[] = FileUtils.readFileToByteArray(new File(rootPath + storedFileName));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	/* 이미지 삭제 */
	public int myDeleteImage(JobFileVO vo, String path, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		int result = 0;
		String url = this.getClass().getResource("").getPath();
		String rootPath = url.substring(1, url.indexOf(".metadata")) + path;
		System.out.println("rootPath : "+rootPath + vo.getStoredfilename());
		File file = new File(rootPath + vo.getStoredfilename());
		if (file.exists()) {
			if (file.delete()) {
				writer.println("<script>alert('파일삭제 성공.');</script>");
				writer.flush();
				result = 1;
			} else {
				writer.println("<script>alert('파일삭제 실패.');</script>");
				writer.flush();
				result = 0;
			}
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}

		return result;
	}
}

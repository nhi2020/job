package com.job.util;

public class JobFileVO {

	private int attachid;
	private String originalfilename;
	private String storedfilename;
	private long filesize;
	

	public int getAttachid() {
		return attachid;
	}
	public void setAttachid(int attachid) {
		this.attachid = attachid;
	}
	public String getOriginalfilename() {
		return originalfilename;
	}
	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}
	public String getStoredfilename() {
		return storedfilename;
	}
	public void setStoredfilename(String storedfilename) {
		this.storedfilename = storedfilename;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	
	
	
}

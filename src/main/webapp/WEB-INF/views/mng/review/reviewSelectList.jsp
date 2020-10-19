<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});

		var currPage = ('<c:out value="${pageNum}"/>' != 0 || '<c:out value="${pageNum}"/>' != '') ? '<c:out value="${pageNum}"/>' : 1;

		var rtab = '<c:out value="${rtab}"/>';
		
		if (rtab == "m") {
			$("#tab1").addClass("fade");
			$("#tab2").addClass("fade");
			$("#tab3").addClass("active");
			getMRevList(currPage);
		} else if (rtab == "s") {
			$("#tab1").addClass("fade");
			$("#tab3").addClass("fade");
			$("#tab2").addClass("active");
			getSalList(currPage);
		} else {
			$("#tab2").addClass("fade");
			$("#tab3").addClass("fade");
			$("#tab1").addClass("active");
			getRevList(currPage);
		}

		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {
			if (result === '' || history.state) {
					return;
			}

			$("#myModal").modal("show");
			
		}

		$("#tab1btn").click(function() {
			$("#revtable1").show();
			getRevList(1);
			$("#revtable2").hide();
			$("#revtable3").hide();
		});
		$("#tab2btn").click(function() {
			$("#revtable2").show();
			getSalList(1);
			$("#revtable1").hide();
			$("#revtable3").hide();
		});
		$("#tab3btn").click(function() {
			$("#revtable3").show();
			getMRevList(1);
			$("#revtable1").hide();
			$("#revtable2").hide();
		});

		
	});

	// 검색 클릭시 동작하는 것. 기업리뷰, 연봉 정보, 면접 후기 순
	$(document).on('click', '#query1', function() {
		
		var pageNum = (pageNum == null) ? 1 : pageNum;
		searchQuery1(pageNum);
		
	});
	$(document).on('click', '#query2', function() {
		
		var pageNum = (pageNum == null) ? 1 : pageNum;
		searchQuery2(pageNum);
		
	});
	$(document).on('click', '#query3', function() {
		
		var pageNum = (pageNum == null) ? 1 : pageNum;
		searchQuery3(pageNum);
		
	});
	// 검색 후 초기 화면으로
	$(document).on('click', '#searchreset1', function() {
		
		getRevList(1);
		
	});
	$(document).on('click', '#searchreset2', function() {
		
		getSalList(1);
		
	});
	$(document).on('click', '#searchreset3', function() {
		
		getMRevList(1);
		
	});

	
	
	// ajax로 기업 리뷰 게시판 구현
	function getRevList(page) {
		str = "";
		str2 = "";
		str3 = "";
		str4 = "";
		str5 = "";
		$.ajax({
			url : "/mng/review/tab1/" + page + ".do",
			dataType : "json",
			success : function(data) {
				var jsondata = JSON.stringify(data); // json으로 받으면 모든 내용이 객체화되어 있음. 이걸 문자열로 변경해주는 작업임. 
				str += "<h3>기업리뷰</h3><br>"
					+ "<table class='table table-striped table-bordered table-hover'>"
					+ "<thead class='thead-dark'>" + "<tr>"
					+ "<th>글 번호</th>" + "<th>작성자</th>"
					+ "<th>기업명</th>" + "<th>리뷰내용</th>"
					+ "<th>등록일</th>" + "<th>수정일</th>"
					+ "<th>삭제일</th>" + "</tr>" + "</thead>";
				// 표 내부 내용. 없을 때는 결과가 없다는 표시, 있으면 내용 표시
				if (data.pageMaker.endPage == 0) {
					str += "<tr><td colspan='7' style='text-align:center'><h4>검색결과가 없습니다.</h4></td></tr>";
				} else {
					$(data.rlist).each(function() {
						str3 = this.review;
						str2 = "<tr><td>" + this.rnum + "</td>"
							+ "<td>" + this.id + "</td>"
							+ "<td>" + this.company + "</td>"
							+ "<td>"
							+ "<a href='reviewView.do?rnum=" + this.rnum + "&pageNum=" + data.pageMaker.cri.pageNum + "'>"	+ str3.substring(0, 15) + "......"
							+ "</a></td>" + "<td>"	+ this.reg_date.substring(0, 4)	+ this.reg_date.substring(5, 7)	+ this.reg_date.substring(8, 10)
							+ "</td>" + "<td>"	+ this.up_date.substring(0, 4)	+ this.up_date.substring(5, 7)	+ this.up_date.substring(8, 10)	+ "</td>" + "<td>";
							if (this.del_yn == 'Y') {
								str2 += this.del_date.substring(0, 4)+ this.del_date.substring(5, 7)+ this.del_date	.substring(8, 10);
							} else {
								str2 += '게시중';
							}
								str2 += "</td></tr>";
								str += str2;
					});
				}
					str += "</table>";
					//str4는 페이징 처리 
					str4 += "<div><ul class='pagination justify-content-center'>";

					if (data.pageMaker.prev) {
						str4 += "<li class='paginate_button previous'><a class='page-link' onclick='getRevList("
							+ (data.pageMaker.startPage - 1)
							+ ")'>이전</a></li>";
					}
					var st = data.pageMaker.startPage;
					var end = data.pageMaker.endPage;
					for (st; st <= end; st++) {
						str4 += ("<li class='paginate_button page-item "+ ((data.pageMaker.cri.pageNum == st) ? "active": "") + "'><a class='page-link' onclick='getRevList(" + st + ")'>" + st + "</a></li>");
					}
					if (data.pageMaker.next) {
						str4 += "<li class='paginate_button next'><a class='page-link' onclick='getRevList("+ (data.pageMaker.endPage + 1)	+ ")'>다음</a></li>";
					}
					str4 += "</ul></div>";
					//str5는 검색기능 화면 표시
					str5 += "<div class='row'>"
						+ "<div class='col-lg-12'>"
						+ "<div class='input-group mb-3'>"
								+ "<div>"
								+ "<select name='type' id='type' class='form-control'>"
								+ "<option value=''>--</option>"
								+ "<option value='CN'>기업명</option>"
								+ "<option value='UI'>작성자ID</option>"
								+ "<option value='RE'>리뷰내용</option>"
								+ "</select>"
								+ "</div>"
								+ "<div>"
								+ "<input type='text' id='keyword' class='form-control'>"
								+ "</div>"
								+ "<div>"
								+ "<button id='query1' class='btn btn-dark'>조회</button>"
								+ "</div>"
								+ "<input type='hidden' name='pageNum' value='" + data.pageMaker.cri.pageNum + "'>"
								+ "</div>" + "</div>" + "</div><br>";
						str += str5;
						str += str4;
						$('#revtable1').html(str);
			}

				});
	}
		
	// ajax로 연봉 리뷰 게시판 구현
	function getSalList(page2) {
		str = "";
		str2 = "";
		str3 = "";
		str4 = "";
		str5 = "";
		$.ajax({
					url : "/mng/review/tab2/" + page2 + ".do",
					dataType : "json",
					success : function(data) {
						var jsondata = JSON.stringify(data); // json으로 받으면 모든 내용이 객체화되어 있음. 이걸 문자열로 변경해주는 작업임.
						str += "<h3>연봉 정보 관리</h3><br>"
								+ "<table class='table table-striped table-bordered table-hover'>"
								+ "<thead class='thead-dark'>" + "<tr>"
								+ "<th>글 번호</th>" + "<th>작성자</th>"
								+ "<th>기업명</th>" + "<th>직위</th>"
								+ "<th>연봉</th>" + "<th>등록일</th>"
								+ "<th>수정일</th>" + "<th>삭제일</th>" + "</tr>"
								+ "</thead>";
								// 표 내부 내용. 없을 때는 결과가 없다는 표시, 있으면 내용 표시
								if (data.pageMaker.endPage == 0) {
									str += "<tr><td colspan='8' style='text-align:center'><h4>검색결과가 없습니다.</h4></td></tr>";
								} else {
						$(data.rlist).each(
								function() {

									str2 = "<tr><td>" + this.rnum + "</td>"
											+ "<td>" + this.id + "</td>"
											+ "<td>" + this.company + "</td>"
											+ "<td>"
											+ "<a href='reviewView.do?rnum="
											+ this.rnum + "&pageNum="
											+ data.pageMaker.cri.pageNum + "'>"
											+ this.spot + "</a></td>" + "<td>"
											+ this.sal + "</td>" + "<td>"
											+ this.reg_date.substring(0, 4)
											+ this.reg_date.substring(5, 7)
											+ this.reg_date.substring(8, 10)
											+ "</td>" + "<td>"
											+ this.up_date.substring(0, 4)
											+ this.up_date.substring(5, 7)
											+ this.up_date.substring(8, 10)
											+ "</td>" + "<td>";
									if (this.del_yn == 'Y') {
										str2 += this.del_date.substring(0, 4)
												+ this.del_date.substring(5, 7)
												+ this.del_date.substring(8, 10);
									} else {
										str2 += '게시중';
									}
									str2 += "</td></tr>";
									str += str2;
								});
								}
						str += "</table>";
						str4 += "<div><ul class='pagination justify-content-center'>";

						if (data.pageMaker.prev) {
							str4 += "<li class='paginate_button previous'><a class='page-link' onclick='getSalList("
									+ (data.pageMaker.startPage - 1)
									+ ")'>이전</a></li>";
						}

						var st = data.pageMaker.startPage;
						var end = data.pageMaker.endPage;
						for (st; st <= end; st++) {

							str4 += ("<li class='paginate_button page-item "
									+ ((data.pageMaker.cri.pageNum == st) ? "active"
											: "")
									+ "'><a class='page-link' onclick='getSalList("
									+ st + ")'>" + st + "</a></li>");

						}
						if (data.pageMaker.next) {
							str4 += "<li class='paginate_button next'><a class='page-link' onclick='getSalList("
									+ (data.pageMaker.endPage + 1)
									+ ")'>다음</a></li>";
						}

						str4 += "</ul></div>";
						//str5는 검색기능 화면 표시
						str5 += "<div class='row'>"
							+ "<div class='col-lg-12'>"
							+ "<div class='input-group mb-3'>"
									+ "<div>"
									+ "<select id='type2' class='form-control'>"
									+ "<option value=''>--</option>"
									+ "<option value='CN'>기업명</option>"
									+ "<option value='UI'>작성자ID</option>"
									+ "</select>"
									+ "</div>"
									+ "<div>"
									+ "<input type='text' id='keyword2' class='form-control'>"
									+ "</div>"
									+ "<div>"
									+ "<button id='query2' class='btn btn-dark'>조회</button>"
									+ "</div>"
									+ "<input type='hidden' name='pageNum' value='" + data.pageMaker.cri.pageNum + "'>"
									+ "</div>" + "</div>" + "</div><br>";
							str += str5;
							str += str4;

						$('#revtable2').html(str);
					}

				});

	}

	//ajax로 면접 리뷰 게시판 구현
	function getMRevList(page3) {
		str = "";
		str2 = "";
		str3 = "";
		str4 = "";
		str5 = "";
		$
				.ajax({
					url : "/mng/review/tab3/" + page3 + ".do",
					dataType : "json",
					success : function(data) {
						var jsondata = JSON.stringify(data); // json으로 받으면 모든 내용이 객체화되어 있음. 이걸 문자열로 변경해주는 작업임.
						str += "<h3>면접 리뷰 관리</h3><br>"
								+ "<table class='table table-striped table-bordered table-hover'>"
								+ "<thead class='thead-dark'>" + "<tr>"
								+ "<th>글번호</th>" + "<th>작성자</th>"
								+ "<th>기업명</th>" + "<th>면접일자</th>"
								+ "<th>면접후기</th>" + "<th>면접상태</th>"
								+ "<th>면접난이도</th>" + "<th>등록일</th>"
								+ "<th>수정일</th>" + "<th>삭제일</th>" + "</tr>"
								+ "</thead>";
								// 표 내부 내용. 없을 때는 결과가 없다는 표시, 있으면 내용 표시
								if (data.pageMaker.endPage == 0) {
									str += "<tr><td colspan='10' style='text-align:center'><h4>검색결과가 없습니다.</h4></td></tr>";
								} else {
						$(data.rlist).each(
								function() {
									str3 = this.mreview;
									str2 = "<tr><td>" + this.rnum + "</td>"
											+ "<td>" + this.id + "</td>"
											+ "<td>" + this.company + "</td>"
											+ "<td>"
											+ this.m_date.substring(0, 4)
											+ this.m_date.substring(5, 7)
											+ this.m_date.substring(8, 10)
											+ "</td>" + "<td>"
											+ "<a href='reviewView.do?rnum="
											+ this.rnum + "&pageNum="
											+ data.pageMaker.cri.pageNum + "'>"
											+ str3.substring(0, 15) + "......"
											+ "</a></td>" + "<td>"
											+ this.m_status + "</td>" + "<td>"
											+ this.m_difficultly + "</td>"
											+ "<td>"
											+ this.reg_date.substring(0, 4)
											+ this.reg_date.substring(5, 7)
											+ this.reg_date.substring(8, 10)
											+ "</td>" + "<td>"
											+ this.up_date.substring(0, 4)
											+ this.up_date.substring(5, 7)
											+ this.up_date.substring(8, 10)
											+ "</td>" + "<td>";
									if (this.del_yn == 'Y') {
										str2 += this.del_date.substring(0, 4)
												+ this.del_date.substring(5, 7)
												+ this.del_date
														.substring(8, 10);
									} else {
										str2 += '게시중';
									}
									str2 += "</td></tr>";
									str += str2;
								});
								}
						str += "</table>";
						str4 += "<div><ul class='pagination justify-content-center'>";

						var st = data.pageMaker.startPage;
						var end = data.pageMaker.endPage;
						if (data.pageMaker.prev) {
							str4 += "<li class='paginate_button previous'><a class='page-link' onclick='getMRevList("
									+ (data.pageMaker.startPage - 1)
									+ ")'>이전</a></li>";
						}
						for (st; st <= end; st++) {

							str4 += ("<li class='paginate_button page-item "
									+ ((data.pageMaker.cri.pageNum == st) ? "active"
											: "")
									+ "'><a class='page-link' onclick='getMRevList("
									+ st + ")'>" + st + "</a></li>");

						}
						if (data.pageMaker.next) {
							str4 += "<li class='paginate_button next'><a class='page-link' onclick='getMRevList("
									+ (data.pageMaker.endPage + 1)
									+ ")'>다음</a></li>";
						}

						str4 += "</ul></div>";
						//str5는 검색기능 화면 표시
						str5 += "<div class='row'>"
							+ "<div class='col-lg-12'>"
							+ "<div class='input-group mb-3'>"
									+ "<div>"
									+ "<select id='type3' class='form-control'>"
									+ "<option value=''>--</option>"
									+ "<option value='CN'>기업명</option>"
									+ "<option value='UI'>작성자ID</option>"
									+ "<option value='MR'>면접후기 내용</option>"
									+ "</select>"
									+ "</div>"
									+ "<div>"
									+ "<input type='text' id='keyword3' class='form-control'>"
									+ "</div>"
									+ "<div>"
									+ "<button id='query3' class='btn btn-dark'>조회</button>"
									+ "</div>"
									+ "<input type='hidden' name='pageNum' value='" + data.pageMaker.cri.pageNum + "'>"
									+ "</div>" + "</div>" + "</div><br>";
							str += str5;
							str += str4;
						$('#revtable3').html(str);
					}

				});

	}
	
	// ajax로 기업 리뷰 게시판 검색 구현
	function searchQuery1(pageNum) {
		
		var type = $('#type').val();
		var keyword = $('#keyword').val();
		sstr = "";
		sstr2 = "";
		sstr3 = "";
		sstr4 = "";
		sstr5 = "";
		sstr6 = "";
		
		var pageNum = (pageNum == null) ? 1 : pageNum;
		
		cri = {
			type :type,
			keyword : keyword,
			pageNum : pageNum
		};
		
		$.ajax({
			url : "/mng/review/tab1search/search.do",
			method : 'POST',
			data : cri,
			dataType : 'json',
			success : function(data) {
				if (data.pageMaker.cri.type == 'CN') {
					sstr6 += "기업명 : ";
				} else if (data.pageMaker.cri.type == 'UI') {
					sstr6 += "작성자명 : ";
				} else if (data.pageMaker.cri.type == 'RE') {
					sstr6 += "리뷰 내용 : ";
				}
				sstr += "<h3>기업리뷰 검색결과 : " + sstr6 + data.pageMaker.cri.keyword + "</h3><br>"
					+ "<table class='table table-striped table-bordered table-hover'>"
					+ "<thead class='thead-dark'>" + "<tr>"
					+ "<th>글 번호</th>" + "<th>작성자</th>"
					+ "<th>기업명</th>" + "<th>리뷰내용</th>"
					+ "<th>등록일</th>" + "<th>수정일</th>"
					+ "<th>삭제일</th>" + "</tr>" + "</thead>";
				// 표 내부 내용. 없을 때는 결과가 없다는 표시, 있으면 내용 표시
				if (data.pageMaker.endPage == 0) {
					sstr += "<tr><td colspan='7' style='text-align:center'><h4>검색결과가 없습니다.</h4></td></tr>";
				} else {
					$(data.rlist).each(function() {
						sstr3 = this.review;
						sstr2 = "<tr><td>" + this.rnum + "</td>"
							+ "<td>" + this.id + "</td>"
							+ "<td>" + this.company + "</td>"
							+ "<td>"
							+ "<a href='reviewView.do?rnum=" + this.rnum + "&pageNum=" + data.pageMaker.cri.pageNum + "'>"	+ sstr3.substring(0, 15) + "......"
							+ "</a></td>" + "<td>"	+ this.reg_date.substring(0, 4)	+ this.reg_date.substring(5, 7)	+ this.reg_date.substring(8, 10)
							+ "</td>" + "<td>"	+ this.up_date.substring(0, 4)	+ this.up_date.substring(5, 7)	+ this.up_date.substring(8, 10)	+ "</td>" + "<td>";
							if (this.del_yn == 'Y') {
								sstr2 += this.del_date.substring(0, 4)+ this.del_date.substring(5, 7)+ this.del_date.substring(8, 10);
							} else {
								sstr2 += '게시중';
							}
								sstr2 += "</td></tr>";
								sstr += sstr2;
					});
				}
					sstr += "</table>";
					//str4는 페이징 처리 
					sstr4 += "<div><ul class='pagination justify-content-center'>";

					if (data.pageMaker.prev) {
						sstr4 += "<li class='paginate_button previous'><a class='page-link' onclick='searchQuery1("
							+ (data.pageMaker.startPage - 1)
							+ ")'>이전</a></li>";
					}
					var st = data.pageMaker.startPage;
					var end = data.pageMaker.endPage;
					for (st; st <= end; st++) {
						sstr4 += ("<li class='paginate_button page-item "+ ((data.pageMaker.cri.pageNum == st) ? "active": "") + "'><a class='page-link' onclick='searchQuery1(" + st + ")'>" + st + "</a></li>");
					}
					if (data.pageMaker.next) {
						sstr4 += "<li class='paginate_button next'><a class='page-link' onclick='searchQuery1("+ (data.pageMaker.endPage + 1)	+ ")'>다음</a></li>";
					}
					sstr4 += "</ul></div>";

					sstr5 += "<div class='row'>"
						+ "<div class='col-lg-12'>"
						+ "<div class='input-group mb-3'>"
								+ "<div>"
								+ "<button id='searchreset1' class='btn btn-dark'>목록으로</button>"
								+ "</div>"
								+ "<input type='hidden' id='type' value='" + data.pageMaker.cri.type + "'>"
								+ "<input type='hidden' id='keyword' value='" + data.pageMaker.cri.keyword + "'>"
								+ "<input type='hidden' id='pageNum' value='" + data.pageMaker.cri.pageNum + "'>"
								+ "</div>" + "</div>" + "</div><br>";
						sstr += sstr5;
						sstr += sstr4;
						$('#revtable1').html("");
						$('#revtable1').html(sstr);
				
			}
		});
		
	}
	
	// ajax로 기업 리뷰 게시판 검색 구현
	function searchQuery2(pageNum) {
		
		var type = $('#type2').val();
		var keyword = $('#keyword2').val();
		sstr = "";
		sstr2 = "";
		sstr3 = "";
		sstr4 = "";
		sstr5 = "";
		sstr6 = "";
		
		var pageNum = (pageNum == null) ? 1 : pageNum;
		
		cri = {
			type :type,
			keyword : keyword,
			pageNum : pageNum
		};
		
		$.ajax({
			url : "/mng/review/tab2search/search.do",
			method : 'POST',
			data : cri,
			dataType : 'json',
			success : function(data) {
				var jsonstr = JSON.stringify(data);
				if (data.pageMaker.cri.type == 'CN') {
					sstr6 += "기업명 : ";
				} else if (data.pageMaker.cri.type == 'UI') {
					sstr6 += "작성자명 : ";
				}
				sstr += "<h3>연봉정보 검색결과 : " + sstr6 + data.pageMaker.cri.keyword + "</h3><br>"
					+ "<table class='table table-striped table-bordered table-hover'>"
					+ "<thead class='thead-dark'>" + "<tr>"
					+ "<th>글 번호</th>" + "<th>작성자</th>"
					+ "<th>기업명</th>" + "<th>직위</th>"
					+ "<th>연봉</th>" + "<th>등록일</th>"
					+ "<th>수정일</th>" + "<th>삭제일</th>" + "</tr>"
					+ "</thead>";
					// 표 내부 내용. 없을 때는 결과가 없다는 표시, 있으면 내용 표시
					if (data.pageMaker.endPage == 0) {
						sstr += "<tr><td colspan='8' style='text-align:center'><h4>검색결과가 없습니다.</h4></td></tr>";
					} else {
			$(data.rlist).each(
					function() {

						sstr2 = "<tr><td>" + this.rnum + "</td>"
								+ "<td>" + this.id + "</td>"
								+ "<td>" + this.company + "</td>"
								+ "<td>"
								+ "<a href='reviewView.do?rnum="
								+ this.rnum + "&pageNum="
								+ data.pageMaker.cri.pageNum + "'>"
								+ this.spot + "</a></td>" + "<td>"
								+ this.sal + "</td>" + "<td>"
								+ this.reg_date.substring(0, 4)
								+ this.reg_date.substring(5, 7)
								+ this.reg_date.substring(8, 10)
								+ "</td>" + "<td>"
								+ this.up_date.substring(0, 4)
								+ this.up_date.substring(5, 7)
								+ this.up_date.substring(8, 10)
								+ "</td>" + "<td>";
						if (this.del_yn == 'Y') {
							sstr2 += this.del_date.substring(0, 4)
									+ this.del_date.substring(5, 7)
									+ this.del_date.substring(8, 10);
						} else {
							sstr2 += '게시중';
						}
						sstr2 += "</td></tr>";
						sstr += sstr2;
					});
					}
					sstr += "</table>";
					//str4는 페이징 처리 
					sstr4 += "<div><ul class='pagination justify-content-center'>";

					if (data.pageMaker.prev) {
						sstr4 += "<li class='paginate_button previous'><a class='page-link' onclick='searchQuery2("
							+ (data.pageMaker.startPage - 1)
							+ ")'>이전</a></li>";
					}
					var st = data.pageMaker.startPage;
					var end = data.pageMaker.endPage;
					for (st; st <= end; st++) {
						sstr4 += ("<li class='paginate_button page-item "+ ((data.pageMaker.cri.pageNum == st) ? "active": "") + "'><a class='page-link' onclick='searchQuery2(" + st + ")'>" + st + "</a></li>");
					}
					if (data.pageMaker.next) {
						sstr4 += "<li class='paginate_button next'><a class='page-link' onclick='searchQuery2("+ (data.pageMaker.endPage + 1)	+ ")'>다음</a></li>";
					}
					sstr4 += "</ul></div>";

					sstr5 += "<div class='row'>"
						+ "<div class='col-lg-12'>"
						+ "<div class='input-group mb-3'>"
								+ "<div>"
								+ "<button id='searchreset2' class='btn btn-dark'>목록으로</button>"
								+ "</div>"
								+ "<input type='hidden' id='type2' value='" + data.pageMaker.cri.type + "'>"
								+ "<input type='hidden' id='keyword2' value='" + data.pageMaker.cri.keyword + "'>"
								+ "<input type='hidden' id='pageNum' value='" + data.pageMaker.cri.pageNum + "'>"
								+ "</div>" + "</div>" + "</div><br>";
						sstr += sstr5;
						sstr += sstr4;
						$('#revtable2').html("");
						$('#revtable2').html(sstr);
				
			}
		});
		
	}

	// ajax로 기업 리뷰 게시판 검색 구현
	function searchQuery3(pageNum) {
		
		var type = $('#type3').val();
		var keyword = $('#keyword3').val();
		sstr = "";
		sstr2 = "";
		sstr3 = "";
		sstr4 = "";
		sstr5 = "";
		sstr6 = "";
		
		var pageNum = (pageNum == null) ? 1 : pageNum;
		
		cri = {
			type :type,
			keyword : keyword,
			pageNum : pageNum
		};
		
		$.ajax({
			url : "/mng/review/tab3search/search.do",
			method : 'POST',
			data : cri,
			dataType : 'json',
			success : function(data) {
				var jsonstr = JSON.stringify(data);
				if (data.pageMaker.cri.type == 'CN') {
					sstr6 += "기업명 : ";
				} else if (data.pageMaker.cri.type == 'UI') {
					sstr6 += "작성자명 : ";
				} else if (data.pageMaker.cri.type == 'MR') {
					sstr6 += "면접후기 리뷰 내용 : ";
				}
				sstr += "<h3>면접 리뷰 검색결과 : " + sstr6 + data.pageMaker.cri.keyword + "</h3><br>"
					+ "<table class='table table-striped table-bordered table-hover'>"
					+ "<thead class='thead-dark'>" + "<tr>"
					+ "<th>글번호</th>" + "<th>작성자</th>"
					+ "<th>기업명</th>" + "<th>면접일자</th>"
					+ "<th>면접후기</th>" + "<th>면접상태</th>"
					+ "<th>면접난이도</th>" + "<th>등록일</th>"
					+ "<th>수정일</th>" + "<th>삭제일</th>" + "</tr>"
					+ "</thead>";
					// 표 내부 내용. 없을 때는 결과가 없다는 표시, 있으면 내용 표시
					if (data.pageMaker.endPage == 0) {
						sstr += "<tr><td colspan='10' style='text-align:center'><h4>검색결과가 없습니다.</h4></td></tr>";
					} else {
			$(data.rlist).each(
					function() {
						sstr3 = this.mreview;
						sstr2 = "<tr><td>" + this.rnum + "</td>"
								+ "<td>" + this.id + "</td>"
								+ "<td>" + this.company + "</td>"
								+ "<td>"
								+ this.m_date.substring(0, 4)
								+ this.m_date.substring(5, 7)
								+ this.m_date.substring(8, 10)
								+ "</td>" + "<td>"
								+ "<a href='reviewView.do?rnum="
								+ this.rnum + "&pageNum="
								+ data.pageMaker.cri.pageNum + "'>"
								+ sstr3.substring(0, 15) + "......"
								+ "</a></td>" + "<td>"
								+ this.m_status + "</td>" + "<td>"
								+ this.m_difficultly + "</td>"
								+ "<td>"
								+ this.reg_date.substring(0, 4)
								+ this.reg_date.substring(5, 7)
								+ this.reg_date.substring(8, 10)
								+ "</td>" + "<td>"
								+ this.up_date.substring(0, 4)
								+ this.up_date.substring(5, 7)
								+ this.up_date.substring(8, 10)
								+ "</td>" + "<td>";
						if (this.del_yn == 'Y') {
							sstr2 += this.del_date.substring(0, 4)
									+ this.del_date.substring(5, 7)
									+ this.del_date
											.substring(8, 10);
						} else {
							sstr2 += '게시중';
						}
						sstr2 += "</td></tr>";
						sstr += sstr2;
					});
					}
					sstr += "</table>";
					//str4는 페이징 처리 
					sstr4 += "<div><ul class='pagination justify-content-center'>";

					if (data.pageMaker.prev) {
						sstr4 += "<li class='paginate_button previous'><a class='page-link' onclick='searchQuery3("
							+ (data.pageMaker.startPage - 1)
							+ ")'>이전</a></li>";
					}
					var st = data.pageMaker.startPage;
					var end = data.pageMaker.endPage;
					for (st; st <= end; st++) {
						sstr4 += ("<li class='paginate_button page-item "+ ((data.pageMaker.cri.pageNum == st) ? "active": "") + "'><a class='page-link' onclick='searchQuery3(" + st + ")'>" + st + "</a></li>");
					}
					if (data.pageMaker.next) {
						sstr4 += "<li class='paginate_button next'><a class='page-link' onclick='searchQuery3("+ (data.pageMaker.endPage + 1)	+ ")'>다음</a></li>";
					}
					sstr4 += "</ul></div>";

					sstr5 += "<div class='row'>"
						+ "<div class='col-lg-12'>"
						+ "<div class='input-group mb-3'>"
								+ "<div>"
								+ "<button id='searchreset3' class='btn btn-dark'>목록으로</button>"
								+ "</div>"
								+ "<input type='hidden' id='type3' value='" + data.pageMaker.cri.type + "'>"
								+ "<input type='hidden' id='keyword3' value='" + data.pageMaker.cri.keyword + "'>"
								+ "<input type='hidden' id='pageNum' value='" + data.pageMaker.cri.pageNum + "'>"
								+ "</div>" + "</div>" + "</div><br>";
						sstr += sstr5;
						sstr += sstr4;
						$('#revtable3').html("");
						$('#revtable3').html(sstr);
				
			}
		});
		
	}

	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp"%>
	<div class="container" style="margin-top: 30px">
		<div class="container mt-3">
			<h2>리뷰 글 관리</h2>
			<br>
			<p>리뷰는 관리자 수정이 불가하고, 약관 위반이나 기타 법령 위반 게시글을 게시 불가 상태로 변경합니다.</p>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs">
				<li class="nav-item"><a id="tab1btn" class="nav-link"
					href="#tab1">기업리뷰</a></li>
				<li class="nav-item"><a id="tab2btn" class="nav-link"
					href="#tab2">연봉</a></li>
				<li class="nav-item"><a id="tab3btn" class="nav-link"
					href="#tab3">면접후기</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="tab1" class="container tab-pane">
					<br>
					<div id="revtable1"></div>
				</div>
				<div id="tab2" class="container tab-pane">
					<br>
					<div id="revtable2"></div>
				</div>
				<div id="tab3" class="container tab-pane">
					<br>
					<div id="revtable3"></div>
				</div>
			</div>
			<!-- Modal 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">처리 결과</h4>
							<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">확인</button>
						</div>
					</div>
					<!--  /.modal-content -->
				</div>
				<!--  /.modal-dialog -->
			</div>
			<!--  /.modal -->
		</div>
	</div>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
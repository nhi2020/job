package com.job.user.review.service;

public class ReviewUserVO {

	private int rnum;
	private String id;
	private String bsmno;
	private String mreview;
	private String review;
	private String sal;
	private String spot;
	private int b_cnt;
	private String reg_date;
	private String up_date;
	private String del_date;
	private String del_yn;
	private String m_status;
	private String m_difficultly;
	private String m_date;
	private String company;
	private String field;
	private int attachid;
	private String storedfilename;
	
	public String getStoredfilename() {
		return storedfilename;
	}
	public void setStoredfilename(String storedfilename) {
		this.storedfilename = storedfilename;
	}
	public int getAttachid() {
		return attachid;
	}
	public void setAttachid(int attachid) {
		this.attachid = attachid;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}

	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;

	private String avg_sal;
	private String max_sal;
	private String min_sal;
	private String per_sal;

	public String getAvg_sal() {
		return avg_sal;
	}

	public void setAvg_sal(String avg_sal) {
		this.avg_sal = avg_sal;
	}

	public String getMax_sal() {
		return max_sal;
	}

	public void setMax_sal(String max_sal) {
		this.max_sal = max_sal;
	}

	public String getMin_sal() {
		return min_sal;
	}

	public void setMin_sal(String min_sal) {
		this.min_sal = min_sal;
	}

	public String getPer_sal() {
		return per_sal;
	}

	public void setPer_sal(String per_sal) {
		this.per_sal = per_sal;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMreview() {
		return mreview;
	}

	public void setMreview(String mreview) {
		this.mreview = mreview;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getSal() {
		return sal;
	}

	public void setSal(String sal) {
		this.sal = sal;
	}

	public String getSpot() {
		return spot;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	public int getB_cnt() {
		return b_cnt;
	}

	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}

	public String getBsmno() {
		return bsmno;
	}

	public void setBsmno(String bsmno) {
		this.bsmno = bsmno;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUp_date() {
		return up_date;
	}

	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}

	public String getDel_date() {
		return del_date;
	}

	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public String getM_difficultly() {
		return m_difficultly;
	}

	public void setM_difficultly(String m_difficultly) {
		this.m_difficultly = m_difficultly;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

}

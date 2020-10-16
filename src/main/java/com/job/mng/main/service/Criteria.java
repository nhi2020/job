package com.job.mng.main.service;

public class Criteria {

	private int pageNum;
	private int amount;
	private String type;
	private String keyword;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	public Criteria(int pageNum, int amount, String keyword, String type) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.keyword = keyword;
		this.type = type;
		
	}
	
	
	
}

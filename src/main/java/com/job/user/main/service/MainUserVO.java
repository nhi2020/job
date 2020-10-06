package com.job.user.main.service;

public class MainUserVO {
	/*기업*/
	private String bsmno; 
	private String b_pass;
	private int bnum; 
	private String b_type; 
	private String company; 
	private String b_email; 
	private String ceo; 
	private String b_phone; 
	private String field; 
	private String addr; 
	private String attachid;
	private String b_reg_date; 
	private String b_up_date; 
	private String b_del_date; 
	private String b_del_yn;
	/*개인*/
	private String id;
	private String pass; 
	private int mnum; 
	private String type; 
	private String name; 
	private String gender; 
	private String email; 
	private String phone; 
	private String birthday; 
	private String career;
	private String m_attachid;
	private String reg_date; 
	private String up_date; 
	private String del_date; 
	private String del_yn;
	/*리뷰*/
	private int rnum; 
	private String r_id; 
	private String r_bsmno; 
	private String rev_type;
	private String review;
	private String sal;
	private String spot;
	private int b_cnt;
	private String r_reg_date;
	private String r_up_date;
	private String r_del_date;
	private String r_del_yn;
	private String m_status;
	private String m_difficultly;
	private String m_date;
	public String getBsmno() {
		return bsmno;
	}
	public void setBsmno(String bsmno) {
		this.bsmno = bsmno;
	}
	public String getB_pass() {
		return b_pass;
	}
	public void setB_pass(String b_pass) {
		this.b_pass = b_pass;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getB_phone() {
		return b_phone;
	}
	public void setB_phone(String b_phone) {
		this.b_phone = b_phone;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAttachid() {
		return attachid;
	}
	public void setAttachid(String attachid) {
		this.attachid = attachid;
	}
	public String getB_reg_date() {
		return b_reg_date;
	}
	public void setB_reg_date(String b_reg_date) {
		this.b_reg_date = b_reg_date;
	}
	public String getB_up_date() {
		return b_up_date;
	}
	public void setB_up_date(String b_up_date) {
		this.b_up_date = b_up_date;
	}
	public String getB_del_date() {
		return b_del_date;
	}
	public void setB_del_date(String b_del_date) {
		this.b_del_date = b_del_date;
	}
	public String getB_del_yn() {
		return b_del_yn;
	}
	public void setB_del_yn(String b_del_yn) {
		this.b_del_yn = b_del_yn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getM_attachid() {
		return m_attachid;
	}
	public void setM_attachid(String m_attachid) {
		this.m_attachid = m_attachid;
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
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_bsmno() {
		return r_bsmno;
	}
	public void setR_bsmno(String r_bsmno) {
		this.r_bsmno = r_bsmno;
	}
	public String getRev_type() {
		return rev_type;
	}
	public void setRev_type(String rev_type) {
		this.rev_type = rev_type;
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
	public String getR_reg_date() {
		return r_reg_date;
	}
	public void setR_reg_date(String r_reg_date) {
		this.r_reg_date = r_reg_date;
	}
	public String getR_up_date() {
		return r_up_date;
	}
	public void setR_up_date(String r_up_date) {
		this.r_up_date = r_up_date;
	}
	public String getR_del_date() {
		return r_del_date;
	}
	public void setR_del_date(String r_del_date) {
		this.r_del_date = r_del_date;
	}
	public String getR_del_yn() {
		return r_del_yn;
	}
	public void setR_del_yn(String r_del_yn) {
		this.r_del_yn = r_del_yn;
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

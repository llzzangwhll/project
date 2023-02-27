package com.example.headset0.model.buy;

import java.sql.Date;

public class BuyDTO {
	private int b_idx;
	private int bpc_idx;
	private Integer r_idx;
	private String p_code;
	private String p_name;
	private String m_id;
	private String m_name;
	private int money;
	private String m_phone;
	private String m_email;
	private String postcode;
	private String address;
	private String detailAddress;
	private Date b_date;
	private String review_yn;
	private String b_state;
	private int amounts;
	private int m_point;
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getBpc_idx() {
		return bpc_idx;
	}
	public void setBpc_idx(int bpc_idx) {
		this.bpc_idx = bpc_idx;
	}
	public Integer getR_idx() {
		return r_idx;
	}
	public void setR_idx(Integer r_idx) {
		this.r_idx = r_idx;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getReview_yn() {
		return review_yn;
	}
	public void setReview_yn(String review_yn) {
		this.review_yn = review_yn;
	}
	public String getB_state() {
		return b_state;
	}
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public int getAmounts() {
		return amounts;
	}
	public void setAmounts(int amounts) {
		this.amounts = amounts;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	@Override
	public String toString() {
		return "BuyDTO [b_idx=" + b_idx + ", bpc_idx=" + bpc_idx + ", r_idx=" + r_idx + ", p_code=" + p_code
				+ ", p_name=" + p_name + ", m_id=" + m_id + ", m_name=" + m_name + ", money=" + money + ", m_phone="
				+ m_phone + ", m_email=" + m_email + ", postcode=" + postcode + ", address=" + address
				+ ", detailAddress=" + detailAddress + ", b_date=" + b_date + ", review_yn=" + review_yn + ", b_state="
				+ b_state + ", amounts=" + amounts + ", m_point=" + m_point + "]";
	}
	
	
	
}


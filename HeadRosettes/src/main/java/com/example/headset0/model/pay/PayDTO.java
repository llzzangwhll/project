package com.example.headset0.model.pay;

import java.sql.Date;

public class PayDTO {
	private int pay_idx;
	private Integer r_idx;
	private String p_code;
	private String m_id;
	private String m_name;
	private String m_phone;
	private String m_email;
	private String address;
	private String detailAddress;
	private String p_name;
	private String p_image;
	private String postcode;
	private int p_price;
	private int amounts;
	private int money;
	private int m_point;
	private Date bpc_date;
	private int bpc_idx;
	private String b_state;
	private Date b_date; 
	private int used_point;
	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getAmounts() {
		return amounts;
	}
	public void setAmounts(int amounts) {
		this.amounts = amounts;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	public Date getBpc_date() {
		return bpc_date;
	}
	public void setBpc_date(Date bpc_date) {
		this.bpc_date = bpc_date;
	}
	public int getBpc_idx() {
		return bpc_idx;
	}
	public void setBpc_idx(int bpc_idx) {
		this.bpc_idx = bpc_idx;
	}
	public String getB_state() {
		return b_state;
	}
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public int getUsed_point() {
		return used_point;
	}
	public void setUsed_point(int used_point) {
		this.used_point = used_point;
	}
	@Override
	public String toString() {
		return "PayDTO [pay_idx=" + pay_idx + ", r_idx=" + r_idx + ", p_code=" + p_code + ", m_id=" + m_id + ", m_name="
				+ m_name + ", m_phone=" + m_phone + ", m_email=" + m_email + ", address=" + address + ", detailAddress="
				+ detailAddress + ", p_name=" + p_name + ", p_image=" + p_image + ", postcode=" + postcode
				+ ", p_price=" + p_price + ", amounts=" + amounts + ", money=" + money + ", m_point=" + m_point
				+ ", bpc_date=" + bpc_date + ", bpc_idx=" + bpc_idx + ", b_state=" + b_state + ", b_date=" + b_date
				+ ", used_point=" + used_point + "]";
	}
	
		
	
	
		
	
	
}

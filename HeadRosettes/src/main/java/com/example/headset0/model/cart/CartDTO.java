package com.example.headset0.model.cart;

public class CartDTO {
	private int cart_idx;
	private String p_code;
	private String m_id;
	private String m_name;
	private String p_name;
	private String p_image;
	private int p_price;
	private int amounts;
	private int money;
	private int m_point;
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
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
	
	
	@Override
	public String toString() {
		return "CartDTO [cart_idx=" + cart_idx + ", p_code=" + p_code + ", m_id=" + m_id + ", m_name=" + m_name
				+ ", p_name=" + p_name + ", p_image=" + p_image + ", p_price=" + p_price + ", amounts=" + amounts
				+ ", money=" + money + ", m_point=" + m_point + "]";
	}
	
	
	
	
}

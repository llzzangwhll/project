package com.example.headset0.model.product;


import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private String p_code;
	private String p_name;
	private int p_brand;
	private int p_price;
	private String p_image;
	private String p_detail_image;
	private int p_length;
	private int p_width;
	private int p_height;
	private int p_weight;
	private String p_color1;
	private String p_color2;
	private String p_color3;
	private float p_playtime;
	private String p_noise;
	private String p_line;
	private int cnt;
	private MultipartFile file1;
	private MultipartFile file2;
	private String p_brand_name;
	private int p_brand_idx;
	private int p_count;
	
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
	public int getP_brand() {
		return p_brand;
	}
	public void setP_brand(int p_brand) {
		this.p_brand = p_brand;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_detail_image() {
		return p_detail_image;
	}
	public void setP_detail_image(String p_detail_image) {
		this.p_detail_image = p_detail_image;
	}
	public int getP_length() {
		return p_length;
	}
	public void setP_length(int p_length) {
		this.p_length = p_length;
	}
	public int getP_width() {
		return p_width;
	}
	public void setP_width(int p_width) {
		this.p_width = p_width;
	}
	public int getP_height() {
		return p_height;
	}
	public void setP_height(int p_height) {
		this.p_height = p_height;
	}
	public int getP_weight() {
		return p_weight;
	}
	public void setP_weight(int p_weight) {
		this.p_weight = p_weight;
	}
	public String getP_color1() {
		return p_color1;
	}
	public void setP_color1(String p_color1) {
		this.p_color1 = p_color1;
	}
	public String getP_color2() {
		return p_color2;
	}
	public void setP_color2(String p_color2) {
		this.p_color2 = p_color2;
	}
	public String getP_color3() {
		return p_color3;
	}
	public void setP_color3(String p_color3) {
		this.p_color3 = p_color3;
	}
	public float getP_playtime() {
		return p_playtime;
	}
	public void setP_playtime(float p_playtime) {
		this.p_playtime = p_playtime;
	}
	public String getP_noise() {
		return p_noise;
	}
	public void setP_noise(String p_noise) {
		this.p_noise = p_noise;
	}
	public String getP_line() {
		return p_line;
	}
	public void setP_line(String p_line) {
		this.p_line = p_line;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public String getP_brand_name() {
		return p_brand_name;
	}
	public void setP_brand_name(String p_brand_name) {
		this.p_brand_name = p_brand_name;
	}
	public int getP_brand_idx() {
		return p_brand_idx;
	}
	public void setP_brand_idx(int p_brand_idx) {
		this.p_brand_idx = p_brand_idx;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	@Override
	public String toString() {
		return "ProductDTO [p_code=" + p_code + ", p_name=" + p_name + ", p_brand=" + p_brand + ", p_price=" + p_price
				+ ", p_image=" + p_image + ", p_detail_image=" + p_detail_image + ", p_length=" + p_length
				+ ", p_width=" + p_width + ", p_height=" + p_height + ", p_weight=" + p_weight + ", p_color1="
				+ p_color1 + ", p_color2=" + p_color2 + ", p_color3=" + p_color3 + ", p_playtime=" + p_playtime
				+ ", p_noise=" + p_noise + ", p_line=" + p_line + ", cnt=" + cnt + ", file1=" + file1 + ", file2="
				+ file2 + ", p_brand_name=" + p_brand_name + ", p_brand_idx=" + p_brand_idx + ", p_count=" + p_count
				+ "]";
	}
	
	
	
}

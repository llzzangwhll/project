package com.example.headset0.model.review;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	private int r_idx;
	private String p_code;
	private String r_title;
	private int pay_idx;
	private int b_idx;
	private String m_id;
	private String r_text;
	private String rre_text;
	private String rre_id;
	private Date rre_date;
	private String filename;
	private MultipartFile file1;
	private Date r_date;
	private Date bpc_date;
	private int r_viewcount;
	private String r_state;
	private int cnt;
	private int r_hit;
	private int like_count;
	private String like_val;
	private String p_name;
	private int re_bpc_idx;
	private int bpc_idx;
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getR_text() {
		return r_text;
	}
	public void setR_text(String r_text) {
		this.r_text = r_text;
	}
	public String getRre_text() {
		return rre_text;
	}
	public void setRre_text(String rre_text) {
		this.rre_text = rre_text;
	}
	public String getRre_id() {
		return rre_id;
	}
	public void setRre_id(String rre_id) {
		this.rre_id = rre_id;
	}
	public Date getRre_date() {
		return rre_date;
	}
	public void setRre_date(Date rre_date) {
		this.rre_date = rre_date;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public Date getBpc_date() {
		return bpc_date;
	}
	public void setBpc_date(Date bpc_date) {
		this.bpc_date = bpc_date;
	}
	public int getR_viewcount() {
		return r_viewcount;
	}
	public void setR_viewcount(int r_viewcount) {
		this.r_viewcount = r_viewcount;
	}
	public String getR_state() {
		return r_state;
	}
	public void setR_state(String r_state) {
		this.r_state = r_state;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getR_hit() {
		return r_hit;
	}
	public void setR_hit(int r_hit) {
		this.r_hit = r_hit;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getLike_val() {
		return like_val;
	}
	public void setLike_val(String like_val) {
		this.like_val = like_val;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getRe_bpc_idx() {
		return re_bpc_idx;
	}
	public void setRe_bpc_idx(int re_bpc_idx) {
		this.re_bpc_idx = re_bpc_idx;
	}
	public int getBpc_idx() {
		return bpc_idx;
	}
	public void setBpc_idx(int bpc_idx) {
		this.bpc_idx = bpc_idx;
	}
	@Override
	public String toString() {
		return "ReviewDTO [r_idx=" + r_idx + ", p_code=" + p_code + ", r_title=" + r_title + ", pay_idx=" + pay_idx
				+ ", b_idx=" + b_idx + ", m_id=" + m_id + ", r_text=" + r_text + ", rre_text=" + rre_text + ", rre_id="
				+ rre_id + ", rre_date=" + rre_date + ", filename=" + filename + ", file1=" + file1 + ", r_date="
				+ r_date + ", bpc_date=" + bpc_date + ", r_viewcount=" + r_viewcount + ", r_state=" + r_state + ", cnt="
				+ cnt + ", r_hit=" + r_hit + ", like_count=" + like_count + ", like_val=" + like_val + ", p_name="
				+ p_name + ", re_bpc_idx=" + re_bpc_idx + ", bpc_idx=" + bpc_idx + "]";
	}
	
	
}

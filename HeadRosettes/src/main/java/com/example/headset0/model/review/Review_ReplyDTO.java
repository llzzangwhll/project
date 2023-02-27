package com.example.headset0.model.review;

import java.util.Date;

public class Review_ReplyDTO {
	private int rre_idx;
	private int r_idx;
	private String rre_id;
	private String rre_text;
	private Date rre_date;
	private String p_code;
	
	public int getRre_idx() {
		return rre_idx;
	}
	public void setRre_idx(int rre_idx) {
		this.rre_idx = rre_idx;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getRre_id() {
		return rre_id;
	}
	public void setRre_id(String rre_id) {
		this.rre_id = rre_id;
	}
	public String getRre_text() {
		return rre_text;
	}
	public void setRre_text(String rre_text) {
		this.rre_text = rre_text;
	}
	public Date getRre_date() {
		return rre_date;
	}
	public void setRre_date(Date rre_date) {
		this.rre_date = rre_date;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	@Override
	public String toString() {
		return "Review_ReplyDTO [rre_idx=" + rre_idx + ", r_idx=" + r_idx + ", rre_id=" + rre_id + ", rre_text="
				+ rre_text + ", rre_date=" + rre_date + ", p_code=" + p_code + "]";
	}
	
	
	
	
	
	
}

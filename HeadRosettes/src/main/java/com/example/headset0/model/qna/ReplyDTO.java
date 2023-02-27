package com.example.headset0.model.qna;

import java.util.Date;

public class ReplyDTO {
	private int qre_idx;
	private String qre_text; 
	private String qre_writer; 
	private Date qre_date; 
	private String q_writer; 
	private int q_num;
	public int getQre_idx() {
		return qre_idx;
	}
	public void setQre_idx(int qre_idx) {
		this.qre_idx = qre_idx;
	}
	public String getQre_text() {
		return qre_text;
	}
	public void setQre_text(String qre_text) {
		this.qre_text = qre_text;
	}
	public String getQre_writer() {
		return qre_writer;
	}
	public void setQre_writer(String qre_writer) {
		this.qre_writer = qre_writer;
	}
	public Date getQre_date() {
		return qre_date;
	}
	public void setQre_date(Date qre_date) {
		this.qre_date = qre_date;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	@Override
	public String toString() {
		return "ReplyDTO [qre_idx=" + qre_idx + ", qre_text=" + qre_text + ", qre_writer=" + qre_writer + ", qre_date="
				+ qre_date + ", q_writer=" + q_writer + ", q_num=" + q_num + "]";
	}
	
	
	
	
}

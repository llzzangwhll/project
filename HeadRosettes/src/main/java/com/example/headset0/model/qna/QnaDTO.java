package com.example.headset0.model.qna;

import java.util.Arrays;
import java.util.Date;

public class QnaDTO {

	private int q_idx;
	private String q_writer;
	private String m_name;
	private String q_type; 
	private String q_title; 
	private String q_text; 
	private String q_pwd; 
	private String q_state; 
	private int q_hit; 
	private Date q_date; 
	private int reply_cnt;
	private String[] files;
	private int cnt;
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_text() {
		return q_text;
	}
	public void setQ_text(String q_text) {
		this.q_text = q_text;
	}
	public String getQ_pwd() {
		return q_pwd;
	}
	public void setQ_pwd(String q_pwd) {
		this.q_pwd = q_pwd;
	}
	public String getQ_state() {
		return q_state;
	}
	public void setQ_state(String q_state) {
		this.q_state = q_state;
	}
	public int getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "QnaDTO [q_idx=" + q_idx + ", q_writer=" + q_writer + ", m_name=" + m_name + ", q_type=" + q_type
				+ ", q_title=" + q_title + ", q_text=" + q_text + ", q_pwd=" + q_pwd + ", q_state=" + q_state
				+ ", q_hit=" + q_hit + ", q_date=" + q_date + ", reply_cnt=" + reply_cnt + ", files="
				+ Arrays.toString(files) + ", cnt=" + cnt + "]";
	}
	
	
	

	
}

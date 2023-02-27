package com.example.headset0.model.notice;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	//private 캡슐화
	private int n_idx;
	private String n_writer;
	private String n_title;
	private String n_text;
	private int n_viewcount;
	private Date n_date;
	private String n_image; 
	private MultipartFile file1;
	public int getN_idx() {
		return n_idx;
	}
	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_text() {
		return n_text;
	}
	public void setN_text(String n_text) {
		this.n_text = n_text;
	}
	public int getN_viewcount() {
		return n_viewcount;
	}
	public void setN_viewcount(int n_viewcount) {
		this.n_viewcount = n_viewcount;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public String getN_image() {
		return n_image;
	}
	public void setN_image(String n_image) {
		this.n_image = n_image;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "NoticeDTO [n_idx=" + n_idx + ", n_writer=" + n_writer + ", n_title=" + n_title + ", n_text=" + n_text
				+ ", n_viewcount=" + n_viewcount + ", n_date=" + n_date + ", n_image=" + n_image + ", file1=" + file1
				+ "]";
	}
	
	
	
	
}

package com.example.headset0.model.event;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;



public class EventDTO {
	private int e_idx;
	private String e_text;
	private String e_image;
	private Date e_date;
	private int e_viewcount;
	private String e_title;
	private MultipartFile file1;
	private String e_writer;
	private String[] files;
	private int cnt;
	public int getE_idx() {
		return e_idx;
	}
	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}
	public String getE_text() {
		return e_text;
	}
	public void setE_text(String e_text) {
		this.e_text = e_text;
	}
	public String getE_image() {
		return e_image;
	}
	public void setE_image(String e_image) {
		this.e_image = e_image;
	}
	public Date getE_date() {
		return e_date;
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	public int getE_viewcount() {
		return e_viewcount;
	}
	public void setE_viewcount(int e_viewcount) {
		this.e_viewcount = e_viewcount;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public String getE_writer() {
		return e_writer;
	}
	public void setE_writer(String e_writer) {
		this.e_writer = e_writer;
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
		return "EventDTO [e_idx=" + e_idx + ", e_text=" + e_text + ", e_image=" + e_image + ", e_date=" + e_date
				+ ", e_viewcount=" + e_viewcount + ", e_title=" + e_title + ", file1=" + file1 + ", e_writer="
				+ e_writer + ", files=" + Arrays.toString(files) + ", cnt=" + cnt + "]";
	}
	
	
	
}


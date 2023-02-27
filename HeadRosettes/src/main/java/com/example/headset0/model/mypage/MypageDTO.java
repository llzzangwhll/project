package com.example.headset0.model.mypage;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MypageDTO {

	private int all_idx;
	private String m_id;
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
	private int m_point;
	
	private int r_idx;
	private String p_code;
	private String r_title;
	private int pay_idx;
	private int b_idx;
	private String r_text;
	private String rre_text;
	private String rre_id;
	private Date rre_date;
	private String filename;
	private MultipartFile file1;
	private Date r_date;
	private int r_viewcount;
	private String r_state;
	private int cnt;
	private int r_hit;
	private int like_count;
	private String like_val;
	public int getAll_idx() {
		return all_idx;
	}
	public void setAll_idx(int all_idx) {
		this.all_idx = all_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
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
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
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
	@Override
	public String toString() {
		return "MypageDTO [all_idx=" + all_idx + ", m_id=" + m_id + ", q_idx=" + q_idx + ", q_writer=" + q_writer
				+ ", m_name=" + m_name + ", q_type=" + q_type + ", q_title=" + q_title + ", q_text=" + q_text
				+ ", q_pwd=" + q_pwd + ", q_state=" + q_state + ", q_hit=" + q_hit + ", q_date=" + q_date
				+ ", reply_cnt=" + reply_cnt + ", files=" + Arrays.toString(files) + ", m_point=" + m_point + ", r_idx="
				+ r_idx + ", p_code=" + p_code + ", r_title=" + r_title + ", pay_idx=" + pay_idx + ", b_idx=" + b_idx
				+ ", r_text=" + r_text + ", rre_text=" + rre_text + ", rre_id=" + rre_id + ", rre_date=" + rre_date
				+ ", filename=" + filename + ", file1=" + file1 + ", r_date=" + r_date + ", r_viewcount=" + r_viewcount
				+ ", r_state=" + r_state + ", cnt=" + cnt + ", r_hit=" + r_hit + ", like_count=" + like_count
				+ ", like_val=" + like_val + "]";
	}
	
	
	
}

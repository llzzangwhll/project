package com.example.headset0.model.notice;

import java.util.List;

public interface NoticeDAO {
	List<NoticeDTO> list(int start, int end);
	int count();
	NoticeDTO detail(int n_idx);
	void update(NoticeDTO dto); 
	void delete(int n_idx);
	void insert(NoticeDTO dto);
	void increase_n_viewcount(int n_idx);
	String file_info(int n_idx);
}

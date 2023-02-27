package com.example.headset0.service.review;

import java.util.List;

import com.example.headset0.model.review.ReviewDTO;


public interface ReviewService {
	List<ReviewDTO> list(int start, int end,
	String search_option, String keyword);
	void insert(ReviewDTO dto);
	ReviewDTO detail(int r_idx, String m_id);
	ReviewDTO detail_2(int r_idx);
	void increase_r_viewcount(int r_idx);
	void update(ReviewDTO dto);
	void delete(int r_idx);
	int count(String search_option, String keyword);
	void sort(int r_idx);
}

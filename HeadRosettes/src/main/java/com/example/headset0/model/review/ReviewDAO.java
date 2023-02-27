package com.example.headset0.model.review;
import java.util.List;

public interface ReviewDAO {
	List<ReviewDTO> list(int start, int end, String search_option, String keyword);
	void insert(ReviewDTO dto);
	ReviewDTO detail(int r_idx, String m_id);
	ReviewDTO detail_2(int r_dix);
	void increase_r_viewcount(int r_idx);
	void update(ReviewDTO dto);
	void delete(int idx);
	int count(String search_option, String keyword);
	List<String> list_r_attach(int r_idx);
	void insert_r_attach(String r_filename);
	void update_r_attach(String r_filename, int r_idx);
	void delete_r_attach(String r_filename);
	void r_sort(int r_idx);
	List<ReviewDTO> spe_list(String p_code);
	void increase_hit(int r_idx);
	void likeUp(String m_id, int r_idx, String likeVal);
	void likeDown(String m_id, int r_idx, String likeVal);
	int count_like(int r_idx);
	void like_insert(int r_idx);
	void like_delete(int r_idx);
}

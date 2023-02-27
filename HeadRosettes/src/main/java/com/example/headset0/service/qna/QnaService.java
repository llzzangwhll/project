package com.example.headset0.service.qna;

import java.util.List;

import com.example.headset0.model.qna.QnaDTO;

public interface QnaService {
	
	List<QnaDTO> list(int start, int end, String search_option, String keyword);
	void insert (QnaDTO dto);
	QnaDTO detail(int q_idx);
	void increase_hit(int q_idx);
	void update(QnaDTO dto);
	void delete(int q_idx);
	void insert_attach(String file_name);
    int count(String search_option, String keyword);
	List<String> list_attach(int q_idx);
	void delete_attach(String file_name);
	void update_q_state(int q_idx, String q_state);
 

}

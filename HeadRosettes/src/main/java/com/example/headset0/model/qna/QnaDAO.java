package com.example.headset0.model.qna;

import java.util.List;

public interface QnaDAO {


	List<QnaDTO> list(int start, int end, String search_option, String keyword);
	void insert(QnaDTO dto); 
	QnaDTO detail(int q_idx); 
	void increase_hit(int q_idx); 
	void update(QnaDTO dto);
    void delete(int q_idx); 
    int count(String search_option, String keyword);
    List<String> list_attach(int q_idx);
    void insert_attach(String file_name);  
    void update_attach(String file_name, int q_idx); 
    void delete_attach(String file_name);
    boolean check_q_pwd(int q_idx, String q_pwd );
    void update_q_state(int q_idx, String q_state);
}

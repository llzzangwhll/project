package com.example.headset0.model.qna;

import java.util.List;


public interface ReplyDAO {
	
	List<ReplyDTO> list(int q_num);
	int count(int q_num);
	void insert(ReplyDTO dto);
	void update(ReplyDTO dto);
	void delete(int qre_idx);
	ReplyDTO detail(int qre_idx);

}


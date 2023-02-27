package com.example.headset0.model.review;

import java.util.List;

public interface Review_ReplyDAO {
	List<Review_ReplyDTO> list(int r_idx);
	int count(int board_idx);
	void insert(Review_ReplyDTO dto);
	void update(Review_ReplyDTO dto);
	void delete(int rre_idx);
	Review_ReplyDTO detail(int rre_idx);
}

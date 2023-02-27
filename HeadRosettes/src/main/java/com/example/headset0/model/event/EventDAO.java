package com.example.headset0.model.event;

import java.util.List;

public interface EventDAO {
	List<EventDTO> list(int start, int end,	String search_option, String keyword);
	EventDTO detail(int e_idx);
	void update(EventDTO dto);
	void delete(int e_idx);
	void insert(EventDTO dto);
	void e_viewcount(int e_idx);
	String file_info(int e_idx);
	int count(String search_option, String keyword);
}

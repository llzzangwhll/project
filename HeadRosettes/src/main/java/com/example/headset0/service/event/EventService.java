package com.example.headset0.service.event;


import java.util.List;

import com.example.headset0.model.event.EventDTO;


public interface EventService {
	List<EventDTO> list(int start, int end,	String search_option, String keyword);
	void insert(EventDTO dto);
	EventDTO detail(int e_idx);
	void e_viewcount(int e_idx);
	void update(EventDTO dto);
	void delete(int e_idx);	
	int count(String search_option, String keyword);
}

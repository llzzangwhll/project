package com.example.headset0.service.event;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.headset0.model.event.EventDAO;
import com.example.headset0.model.event.EventDTO;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDAO eventDao;

	@Override
	public List<EventDTO> list(int start, int end, String search_option, String keyword) {
		return eventDao.list(start,end,search_option,keyword);

	}
	@Transactional
	@Override
	public void insert(EventDTO dto) {
		eventDao.insert(dto);
	}

	@Override
	public EventDTO detail(int e_idx) {
		return eventDao.detail(e_idx);
	}

	@Override
	public void e_viewcount(int e_idx) {
		eventDao.e_viewcount(e_idx);

	}
	@Transactional
	@Override
	public void update(EventDTO dto) {
		eventDao.update(dto);

	}

	@Override
	public void delete(int e_idx) {
		eventDao.delete(e_idx);

	}
	
	@Override
	public int count(String search_option, String keyword) {
	return eventDao.count(search_option, keyword);
	}

}

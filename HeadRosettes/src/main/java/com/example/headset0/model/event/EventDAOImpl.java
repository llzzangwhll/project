package com.example.headset0.model.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<EventDTO> list(int start, int end,	String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("event.list", map);
	}

	@Override
	public EventDTO detail(int e_idx) {
		return sqlSession.selectOne("event.detail", e_idx);
	}

	@Override
	public void update(EventDTO dto) {
		sqlSession.update("event.update", dto);

	}

	@Override
	public void delete(int e_idx) {
		sqlSession.delete("event.delete", e_idx);
	}

	@Override
	public void insert(EventDTO dto) {
		sqlSession.insert("event.insert", dto);

	}

	@Override
	public void e_viewcount(int e_idx) {
		sqlSession.update("event.e_viewcount", e_idx);
	}
	
	@Override
	public String file_info(int e_idx) {
		return sqlSession.selectOne("event.file_info", e_idx);
	}
	
	@Override
	public int count(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("event.count", map);
	}

}

package com.example.headset0.model.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository 
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<NoticeDTO> list(int start, int end) {
		Map<String, Object> map =new HashMap<>();
		map.put("start", start-1);
		map.put("end", end);
		return sqlSession.selectList("notice.list", map);
	}
	
	@Override
	   public int count() {
	      return sqlSession.selectOne("notice.count");
	   }

	@Override
	public NoticeDTO detail(int n_idx) {
		return sqlSession.selectOne("notice.detail", n_idx);
	}

	@Override
	public void update(NoticeDTO dto) {
		sqlSession.update("notice.update", dto);

	}

	@Override
	public void delete(int n_idx) {
		sqlSession.delete("notice.delete", n_idx);

	}

	@Override
	public void insert(NoticeDTO dto) {
		sqlSession.insert("notice.insert", dto);

	}

	@Override
	public String file_info(int n_idx) {
		return sqlSession.selectOne("notice.file_info", n_idx);
	}
	
	@Override
	public void increase_n_viewcount(int n_idx) {
		sqlSession.update("notice.increase_n_viewcount", n_idx);
		
	}

}

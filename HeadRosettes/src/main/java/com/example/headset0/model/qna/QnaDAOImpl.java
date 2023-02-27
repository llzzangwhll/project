package com.example.headset0.model.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<QnaDTO> list(int start, int end,String search_option, String keyword) {
		Map <String, Object> map =new HashMap<>();
		map.put("start", start-1);
		map.put("end", end);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectList("qna.list", map);
	}

	@Override
	public void insert(QnaDTO dto) {
		sqlSession.insert("qna.insert", dto);

	}

	@Override
	public QnaDTO detail(int q_idx) {
		return sqlSession.selectOne("qna.detail", q_idx);
	}

	@Override
	public void increase_hit(int q_idx) {
		sqlSession.update("qna.increase_hit", q_idx);

	}

	@Override
	public void update(QnaDTO dto) {
		sqlSession.update("qna.update", dto);


	}

	@Override
	public void delete(int q_idx) {
		sqlSession.delete("qna.delete", q_idx);

	}

	@Override
	public int count(String search_option, String keyword) {
		
		  Map<String, Object> map = new HashMap<>(); 
		  map.put("search_option",search_option); 
		  map.put("keyword", keyword);
		 
		return sqlSession.selectOne("qna.count", map);
	}

	@Override
	public List<String> list_attach(int q_idx) {
		return sqlSession.selectList("qna.list_attach", q_idx);
	}

	@Override
	public void insert_attach(String file_name) {
		sqlSession.insert("qna.insert_attach", file_name);

	}

	@Override
	public void update_attach(String file_name, int q_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("file_name", file_name);
		map.put("q_idx", q_idx);
		sqlSession.insert("qna.update_attach", map);

	}

	@Override
	public void delete_attach(String file_name) {
		sqlSession.delete("qna.delete_attach", file_name);


	}

	@Override
	public boolean check_q_pwd(int q_idx, String q_pwd) {
		boolean result = false;
		Map<String, Object> map = new HashMap<>();
		map.put("q_idx", q_idx);
		map.put("q_pwd", q_pwd);
		int count = sqlSession.selectOne("qna.check_q_pwd", map);
		System.out.println(count);
		if (count == 1)
			result = true;
		return result;
	}

	@Override
	public void update_q_state(int q_idx, String q_state) {
		Map<String, Object> map = new HashMap<>();
		map.put("q_idx", q_idx);
		map.put("q_state", q_state);

		sqlSession.update("qna.update_q_state", map);

	}

}

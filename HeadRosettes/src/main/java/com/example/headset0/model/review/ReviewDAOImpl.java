package com.example.headset0.model.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ReviewDTO> spe_list(String p_code){
		 return sqlSession.selectList("review.spe_list", p_code);
	}
	
	@Override
	public void likeUp(String m_id, int r_idx, String likeVal) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("r_idx", r_idx);
		map.put("likeVal", likeVal);
		sqlSession.insert("review.likeUp", map);
		
	}
	
	@Override
	public void likeDown(String m_id, int r_idx, String likeVal) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("r_idx", r_idx);
		map.put("likeVal", likeVal);
		sqlSession.delete("review.likeDown", map);
	}
	
	@Override
	public void like_insert(int r_idx) {
		sqlSession.update("review.like_insert", r_idx);
	}
	
	@Override
	public void like_delete(int r_idx) {
		sqlSession.update("review.like_delete", r_idx);
	}
	
	
	
	
	@Override
	public List<ReviewDTO> list(int start, int end, String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start-1);
		map.put("end", end);
		return sqlSession.selectList("review.list", map);
		
	}

	@Override
	public void insert(ReviewDTO dto) {
		sqlSession.insert("review.insert", dto);

	}
	
	@Override
	public void increase_hit(int r_idx) {
		sqlSession.update("review.increase_hit", r_idx);
	}

	@Override
	public ReviewDTO detail(int r_idx, String m_id) {
		System.out.println("reviewDAOimpl :" + m_id );
		Map<String, Object> map = new HashMap<>();
		map.put("r_idx", r_idx);
		map.put("m_id", m_id);
		return sqlSession.selectOne("review.detail", map);
	}
	
	@Override
	public ReviewDTO detail_2(int r_idx) {
		return sqlSession.selectOne("review.detail_2", r_idx);
	}

	@Override
	public void increase_r_viewcount(int r_idx) {
		sqlSession.update("review.increase_r_viewcount", r_idx);
	}

	@Override
	public void update(ReviewDTO dto) {
		sqlSession.update("review.update", dto);
	}

	@Override
	public void delete(int idx) {
		sqlSession.delete("review.delete", idx);
	}

	@Override
	public int count(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("review.count", map);
	}

	@Override
	public List<String> list_r_attach(int r_idx) {
		return sqlSession.selectList("review.list_attach",r_idx);
	}

	@Override
	public void insert_r_attach(String r_filename) {
		sqlSession.insert("review.insert_attach", r_filename);
	}

	@Override
	public void update_r_attach(String r_filename, int r_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("r_filename", r_filename);
		map.put("r_idx", r_idx);
		sqlSession.insert("review.update_r_attach", map);
	}

	@Override
	public void delete_r_attach(String r_filename) {
		sqlSession.delete("review.delete_r_attach", r_filename);
	}
	
	@Override
	public void r_sort(int r_idx) {
		sqlSession.update("review.sort", r_idx);
	}
	
	
	@Override
	public int count_like(int r_idx) {
		return sqlSession.selectOne("review.count_like", r_idx);
	}
}

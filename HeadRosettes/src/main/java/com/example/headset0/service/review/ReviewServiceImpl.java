package com.example.headset0.service.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.headset0.model.review.ReviewDAO;
import com.example.headset0.model.review.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDao;
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ReviewDTO> list(int start, int end, String search_option, String keyword) {
		return reviewDao.list(start, end, search_option, keyword);
	}

	@Transactional
	@Override
	public void insert(ReviewDTO dto) {
		sqlSession.insert("review.insert", dto);
	}


	 
	@Override
	public ReviewDTO detail(int r_idx, String m_id) {
		return reviewDao.detail(r_idx, m_id);
	}
	
	 
	@Override
	public ReviewDTO detail_2(int r_idx) {
	    return reviewDao.detail_2(r_idx);
		}

	@Override
	public void increase_r_viewcount(int r_idx) {
		reviewDao.increase_r_viewcount(r_idx);
	}

	@Transactional
	@Override
	public void update(ReviewDTO dto) {
		reviewDao.update(dto);
		}


	@Override
	public void delete(int r_idx) {
		reviewDao.delete(r_idx);
	}

	@Override
	public int count(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("review.count", map);
	}

	public void sort(int r_idx) {
		reviewDao.r_sort(r_idx);
	}

}

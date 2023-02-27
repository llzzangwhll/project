package com.example.headset0.model.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Review_ReplyDAOImpl implements Review_ReplyDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Review_ReplyDTO> list(int r_idx) {
		List<Review_ReplyDTO> list = sqlSession.selectList("review_reply.list", r_idx);
		return list;
	}

	@Override
	public int count(int r_idx) {
		return sqlSession.selectOne("review_reply.count", r_idx);
	}

	@Override
	public void insert(Review_ReplyDTO dto) {
		sqlSession.insert("review_reply.insert", dto);
	}

	@Override
	public void update(Review_ReplyDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int rre_idx) {
		// TODO Auto-generated method stub

	}

	@Override
	public Review_ReplyDTO detail(int rre_idx) {
		// TODO Auto-generated method stub
		return null;
	}

}

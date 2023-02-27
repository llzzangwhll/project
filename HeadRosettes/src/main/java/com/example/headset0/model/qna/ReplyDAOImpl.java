package com.example.headset0.model.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ReplyDTO> list(int q_num) {
		 List<ReplyDTO> list=sqlSession.selectList("reply.list",q_num);
         return list;
	}

	@Override
	public int count(int q_num) {
		return sqlSession.selectOne("reply.count", q_num);
	}

	@Override
	public void insert(ReplyDTO dto) {
		sqlSession.insert("reply.insert", dto);

	}

	@Override
	public void update(ReplyDTO dto) {
		sqlSession.update("reply.update", dto);
	}

	@Override
	public void delete(int qre_idx) {
		sqlSession.delete("reply.delete", qre_idx);

	}

	@Override
	public ReplyDTO detail(int qre_idx) {
		return sqlSession.selectOne("reply.detail", qre_idx);
	}

}

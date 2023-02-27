package com.example.headset0.model.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.headset0.model.buy.BuyDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MypageDTO> all_list() {
		return sqlSession.selectList("mypage.all_list");
	}

	@Override
	public List<MypageDTO> qna_list(String m_id) {
		return sqlSession.selectList("mypage.qna_list", m_id);
	}

	@Override
	public List<MypageDTO> review_list(String m_id) {
		return sqlSession.selectList("mypage.review_list", m_id);
	}
	
	@Override
	public List<MypageDTO> my_main(String m_id) {
		return sqlSession.selectList("mypage.my_main", m_id);
	}
	
	@Override
	public List<BuyDTO> purchase_list(String m_id) {
		return sqlSession.selectList("buy.purchase_list", m_id);
	}

}

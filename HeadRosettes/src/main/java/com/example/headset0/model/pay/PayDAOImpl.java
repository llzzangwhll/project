package com.example.headset0.model.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.headset0.model.buy.BuyDTO;



@Repository //저장소
public class PayDAOImpl implements PayDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public PayDTO to_review(int bpc_idx) {
		return sqlSession.selectOne("pay.to_review", bpc_idx);
		
	}

	@Override
	public List<PayDTO> list(String m_id) {
		return sqlSession.selectList("pay.list", m_id);
	}
	
	
	@Override
	public List<PayDTO> p_code_list(String m_id) {
		return sqlSession.selectList("pay.p_code_list",m_id);
	}
	 
	
	@Override
	public void buy_update(PayDTO dto) {
		sqlSession.update("pay.buy_update", dto);
		
	}
	
	
	
	@Override
	public void insert_p_code(PayDTO dto) {
		sqlSession.insert("pay.insert_p_code",dto);
	}
	
	
	
	@Override
	public void insert(PayDTO dto) {
		sqlSession.insert("pay.insert", dto);

	}

	@Override
	public void delete_all(String m_id) {
		sqlSession.delete("pay.delete_all", m_id);

	}

	
	@Override
	   public void update_count(PayDTO dto) {
	      sqlSession.update("product.update_count", dto);
	   }
	
	
	@Override 
	public int count(String m_id) {
		return sqlSession.selectOne("pay.count", m_id);
	}
	
	
	@Override
	public int sum_money(String m_id) {
		return sqlSession.selectOne("pay.sum_money", m_id);
	}
	
	@Override
	public int m_point(String m_id) {
		return sqlSession.selectOne("pay.m_point", m_id);
	}
}

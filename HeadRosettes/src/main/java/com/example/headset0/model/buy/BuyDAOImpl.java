package com.example.headset0.model.buy;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository
public class BuyDAOImpl implements BuyDAO {
	@Autowired
	SqlSession sqlSession;

	
	@Override
	public void buy_delete(int b_idx) {
		sqlSession.delete("buy.delete", b_idx);

	}
	
	
	@Override
	public void buy_delete_all(String m_id) {
		sqlSession.delete("buy.delete_all", m_id);
	}

	@Override
	public List<BuyDTO> buy_list(String m_id) {
		return sqlSession.selectList("buy.buy_list", m_id);
	}
	
	
	@Override
	public List<BuyDTO> b_idx(String m_id) {
		return sqlSession.selectList("buy.b_idx", m_id);
	}
	
	
	@Override
	public void buy_insert(BuyDTO dto) {
		sqlSession.insert("buy.insert", dto);
	}
	
	
	
	@Override
	   public void update_b_state(BuyDTO dto) {
	      sqlSession.update("buy.update_b_state", dto);
	   }
	
	
	
}

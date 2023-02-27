package com.example.headset0.model.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<CartDTO> cart_money() {
		return sqlSession.selectList("cart.cart_money");
	}

	@Override
	public void insert(CartDTO dto) {
		sqlSession.insert("cart.insert", dto);

	}

	@Override
	public List<CartDTO> list(String m_id) {
		return sqlSession.selectList("cart.list", m_id);
	}

	@Override
	public void delete(int cart_idx) {
		sqlSession.delete("cart.delete", cart_idx);


	}

	@Override
	public void delete_all(String m_id) {
		sqlSession.delete("cart.delete_all", m_id);

	}

	@Override
	public int sum_money(String m_id) {
		sqlSession.selectOne("cart.sum_money", m_id);
		return sqlSession.selectOne("cart.sum_money", m_id);
	}

	@Override 
	public void modify(CartDTO dto) {
		sqlSession.update("cart.modify", dto);
	}
	
	@Override
	public void update(CartDTO dto) {
		sqlSession.update("cart.update", dto);
	}
	
	@Override
	public int count(String p_code, String m_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_code", p_code);
		map.put("m_id", m_id);
		return sqlSession.selectOne("cart.count",map);
	}
	
	@Override
	public String file_info(int cart_idx) {
		return sqlSession.selectOne("cart.file_info", cart_idx);
	}

}

package com.example.headset0.service.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.headset0.model.cart.CartDAO;
import com.example.headset0.model.cart.CartDTO;


@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO cartDao;
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void delete(int cart_idx) {
		cartDao.delete(cart_idx);
	}
	
	@Override
	public void insert(CartDTO dto) {
		cartDao.insert(dto);
	}
	
	@Override
	public int count(String p_code, String m_id) {
		return cartDao.count(p_code, m_id);
	}
	
	@Override
	public void update(CartDTO dto) {
		cartDao.update(dto);
	}
	
	@Override
	public void modify(CartDTO dto) {
		sqlSession.update("cart.modify", dto);
	}
}

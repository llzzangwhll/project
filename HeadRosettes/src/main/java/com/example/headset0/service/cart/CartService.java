package com.example.headset0.service.cart;

import com.example.headset0.model.cart.CartDTO;

public interface CartService {
	public void delete(int cart_idx);
	public void insert(CartDTO dto);
	public int count(String p_code, String m_id);
	public void update(CartDTO dto);
	public void modify(CartDTO dto);
}

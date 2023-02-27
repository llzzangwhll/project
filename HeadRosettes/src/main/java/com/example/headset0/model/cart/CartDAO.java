package com.example.headset0.model.cart;


import java.util.List;

public interface CartDAO {
	List<CartDTO> cart_money();
	void insert(CartDTO dto);
	List<CartDTO> list(String m_id);
	void delete(int cart_idx);
	void delete_all(String m_id);
	int sum_money(String m_id);
	void modify(CartDTO dto);
	void update(CartDTO dto);
	int count(String p_code, String m_id);
	String file_info(int cart_idx);
}

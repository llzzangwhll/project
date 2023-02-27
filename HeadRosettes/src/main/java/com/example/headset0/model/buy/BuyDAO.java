package com.example.headset0.model.buy;

import java.util.List;


public interface BuyDAO {
	List<BuyDTO> buy_list(String m_id);
	List<BuyDTO> b_idx(String m_id);
	void buy_insert(BuyDTO dto);
	void buy_delete_all(String m_id);
	void buy_delete(int b_idx);
	void update_b_state(BuyDTO dto);
}

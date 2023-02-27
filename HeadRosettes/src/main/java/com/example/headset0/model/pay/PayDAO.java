package com.example.headset0.model.pay;

import java.util.List;

public interface PayDAO {
	List<PayDTO> list(String m_id);
	List<PayDTO> p_code_list(String m_id);
	PayDTO to_review(int bpc_idx);
	void buy_update(PayDTO dto);
	void insert_p_code(PayDTO dto);
	void insert(PayDTO dto);
	void delete_all(String m_id);
	void update_count(PayDTO dto);
	int count(String m_id);
	int sum_money(String m_id);
	int m_point(String m_id);
}

package com.example.headset0.model.mypage;

import java.util.List;

import com.example.headset0.model.buy.BuyDTO;

public interface MypageDAO {
	
	List<MypageDTO> all_list();
	List<MypageDTO> qna_list(String m_id);
	List<MypageDTO> review_list(String m_id);
	List<MypageDTO> my_main(String m_id);
	List<BuyDTO> purchase_list(String m_id);
}

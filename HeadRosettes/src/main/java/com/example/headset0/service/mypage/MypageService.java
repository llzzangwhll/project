package com.example.headset0.service.mypage;

import java.util.List;

import com.example.headset0.model.mypage.MypageDTO;

public interface MypageService {
	
	List<MypageDTO> all_list();
	List<MypageDTO> review_list();
	List<MypageDTO> qna_list(String m_id);

}

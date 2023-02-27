package com.example.headset0.service.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.headset0.model.mypage.MypageDAO;
import com.example.headset0.model.mypage.MypageDTO;
import com.example.headset0.model.qna.QnaDAO;

@Service
public class MypageServiceImpl implements MypageService {

	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	MypageDAO mypageDao;
	
	@Autowired
    QnaDAO qnaDao;
		
	@Override
	public List<MypageDTO> all_list() {
		 return mypageDao.all_list();
	}

	@Override
	public List<MypageDTO> review_list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MypageDTO> qna_list(String m_id) {
		return mypageDao.qna_list(m_id);
	}

}

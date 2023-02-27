package com.example.headset0.model.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDAO noticeDao;

	@Override
	public void increase_n_viewcount(int n_idx) {
		noticeDao.increase_n_viewcount(n_idx);

	}


}

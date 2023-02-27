package com.example.headset0.service.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.headset0.model.qna.QnaDAO;
import com.example.headset0.model.qna.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	QnaDAO qnaDao;
	
	@Override
	public List<QnaDTO> list(int start, int end, String search_option, String keyword) {
		
		return qnaDao.list(start, end,search_option,keyword);
	}
	
	@Override
	public int count(String search_option, String keyword) {
		return qnaDao.count(search_option, keyword);
		
	}

	@Override
	public void insert(QnaDTO dto) {
		  qnaDao.insert(dto);
		     String[] files =dto.getFiles(); 
		     if(files == null)
		    	 return;   
		     for (String file_name : files) {
		    	 qnaDao.insert_attach(file_name);
		     }
	}

	@Override
	public QnaDTO detail(int q_idx) {
		return qnaDao.detail(q_idx);
	}

	@Override
	public void increase_hit(int q_idx) {
		qnaDao.increase_hit(q_idx);
	}

	@Override
	public void update(QnaDTO dto) {
		qnaDao.update(dto); 
		String[] files =dto.getFiles();
		if(files == null)
			return;
		for (String file_name : files) {
			qnaDao.update_attach(file_name,dto.getQ_idx());
			
		}

	}

	@Override
	public void delete(int q_idx) {
		qnaDao.delete(q_idx);
	}

	@Override
	public void insert_attach(String file_name) {
		sqlSession.insert("qna.insert_attach",file_name);

	}

	@Override
	public List<String> list_attach(int q_idx) {
		return qnaDao.list_attach(q_idx);
	}

	@Override
	public void delete_attach(String file_name) {
		qnaDao.delete_attach(file_name);

	}

	@Override
	public void update_q_state(int q_idx, String q_state) {
		qnaDao.update_q_state(q_idx, q_state); 

	}

}

package com.example.headset0.service.compare;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.headset0.model.compare.CompareDAO;
import com.example.headset0.model.compare.CompareDTO;

@Service
public class CompareServiceImpl implements CompareService {

	@Autowired
	CompareDAO compareDao;
		
	
	@Override
	public List<CompareDTO> list(CompareDTO p_brand) {
		return compareDao.list(p_brand);
	}

}

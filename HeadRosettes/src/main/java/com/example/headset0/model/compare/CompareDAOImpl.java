package com.example.headset0.model.compare;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompareDAOImpl implements CompareDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<CompareDTO> list(CompareDTO p_brand) {
		List<CompareDTO> items = sqlSession.selectList("compare.list", p_brand);
		return items;
	}
	
	@Override
	public CompareDTO sel(String p_name){
		CompareDTO sel1 = sqlSession.selectOne("compare.sel",p_name);
		return sel1;
	}
	
	@Override
	public List<CompareDTO> brand_list(){
		List<CompareDTO> brandlist = sqlSession.selectList("compare.brand_list");
		return brandlist;
	}
}


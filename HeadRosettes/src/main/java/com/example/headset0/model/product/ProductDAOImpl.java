package com.example.headset0.model.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ProductDTO> list(int start, int end, String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start - 1);
		map.put("end", end);
		return sqlSession.selectList("product.list", map);
	}

	@Override
	public List<ProductDTO> list_filter(int start, int end, String search_option, String keyword, int p_brand,
			int p_price, String p_noise, String p_line) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start - 1);
		map.put("end", end);
		map.put("p_brand", p_brand);
		map.put("p_price", p_price);
		map.put("p_noise", p_noise);
		map.put("p_line", p_line);
		return sqlSession.selectList("product.list_filter", map);
	}

	
	
	@Override
	public List<ProductDTO> best_list() {
	   return sqlSession.selectList("product.best_list");
	 }
	

	
	@Override
	public int count(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("product.count", map);
	}
	
	@Override
	public int filter_count(String search_option, String keyword, int p_brand, int p_price, String p_noise, String p_line) {
		Map<String, Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("p_brand", p_brand);
		map.put("p_price", p_price);
		map.put("p_noise", p_noise);
		map.put("p_line", p_line);
		return sqlSession.selectOne("product.filter_count", map);
	}
	
	@Override
	public int brand_count(String search_option, String keyword, int p_brand) {
		Map<String, Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("p_brand", p_brand);
		return sqlSession.selectOne("product.brand_count", map);
	}
	

	@Override
	public void delete(String p_code) {
		sqlSession.delete("product.delete", p_code);

	}

	@Override
	public void insert(ProductDTO dto) {
		sqlSession.insert("product.insert", dto);

	}

	@Override
	public void update(ProductDTO dto) {
		sqlSession.update("product.update", dto);

	}

	@Override
	public ProductDTO detail(String p_code) {
		return sqlSession.selectOne("product.detail", p_code);
	}

	@Override
	public String file_info(String p_code) {
		return sqlSession.selectOne("product.file_info", p_code);
	}

	@Override
	public String file_detail_info(String p_code) {
		return sqlSession.selectOne("product.file_detail_info", p_code);
	}

	@Override
	public List<ProductDTO> brand_list(int start, int end, String search_option, String keyword, int p_brand) {
		Map<String, Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start-1);
		map.put("end", end);
		map.put("p_brand", p_brand);
		return sqlSession.selectList("product.brand_list", map);
	}


	@Override
	public List<ProductDTO> brand_name() {
		return sqlSession.selectList("product.brand_name");
	}
}

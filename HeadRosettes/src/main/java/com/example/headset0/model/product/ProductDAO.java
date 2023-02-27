package com.example.headset0.model.product;

import java.util.List;

public interface ProductDAO {
	
	List<ProductDTO> list(int start, int end, String search_option, String keyword);
	List<ProductDTO> list_filter(int start, int end, String search_option, String keyword, int p_brand, int p_price, String p_noise, String p_line);
	List<ProductDTO> brand_list(int start, int end, String search_option, String keyword, int p_brand);
	List<ProductDTO> brand_name();
	List<ProductDTO> best_list();
	int count(String search_option, String keyword);
	int filter_count(String search_option, String keyword, int p_brand, int p_price, String p_noise, String p_line);
	int brand_count(String search_option, String keyword, int p_brand);
	ProductDTO detail(String p_code);
	void insert(ProductDTO dto);
	void update(ProductDTO dto);
	void delete(String p_code);
	String file_info(String p_code);
	String file_detail_info(String p_code);
}

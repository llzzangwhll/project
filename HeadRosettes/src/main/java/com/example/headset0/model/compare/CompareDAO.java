package com.example.headset0.model.compare;

import java.util.List;

public interface CompareDAO {
	List<CompareDTO> list(CompareDTO p_brand);
	CompareDTO sel(String p_name);
	List<CompareDTO>brand_list();

}

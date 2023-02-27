package com.example.headset0.controller.compare;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.compare.CompareDAO;
import com.example.headset0.model.compare.CompareDTO;
import com.example.headset0.service.compare.CompareService;

@Controller
@RequestMapping("/compare/*")
public class CompareController {
	@Autowired
	CompareService compareService;

	@Autowired
	CompareDAO compareDao;

	@RequestMapping("compare.do")
	public ModelAndView list(@RequestParam(defaultValue = "") String p_name1,
			@RequestParam(defaultValue = "") String p_name2) {
		ModelAndView mav = new ModelAndView();
	    Map<String, Object> map = new HashMap<>();
		List<CompareDTO> brandlist = compareDao.brand_list();
		for (CompareDTO p_brand : brandlist) {
			List<CompareDTO> list = compareDao.list(p_brand);
			map.put("list", list);
			mav.setViewName("compare/compare");
			mav.addObject("map", map);
		    
		}
		  CompareDTO sel1 = compareDao.sel(p_name1); 
		  map.put("dto1", sel1); 
		  CompareDTO sel2 = compareDao.sel(p_name2); 
		  map.put("dto2", sel2);
		  mav.setViewName("compare/compare"); 
		  mav.addObject("map", map);
		  mav.addObject("p_name1", p_name1); 
		  mav.addObject("p_name2", p_name2);
		  return mav;
		

	};
}

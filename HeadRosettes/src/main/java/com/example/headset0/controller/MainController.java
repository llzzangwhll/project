package com.example.headset0.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.product.ProductDAO;
import com.example.headset0.model.product.ProductDTO;

@Controller
public class MainController {
		
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping("/")
	   public ModelAndView main(ModelAndView mav) {
	      Map<String, Object> map = new HashMap<>();
	      List<ProductDTO> best_list = productDAO.best_list();
	      map.put("best_list",best_list);
	      mav.setViewName("main");
	      mav.addObject("map",map);
	      return mav;
	   }
		
		@RequestMapping("ex_redirect.do")
		public String ex_redirect() {
			return "redirect:https://www.youtube.com/watch?v=PqVCPE8_ntE";
		}
		
		@RequestMapping("offline_shops.do")
		public String off_shop() {
			return "off_shop/offline_shop";
		}
		
		@RequestMapping("aboutus.do")
		public String aboutus() {
			return "about";
		}
		
	
	

}

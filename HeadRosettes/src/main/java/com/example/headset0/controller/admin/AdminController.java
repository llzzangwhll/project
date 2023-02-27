package com.example.headset0.controller.admin;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.buy.BuyDAO;
import com.example.headset0.model.buy.BuyDTO;
import com.example.headset0.model.pay.PayDAO;
import com.example.headset0.model.pay.PayDTO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	BuyDAO buyDao;
	
	@RequestMapping("list.do")
	public ModelAndView list(Authentication authentication, 
			Principal p, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String m_id=(String)userDetails.getUsername();
		
		List<BuyDTO> buy_list = buyDao.buy_list(m_id);
		map.put("buy_list", buy_list);
		
		mav.setViewName("admin/order_list");
		mav.addObject("map", map);
		return mav;
	}
	@RequestMapping("buy_delete.do")
	public String ajaxTest(HttpServletRequest request) throws Exception {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int[] size = new int[ajaxMsg.length];
		for (int i = 0; i < ajaxMsg.length; i++) {
			size[i] = Integer.parseInt(ajaxMsg[i]);
			buyDao.buy_delete(size[i]);
		}
		return "redirect:/admin/list.do";
	}
	
	@RequestMapping("buy_deleteAll.do")
	public String deleteAll(Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();
		if (m_id != null) {
			buyDao.buy_delete_all(m_id);
		}
		return "redirect:/admin/list.do";
	}
	
	
}

package com.example.headset0.controller.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.cart.CartDAO;
import com.example.headset0.model.cart.CartDTO;
import com.example.headset0.model.pay.PayDAO;
import com.example.headset0.service.cart.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	CartDAO cartDao;

	@Autowired
	CartService cartService;
	
	@Autowired
	PayDAO payDao;
	

	@RequestMapping("delete.do")
	public String ajaxTest(HttpServletRequest request) throws Exception {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int[] size = new int[ajaxMsg.length];
		for (int i = 0; i < ajaxMsg.length; i++) {
			size[i] = Integer.parseInt(ajaxMsg[i]);
			cartService.delete(size[i]);
		}
		return "redirect:/cart/list.do";
	}

	@RequestMapping("deleteAll.do")
	public String deleteAll(Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();
		if (m_id != null) {
			cartDao.delete_all(m_id);
		}
		return "redirect:/cart/list.do";
	}
	
	
	@RequestMapping("update.do")
	public String update(Authentication authentication, @RequestParam(value = "p_price[]") int[] p_price, 
			@RequestParam(value = "amounts[]") int[] amounts,
	         @RequestParam(value = "cart_idx[]") int [] cart_idx, 
	         @RequestParam(value = "money[]") int [] money) {
	 UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();
		CartDTO dto = new CartDTO();
		for (int i = 0; i < cart_idx.length; i++) {
			 dto.setMoney(money[i]);
	         dto.setCart_idx(cart_idx[i]);
	         dto.setAmounts(amounts[i]);
	         cartDao.modify(dto);
		}

		return "redirect:/cart/list.do";
	}

	

	@RequestMapping("list.do")
	public ModelAndView list(Authentication authentication, 
			ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();
		payDao.delete_all(m_id);
		if (m_id != null) {
			List<CartDTO> list = cartDao.list(m_id);
			int sumMoney = cartDao.sum_money(m_id);
			int fee = sumMoney >= 50000 ? 0 : 2500;
			map.put("list", list);
			map.put("sumMoney", sumMoney); 
			map.put("fee", fee);
			map.put("sum", sumMoney + fee);
			map.put("m_id",m_id);
			map.put("count", list.size());
			mav.setViewName("cart/cart_list");
			mav.addObject("map", map);
		  	payDao.delete_all(m_id);
			return mav;
		} else {

			return new ModelAndView("member/login");
		}
	}

	@RequestMapping("cal.do")
	@ResponseBody
	public Map<String, Object> returnMap(Authentication authentication) {
		Map<String, Object> map = new HashMap<>();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername(); 
			List<CartDTO> list = cartDao.list(m_id);
			int sumMoney = cartDao.sum_money(m_id);
			int fee = sumMoney >= 50000 ? 0 : 2500;
			map.put("list", list);
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("sum", sumMoney + fee);
			map.put("count", list.size());

		return map;
	}

	@RequestMapping("insert.do")
	public String insert(@ModelAttribute CartDTO dto, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();
		if (m_id == null) {
			return "redirect:/member/login.do";
		}
		dto.setM_id(m_id);
		
		int count = cartService.count(dto.getP_code(), m_id);
		if (count == 0) {
			cartService.insert(dto);
		} else {
			cartService.update(dto);
		}
		return "redirect:/cart/list.do";
	}
}

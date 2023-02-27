package com.example.headset0.controller.pay;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.buy.BuyDAO;
import com.example.headset0.model.buy.BuyDTO;
import com.example.headset0.model.cart.CartDAO;
import com.example.headset0.model.cart.CartDTO;
import com.example.headset0.model.pay.PayDAO;
import com.example.headset0.model.pay.PayDTO;
import com.example.headset0.security.model.MemberDTO;

@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	PayDAO payDao;

	@Autowired
	BuyDAO buyDao;

	@Autowired
	CartDAO cartDao;


	@RequestMapping("list.do")
	public ModelAndView list(Authentication authentication, Principal p, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();

		List<PayDTO> list = payDao.list(m_id);
		int sumMoney = payDao.sum_money(m_id);
		int m_point = payDao.m_point(m_id);
		int fee = sumMoney >= 50000 ? 0 : 2500;
	
		map.put("list", list);
		map.put("sumMoney", sumMoney);
		map.put("m_point", m_point);
		map.put("fee", fee);
		map.put("sum", sumMoney + fee);
		mav.setViewName("/pay/pay_list");
		mav.addObject("map", map);
		return mav;
	}

	@RequestMapping("insert.do")
	public String insert(PayDTO dto, Authentication authentication, CartDTO cartDto) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();
		dto.setM_id(m_id);
		dto.setAmounts(cartDto.getAmounts());
		dto.setMoney(cartDto.getMoney());
		payDao.insert(dto);
		return "redirect:/pay/list.do";
	}

	@RequestMapping("cart_insert.do")
	public String insert(Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		MemberDTO dto=(MemberDTO)userDetails;
		String m_id = (String) userDetails.getUsername();
			List<CartDTO> cartList = cartDao.list(m_id);
		for (CartDTO cartDto : cartList) {
			PayDTO payDto = new PayDTO();
			payDto.setM_id(m_id);
			payDto.setAmounts(cartDto.getAmounts());
			payDto.setP_code(cartDto.getP_code());
			payDto.setMoney(cartDto.getM_point());
			payDao.insert(payDto);
		   }
		return "redirect:/pay/list.do";
	}


	@RequestMapping("buy_insert.do")
	@ResponseBody
	public void buy_insert(BuyDTO buyDto, PayDTO payDto, @RequestParam(value = "amounts[]") int[] amounts,
			@RequestParam(value = "p_code[]") String[] p_code, @RequestParam(value = "p_name[]") String[] p_name,
			@RequestParam(defaultValue = "0") int used_point, String m_id) {

		for (int i = 0; i < p_code.length; i++) {
			payDto.setP_code(p_code[i]);
			payDto.setAmounts(amounts[i]);
			payDto.setP_name(p_name[i]);
			payDao.update_count(payDto);
			payDao.insert_p_code(payDto);

		}

		buyDao.buy_insert(buyDto);
		payDao.buy_update(payDto);

	}

	@RequestMapping("pay_success.do")
	public ModelAndView pay_list(Authentication authentication, Principal p, ModelAndView mav, BuyDTO dto) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		MemberDTO memberDto = (MemberDTO) userDetails;
		String m_name = memberDto.getM_name();
		String m_id = memberDto.getM_id();
		String m_email = memberDto.getM_email();
		String address = memberDto.getAddress();
		String detailAddress = memberDto.getDetailAddress();
		String m_phone = memberDto.getM_phone();
		String postcode = memberDto.getPostcode();

		Map<String, Object> map = new HashMap<>();
		List<PayDTO> list = payDao.list(m_id);
		List<BuyDTO> buy_list = buyDao.buy_list(m_id);
		int count = payDao.count(m_id);

		map.put("list", list);
		map.put("buy_list", buy_list);
		map.put("count", count);
		map.put("m_name", m_name);
		map.put("m_id", m_id);
		map.put("m_phone", m_phone);
		map.put("address", address);
		map.put("detailAddress", detailAddress);
		map.put("postcode", postcode);
		map.put("m_email", m_email);
		mav.setViewName("/pay/pay_success");
		mav.addObject("map", map);
		cartDao.delete_all(m_id);
		
		return mav;
	}

	@RequestMapping("purchase_list.do")
	public ModelAndView purchase_list(Authentication authentication, Principal p, ModelAndView mav) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();
		MemberDTO memberDto = (MemberDTO) userDetails;

		String m_name = memberDto.getM_name();
		String address = memberDto.getAddress();
		String detailAddress = memberDto.getDetailAddress();
		String postcode = memberDto.getPostcode();
		List<PayDTO> p_code_list = payDao.p_code_list(m_id);

		Map<String, Object> map = new HashMap<>();
		map.put("p_code_list", p_code_list);
		map.put("m_name", m_name);
		map.put("address", address);
		map.put("detailAddress", detailAddress);
		map.put("postcode", postcode);
		mav.setViewName("/pay/purchase_list");
		mav.addObject("map", map);
		return mav;
	}

	@RequestMapping("update_b_state.do")
	public ModelAndView update_b_state(Authentication authentication, Principal p, BuyDTO buyDto, PayDTO payDto,
			ModelAndView mav, @RequestParam(value = "b_state[]") String[] b_state,
			@RequestParam(value = "b_idx[]") int[] b_idx) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();

		for (int i = 0; i < b_state.length; i++) {
			buyDto.setB_state(b_state[i]);
			buyDto.setB_idx(b_idx[i]);
			buyDao.update_b_state(buyDto);//
			Map<String, Object> map = new HashMap<>();
			List<BuyDTO> buy_list = buyDao.buy_list(m_id);
			map.put("buy_list", buy_list);
			mav.setViewName("/admin/order_list");
			mav.addObject("map", map);
		}

		return mav;
	}

}

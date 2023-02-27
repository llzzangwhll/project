package com.example.headset0.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.buy.BuyDTO;
import com.example.headset0.model.mypage.MypageDAO;
import com.example.headset0.model.mypage.MypageDTO;
import com.example.headset0.model.pay.PayDAO;
import com.example.headset0.model.review.ReviewDTO;
import com.example.headset0.service.mypage.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	MypageDAO mypageDao;
	
	@Autowired 
	PayDAO payDao;
	
	

	@RequestMapping("/mypage.do")
	public ModelAndView mypage(Authentication authentication) {
		
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String m_id = (String)userDetails.getUsername();
		List<MypageDTO> my_main = mypageDao.my_main(m_id);
		List<BuyDTO> purchase_list = mypageDao.purchase_list(m_id);
		Map<String, Object> map = new HashMap<>();
		ModelAndView mav = new ModelAndView();
		int count = payDao.count(m_id);
		
		
		map.put("my_main", my_main);
		map.put("purchase_list", purchase_list);
		map.put("count", count);
		mav.setViewName("mypage/my_main");
		mav.addObject("map", map);
		System.out.println(my_main);

		return mav;

	}
	
	
	@RequestMapping("/mypage/writing_list.do")
	public ModelAndView writing_list_qna(Authentication authentication) {
	      UserDetails userDetails = (UserDetails)authentication.getPrincipal();
	      String m_id = (String)userDetails.getUsername();
	      ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/writing_list_qna");
		mav.addObject("qna_list",mypageService.qna_list(m_id));
		return mav;
	}
		
	@RequestMapping("/mypage/writing_list_review.do")
	public ModelAndView writing_list_review(Authentication authentication ) {
	      UserDetails userDetails = (UserDetails)authentication.getPrincipal();
	      String m_id = (String)userDetails.getUsername();
      	ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/writing_list_review");
		mav.addObject("review_list",mypageDao.review_list(m_id));
		return mav;
	}
	

	@RequestMapping("/mypage/unregister.do")
	public String unregister(String m_id) {
		return "mypage/unregister";
	  	
	}

}

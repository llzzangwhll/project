package com.example.headset0.controller.review;

import java.io.File;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.pay.PayDAO;
import com.example.headset0.model.pay.PayDTO;
import com.example.headset0.model.review.PageUtil;
import com.example.headset0.model.review.ReviewDAO;
import com.example.headset0.model.review.ReviewDTO;
import com.example.headset0.model.review.Review_ReplyDAO;
import com.example.headset0.service.review.ReviewService;


@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ReviewDAO reviewDao;

	@Autowired
	Review_ReplyDAO review_replyDao;
	
	@Autowired
	PayDAO payDao;


	@RequestMapping("write.do")
	
	public ModelAndView write(ModelAndView mav, int bpc_idx) {
		
		PayDTO to_review = payDao.to_review(bpc_idx);
		Map<String, Object> map = new HashMap<>();
		String p_code= to_review.getP_code();
		String p_name = to_review.getP_name();
		Date bpc_date = to_review.getBpc_date();
		map.put("bpc_idx", bpc_idx);
		map.put("p_code", p_code);
		map.put("p_name", p_name);
		map.put("bpc_date", bpc_date);
		mav.addObject("map", map);
		mav.setViewName("review/write");
		return mav;
	}


	@RequestMapping("insert.do")
	public String insert(ReviewDTO dto, Authentication authentication, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String m_id = (String)userDetails.getUsername();
		String filename = "-";
		if(!dto.getFile1().isEmpty()) {
			filename =dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) { 
				e.printStackTrace();
			}
		}
		dto.setFilename(filename);
		dto.setM_id(m_id);
		reviewService.insert(dto);
		return "redirect:/review/list.do";
	}

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String search_option, @RequestParam(defaultValue = "") String keyword) {
		int count = reviewService.count(search_option, keyword);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		List<ReviewDTO> list = reviewService.list(start, end, search_option, keyword);
		System.out.println("list" + list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/list");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("page_info", page_info);
		mav.addObject("map", map);
		return mav;
	}

	@RequestMapping("update.do")
	public String update(ReviewDTO dto) {
		reviewService.update(dto);
		return "redirect:/review/list.do";
	}
	
	@RequestMapping("detail.do")
	public ModelAndView detail(int r_idx, int cur_page, Authentication authentication, 
			String search_option, String keyword) {
		reviewDao.increase_hit(r_idx);
		ReviewDTO dto = null;
		if (authentication == null) {
			 dto= reviewService.detail_2(r_idx);
		} else {
			UserDetails userDetails =(UserDetails)authentication.getPrincipal();
			String m_id = (String) userDetails.getUsername();
			dto= reviewService.detail(r_idx, m_id);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/view");
		mav.addObject("dto", dto);
		mav.addObject("cur_page", cur_page);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		return mav;
		
	}
	
	
	@RequestMapping("detail_2.do")
	public ModelAndView detail(int r_idx, Authentication authentication) {
		System.out.println("detail_2.do :" + r_idx);
		ReviewDTO dto = null;
			UserDetails userDetails =(UserDetails)authentication.getPrincipal();
			String m_id = (String) userDetails.getUsername();
			dto= reviewService.detail(r_idx, m_id);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("review/view");
			mav.addObject("dto", dto);

		return mav;
		
	}
			
	

	 

	@RequestMapping("delete.do")
	public String delete(int r_idx) {
		reviewService.delete(r_idx);
		reviewService.sort(r_idx);
		return "redirect:/review/list.do";
	}
	
	@ResponseBody
	@RequestMapping("likeUp.do")
	public String likeUp(Authentication authentication, int r_idx, String likeVal) {
		if (authentication == null) {
			return "R";
		} else {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();	
		String m_id = (String)userDetails.getUsername();
		reviewDao.likeUp(m_id, r_idx, likeVal);
		reviewDao.like_insert(r_idx);
		return "G"; 
		}
		
	}
	
	@ResponseBody
	@RequestMapping("likeDown.do")
	public String likeDown(Authentication authentication, int r_idx, String likeVal) {
		if (authentication == null) {
			return "R";
		} else {
			UserDetails userDetails = (UserDetails)authentication.getPrincipal();
			String m_id = (String)userDetails.getUsername();
		    reviewDao.likeDown(m_id, r_idx, likeVal);
    	   reviewDao.like_delete(r_idx);
		    return "G";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("count_like.do")
	public int count_like(int r_idx) {
		 
		return reviewDao.count_like(r_idx);
	}

	
}

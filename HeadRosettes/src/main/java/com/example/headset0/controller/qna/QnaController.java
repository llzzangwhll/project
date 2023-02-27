package com.example.headset0.controller.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.qna.PageUtil;
import com.example.headset0.model.qna.QnaDAO;
import com.example.headset0.model.qna.QnaDTO;
import com.example.headset0.model.qna.ReplyDAO;
import com.example.headset0.service.qna.QnaService;


@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	@Autowired
	QnaDAO qnaDao;

	@Autowired
	ReplyDAO replyDao;

	@RequestMapping("write.do")
	public String write() {
		return "qna/write";
	}
	
	@RequestMapping("insert.do") 
	public String insert(QnaDTO dto) {
		qnaService.insert(dto); 
		
		return "redirect:/qna/list.do"; }
	  
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue =  "1") int curPage, 
			@RequestParam(defaultValue = "all") String search_option,
			@RequestParam(defaultValue = "") String keyword) {
		int count = qnaService.count(search_option,keyword);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		List<QnaDTO> list=qnaService.list(start, end,search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qna/list");
    	mav.addObject("list", qnaService.list(start,end , search_option, keyword));
    	Map<String, Object> map = new HashMap<>();
    	map.put("list", list);
    	map.put("count", count);
    	map.put("search_option", search_option);
		map.put("keyword", keyword);
    	map.put("page_info", page_info);
    	mav.addObject("map", map);
		return mav;

	}
	
	@RequestMapping("list_attach/{q_idx}")
	@ResponseBody
	public List<String> list_attach(@PathVariable("q_idx") int q_idx) {
		return qnaService.list_attach(q_idx);
	}

	@RequestMapping("update.do")
	public String update(QnaDTO dto) {
		qnaService.update(dto);
		return "redirect:/qna/list.do";
	}

	@RequestMapping("delete.do")
	public String delete(int q_idx) {
		qnaService.delete(q_idx);
		return "redirect:/qna/list.do";

	}


	@RequestMapping("detail.do")
	public ModelAndView detail(int q_idx) {
		qnaService.increase_hit(q_idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qna/detail");
		mav.addObject("dto", qnaService.detail(q_idx));
		return mav;
	}
	
	@RequestMapping("check.do")
	public ModelAndView check (int q_idx) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/check");
		mav.addObject("q_idx", q_idx);
		return mav;
		
	}
	//@ResponseBody  
	@RequestMapping("check_q_pwd.do")
	public ModelAndView check_q_pwd(int q_idx, String q_pwd, ModelAndView mav) {
		boolean result =qnaDao.check_q_pwd(q_idx, q_pwd);
		if (result) {
	      qnaService.increase_hit(q_idx);
		  mav.setViewName("qna/detail"); 
		  mav.addObject("dto",qnaService.detail(q_idx)); 		
		} else {
			mav.setViewName("qna/check");
	        mav.addObject("message","error");
			
		}
		return mav;
	}
	
	@RequestMapping("update_q_state.do") 
	public ModelAndView update_q_state(int q_idx, String q_state, ModelAndView mav) { 
	    qnaService.update_q_state(q_idx, q_state); 
	    mav.setViewName("qna/detail"); 
	    mav.addObject("q_idx",q_idx); 
	    
	    return mav;
	 }
}

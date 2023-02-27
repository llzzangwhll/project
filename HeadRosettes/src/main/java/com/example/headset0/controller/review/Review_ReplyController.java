package com.example.headset0.controller.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.review.PageUtil;
import com.example.headset0.model.review.Review_ReplyDAO;
import com.example.headset0.model.review.Review_ReplyDTO;

@RestController
@RequestMapping("/review_reply/*")
public class Review_ReplyController {

	@Autowired
	Review_ReplyDAO review_replyDao;

	@RequestMapping("insert.do")
	public void insert(Review_ReplyDTO dto,  Authentication authentication ) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		  String rre_id=(String)userDetails.getUsername();
		dto.setRre_id(rre_id);
		System.out.println("review_reply:" + dto);
		review_replyDao.insert(dto);
	}

	
	
	@RequestMapping("/delete/{rre_idx}")
	public ResponseEntity<String> delete(@PathVariable("rre_idx") int rre_idx) {
		ResponseEntity<String> entity = null;
		try {
			review_replyDao.delete(rre_idx);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping("/detail/{rre_idx}")
	public ModelAndView detail(@PathVariable("rre_idx") int rre_idx, ModelAndView mav) {
		Review_ReplyDTO dto = review_replyDao.detail(rre_idx);
		mav.setViewName("review/review_reply_detail");
		mav.addObject("dto", dto);
		return mav;
	}

	@RequestMapping("list.do")
	public ModelAndView list(int r_idx, ModelAndView mav) {
	List<Review_ReplyDTO> list = review_replyDao.list(r_idx);
	mav.setViewName("review/review_reply");
	mav.addObject("list", list);
	return mav;
	}
	
	@RequestMapping("/update/{rre_idx}")
	public ResponseEntity<String> update(@PathVariable("rre_idx")
	int rre_idx, @RequestBody Review_ReplyDTO dto) {
	ResponseEntity<String> entity = null;
	try {
	dto.setRre_idx(rre_idx);
	review_replyDao.update(dto);
	entity = new ResponseEntity<String>("success", HttpStatus.OK);
	} catch (Exception e) {
	e.printStackTrace();
	entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
	return entity;
	}


}

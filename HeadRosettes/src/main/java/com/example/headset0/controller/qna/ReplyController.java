package com.example.headset0.controller.qna;

import java.util.List;

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

import com.example.headset0.model.qna.ReplyDAO;
import com.example.headset0.model.qna.ReplyDTO;


@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyDAO replyDao;

	@RequestMapping("insert.do")
	public void insert(ReplyDTO dto, Authentication authentication) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		 String qre_writer = (String)userDetails.getUsername();
		 System.out.println(qre_writer);
		 dto.setQre_writer(qre_writer);
		 
		replyDao.insert(dto);
	}

	@RequestMapping("/delete/{qre_idx}")
	public ResponseEntity<String> delete(@PathVariable("qre_idx") int qre_idx) {
		ResponseEntity<String> entity = null;
		try {
			replyDao.delete(qre_idx);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping("/detail/{qre_idx}")
	public ModelAndView detail(@PathVariable("qre_idx") int qre_idx, ModelAndView mav) {
		ReplyDTO dto = replyDao.detail(qre_idx);
		mav.setViewName("qna/reply_detail");
		mav.addObject("dto", dto);
		return mav;
	}

	@RequestMapping("list.do")
	public ModelAndView list(int q_num, ModelAndView mav) {
		List<ReplyDTO> list = replyDao.list(q_num);
		System.out.println(list);
		mav.setViewName("qna/reply_list");
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping("list_json.do")
	public @ResponseBody List<ReplyDTO> list_json(@RequestParam int qre_idx) {
		int count = replyDao.count(qre_idx);
		List<ReplyDTO> list = replyDao.list(qre_idx);
		return list;
	}

	@RequestMapping("/update/{qre_idx}")
	public ResponseEntity<String> update(@PathVariable("qre_idx") int qre_idx, 
			@RequestBody ReplyDTO dto) {
		ResponseEntity<String> entity = null;
		try {
			dto.setQre_idx(qre_idx);
			replyDao.update(dto); // 레코드 수정
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}

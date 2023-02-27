package com.example.headset0.controller.notice;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.notice.NoticeDAO;
import com.example.headset0.model.notice.NoticeDTO;
import com.example.headset0.model.notice.NoticeService;
import com.example.headset0.model.notice.PageUtil;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired
	NoticeDAO noticeDAO; 
	
	@Autowired
	NoticeService noticeService;

	@RequestMapping("write.do")
	public String write() {
		return "notice/notice_write";
	}

	@RequestMapping("insert.do")
	public String insert(NoticeDTO dto, HttpServletRequest request) {
		
		String n_image = "-";
		if (!dto.getFile1().isEmpty()) {
			n_image = dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + n_image));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setN_image(n_image);
		noticeDAO.insert(dto);
		return "redirect:/notice/list.do";
	}

	@RequestMapping("list.do")
	   public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue = "1") int curPage) {
	      int count=noticeDAO.count();
	      PageUtil page_info =new PageUtil(count, curPage);
	      int start=page_info.getPageBegin();
	      int end=page_info.getPageEnd();
	      List<NoticeDTO> list=noticeDAO.list(start, end);
	      mav.setViewName("notice/notice_list");
	      Map<String, Object> map=new HashMap<>();
	      map.put("list", list);
	      map.put("count", count);
	      map.put("page_info", page_info);
	         
	      mav.addObject("map", map);
	      return mav;
	   }
	
	
	  @RequestMapping("edit/{n_idx}")
	  public ModelAndView edit(@PathVariable("n_idx") int n_idx, ModelAndView mav) {
	  mav.setViewName("notice/notice_edit");
	  mav.addObject("dto",noticeDAO.detail(n_idx));
	  return mav;
	}
	 

	@RequestMapping("update.do")
	public String update(NoticeDTO dto, HttpServletRequest request) {
		String n_image = "-";
		if (!dto.getFile1().isEmpty()) {
			n_image = dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + n_image));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setN_image(n_image);
		} else {
			NoticeDTO dto2 = noticeDAO.detail(dto.getN_idx());
			dto.setN_image(dto2.getN_image());
		}
		noticeDAO.update(dto);
		return "redirect:/notice/list.do";
	}

	@RequestMapping("delete.do")
	public String delete(int n_idx, HttpServletRequest request) {
		String n_image = "-";
		if (n_image!=null && !n_image.equals("-")) {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				File f=new File(path+n_image);
				if(f.exists()) f.delete();
		}
		noticeDAO.delete(n_idx);
		return "redirect:/notice/list.do";
	}

	@RequestMapping("detail/{n_idx}")
	public ModelAndView detail(@PathVariable int n_idx, ModelAndView mav) {
		noticeService.increase_n_viewcount(n_idx);
		mav.setViewName("notice/notice_detail");
		mav.addObject("dto", noticeDAO.detail(n_idx));
		return mav;
	}

}

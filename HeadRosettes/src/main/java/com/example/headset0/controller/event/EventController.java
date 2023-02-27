package com.example.headset0.controller.event;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
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

import com.example.headset0.model.event.EventDAO;
import com.example.headset0.model.event.EventDTO;
import com.example.headset0.model.event.PageUtil;
import com.example.headset0.service.event.EventService;

@Controller
@RequestMapping("/event/*")
public class EventController {
	@Autowired
	EventDAO eventDao;

	@Autowired
	EventService eventService;

	@RequestMapping("write.do")
	public String write() {
		return "event/event_write";
	}

	@RequestMapping("insert.do")
	public String insert(EventDTO dto, HttpServletRequest request) {
		String e_image= "-";
		if (!dto.getFile1().isEmpty()) {
			e_image = dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + e_image));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setE_image(e_image);
		eventDao.insert(dto);
		return "redirect:/event/list.do";

	}

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue =  "1") int curPage,
	@RequestParam(defaultValue = "all") String search_option, 
	@RequestParam(defaultValue = "") String keyword) {
		int count = eventService.count(search_option,keyword);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		List<EventDTO> list = eventService.list(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("event/event_list");
		mav.addObject("list", eventDao.list(start, end, search_option, keyword));
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("page_info", page_info);
		mav.addObject("map", map);
		return mav;
	}

	@RequestMapping("edit/{e_idx}")
	public ModelAndView edit(@PathVariable("e_idx") int e_idx, ModelAndView mav) {
		mav.setViewName("event/event_edit");
		mav.addObject("dto", eventDao.detail(e_idx));
		return mav;
	}

	@RequestMapping("detail/{e_idx}")
	public ModelAndView detail(@PathVariable int e_idx, ModelAndView mav) {
		eventService.e_viewcount(e_idx);
		mav.setViewName("event/event_detail");
		mav.addObject("dto", eventDao.detail(e_idx));
		return mav;
	}

	@RequestMapping("update.do")
	public String update(EventDTO dto, HttpServletRequest request) {
		String filename = "-";
		if (!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/WEB-INF/views/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setE_image(filename);
		} else {
			EventDTO dto2 = eventDao.detail(dto.getE_idx());
			dto.setE_image(dto2.getE_image());
		}
		eventDao.update(dto);
		return "redirect:/event/list.do";
	}

	@RequestMapping("delete.do")
	public String delete(int e_idx, HttpServletRequest request) {
		String filename = eventDao.file_info(e_idx);
		if (filename != null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/WEB-INF/views/images/");
			File f = new File(path + filename);
			if (f.exists())
				f.delete();
		}
		eventDao.delete(e_idx);
		return "redirect:/event/list.do";
	}
}

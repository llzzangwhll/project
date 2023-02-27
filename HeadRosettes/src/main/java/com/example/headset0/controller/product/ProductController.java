package com.example.headset0.controller.product;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.headset0.model.pay.PayDAO;
import com.example.headset0.model.product.PageUtil;
import com.example.headset0.model.product.ProductDAO;
import com.example.headset0.model.product.ProductDTO;
import com.example.headset0.model.review.ReviewDAO;
import com.example.headset0.model.review.ReviewDTO;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Autowired
	ProductDAO productDAO;

	@Autowired
	PayDAO payDao;
	
	@Autowired
	ReviewDAO reviewDAO;


	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String search_option, @RequestParam(defaultValue = "") String keyword) {
		int count = productDAO.count(search_option, keyword);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();

		List<ProductDTO> list = productDAO.list(start, end, search_option, keyword);
		List<ProductDTO> list2 = productDAO.brand_name();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/product_list");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("list2", list2);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("page_info", page_info);
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("list_filter.do")
	public ModelAndView list_filter(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String search_option, @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "0") int p_brand, @RequestParam(defaultValue = "0") int p_price,
			@RequestParam(defaultValue = "n") String p_noise, @RequestParam(defaultValue = "n") String p_line) {
		  
		int filter_count=productDAO.filter_count(search_option, keyword, p_brand, p_price, p_noise, p_line);
		PageUtil page_info=new PageUtil(filter_count, curPage);
		int start=page_info.getPageBegin();
		int end = page_info.getPageEnd();
		List<ProductDTO> list2 = productDAO.brand_name();
		List<ProductDTO> list_filter = productDAO.list_filter(start, end, search_option, keyword, p_brand, p_price,p_noise, p_line);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/product_filter");
		Map<String, Object> map = new HashMap<>();
		map.put("list2", list2);
		map.put("list_filter", list_filter);
		map.put("filter_count", filter_count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("page_info", page_info);
		mav.addObject("map", map);
		
		return mav;

	}

	@RequestMapping("detail_1.do")
	public ModelAndView detail(String p_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/product_detail");
		mav.addObject("dto", productDAO.detail(p_code));
		List<ReviewDTO> list = reviewDAO.spe_list(p_code); 
		Map <String, Object> map=new HashMap<>(); 
		map.put("list", list);
		mav.addObject("map",map);
     	System.out.println("detail1_map" + map );
		return mav;

	}

	
	@RequestMapping("detail_2.do")
	public ModelAndView detail(String p_code, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String m_id = (String) userDetails.getUsername();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/product_detail");
		mav.addObject("dto", productDAO.detail(p_code));
		// mav.setViewName("include/spe_review");
		List<ReviewDTO> list = reviewDAO.spe_list(p_code);
		System.out.println("list" + list);
	// 	List<ReviewDTO> list2 = reviewDAO.spe_list_reply(p_code);
		Map <String, Object> map=new HashMap<>();
	//	map.put("list1", list1);
		map.put("list", list);
		mav.addObject("map",map);
		System.out.println("detail2:" + map);
		payDao.delete_all(m_id);
		return mav;

	}
	
	@RequestMapping("write.do")
	public String write() {
		return "product/product_write";
	}

	@RequestMapping("insert.do")
	public String insert(ProductDTO dto, HttpServletRequest request) {

		String p_image = "-";
		String p_detail_image = "-";

		if (!dto.getFile1().isEmpty()) {
			p_image = dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + p_image));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (!dto.getFile2().isEmpty()) {
			p_detail_image = dto.getFile2().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				new File(path).mkdir();
				dto.getFile2().transferTo(new File(path + p_detail_image));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		dto.setP_image(p_image);
		dto.setP_detail_image(p_detail_image);
		productDAO.insert(dto);
		return "redirect:/product/list.do";
	}

	@RequestMapping("edit/{p_code}")
	public ModelAndView edit(@PathVariable("p_code") String p_code, ModelAndView mav) {																			
		mav.setViewName("product/product_edit");
		mav.addObject("dto", productDAO.detail(p_code));
		
		return mav;
	}

	@RequestMapping("update.do")
	public String update(ProductDTO dto, HttpServletRequest request) {
		String p_image = "-";
		String p_detail_image = "-";
		if (!dto.getFile1().isEmpty()) {
			p_image = dto.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + p_image));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setP_image(p_image);
		} else {
			ProductDTO dto2 = productDAO.detail(dto.getP_code());
			dto.setP_image(dto2.getP_image());
		}

		if (!dto.getFile2().isEmpty()) {
			p_detail_image = dto.getFile2().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				new File(path).mkdir();
				dto.getFile2().transferTo(new File(path + p_detail_image));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setP_detail_image(p_detail_image);
		} else {
			ProductDTO dto3 = productDAO.detail(dto.getP_code());
			dto.setP_detail_image(dto3.getP_detail_image());
		}
		productDAO.update(dto);
		return "redirect:/product/list.do";
	}

	@RequestMapping("delete.do")
	public String delete(String p_code, HttpServletRequest request) {
		String p_image = "-";
		if (p_image != null && !p_image.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/images");
			File f = new File(path + p_image);
			if (f.exists())
				f.delete();
		}
		productDAO.delete(p_code);
		return "redirect:/product/list.do";

	}

	@RequestMapping("brand_list/{p_brand}")
	public ModelAndView brand_list(@RequestParam(defaultValue = "1") int curPage, 
			@PathVariable("p_brand") int p_brand, 
			@RequestParam(defaultValue = "all") String search_option, @RequestParam(defaultValue = "") String keyword, String p_brand_name) {
		int brand_count=productDAO.brand_count(search_option, keyword, p_brand);
		PageUtil page_info=new PageUtil(brand_count, curPage);
		int start=page_info.getPageBegin();
		int end = page_info.getPageEnd();
		
		List<ProductDTO> brand_list=productDAO.brand_list(start, end, search_option, keyword, p_brand);
		List<ProductDTO> list2=productDAO.brand_name();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("product/brand_list");
		Map<String, Object> map = new HashMap<>();
		map.put("brand_list", brand_list);
		map.put("brand_count", brand_count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("page_info", page_info);
		map.put("list2", list2);
		mav.addObject("map", map);
		return mav;
	}

}

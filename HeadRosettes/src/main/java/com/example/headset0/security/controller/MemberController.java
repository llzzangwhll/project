package com.example.headset0.security.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.headset0.security.model.MemberDAO;
import com.example.headset0.security.model.MemberDTO;

@Controller
public class MemberController {
	
	

	@Autowired
	PasswordEncoder pwdEncoder;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	MemberDAO memberDao;

	@RequestMapping("/member/join.do")
	public String join() {
		return "member/join";
	}

	@RequestMapping("/member/login.do")
	public String login() {
		return "member/login";
		
	}

	@RequestMapping("/admin/*")
	public String admin_main() {
		return "admin/main";
	}

	@RequestMapping("/member/insert.do")
	public String insert(String m_id, String m_pwd, String m_name, String m_phone, String m_email,
			String postcode, String address, String detailAddress, String extraAddress,
			 String m_gender, String birthdate, String authority) {

		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		String pwd = pwdEncoder.encode(m_pwd);
		map.put("m_pwd", pwd);
		map.put("m_name", m_name);
		map.put("m_phone", m_phone);
		map.put("m_email", m_email);
		map.put("postcode", postcode);
		map.put("address", address);
		map.put("detailAddress", detailAddress);
		map.put("extraAddress", extraAddress);
		map.put("m_gender", m_gender);
		map.put("birthdate", birthdate);
		map.put("authority", authority);
		memberDao.insert(map);
		return "member/join_to_login";
	}

	@RequestMapping("/member/info_update.do")
	public String info_update(HttpSession session, String m_id, String m_pwd, String m_name, 
			String m_phone, String m_email, String postcode, 
			String address, String detailAddress, String extraAddress,
			 String m_gender, String birthdate) {
		
		Map <String, Object> map= new HashMap<>();
		map.put("m_id", m_id);
		String pwd = pwdEncoder.encode(m_pwd);
		map.put("m_pwd", pwd);
		map.put("m_name", m_name);
		map.put("m_phone", m_phone);
		map.put("m_email", m_email);
		map.put("postcode", postcode);
		map.put("address", address);
		map.put("detailAddress", detailAddress);
		map.put("extraAddress", extraAddress);
		map.put("m_gender", m_gender);
		map.put("birthdate", birthdate); 
		
		memberDao.update(map);
	    session.invalidate();
       
	    return "redirect:/member/join_to_login.do";
	}
	
	@RequestMapping("/member/join_to_login.do")
	public String tologin() {
		return "member/join_to_login";
	}
	
	
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping("/member/idCheck.do")
	public int idCheck(String m_id) {
		int result = memberDao.idCheck(m_id);
		
		return result;

	}

	@RequestMapping("/member/pre_myInfo.do")
	public String pre_myInfo() {
		
		return "/member/pre_myInfo";
	}

	@RequestMapping("/member/preCheck_myInfo.do")
	public String prev_myInfo(Authentication authentication, 
			String m_pwd, Principal p, Model model) {
		
		String pwd = pwdEncoder.encode(m_pwd);

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		
		MemberDTO dto=(MemberDTO)userDetails;
	
	   if(pwdEncoder.matches(m_pwd, pwd)) {
		   
		    
		   String date = dto.getBirthdate();
		   System.out.println(date);
		   if (date.length()==2) {
			   date = date.trim().replace("--","");
			   model.addAttribute("date1",date);
			   model.addAttribute("date2", date);
			   model.addAttribute("date3",date);
		   } else {
			   String [] bdate =date.split("-");
			   model.addAttribute("date1", bdate[0]);
			   model.addAttribute("date2", bdate[1]);
			   model.addAttribute("date3", bdate[2]);
		   }
		   
		   
		   
		   
		   return "member/my_Info";
	   } else {
		   return "redirect:/member/pre_myInfo";
	   }
		
	}
		
	@RequestMapping("/member/unregister_check.do")
	public String unregister_check(String m_id) {
		return "member/unregister";

	}

	@ResponseBody
	@RequestMapping("/member/pre_unregister.do")
	public String pre_unregister(Authentication authentication, String m_pwd) {
		String pwd = pwdEncoder.encode(m_pwd);
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		if (pwdEncoder.matches(m_pwd, pwd)) {
			return "True";
		} else {
			return "False";
		}
	}

	@RequestMapping("/member/unregister.do")
	public String unregister(String m_id, HttpSession session) {
		memberDao.unregister(m_id);
		session.invalidate();
		return "redirect:/";
	}



   @RequestMapping("/member/insert_address.do")
   public String insert_address() {
	   
	   return "/member/insert_address";
   }
}
package com.example.headset0.security.sevice;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.headset0.security.model.MemberDTO;


@Service
public class MemberService implements UserDetailsService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public UserDetails loadUserByUsername(String m_id) throws UsernameNotFoundException {
		Map<String, Object> user = sqlSession.selectOne("member.detail", m_id);
		if (user == null)
			throw new UsernameNotFoundException(m_id);
		List<GrantedAuthority> authority = new ArrayList<>();
		authority.add(new SimpleGrantedAuthority(user.get("authority").toString()));
		
		return new MemberDTO( 
		
				user.get("username").toString(), 
				user.get("password").toString(),
				(Integer)Integer.valueOf(user.get("enabled").toString()) == 1,
				true, true, true, authority,
				user.get("username").toString(),
				user.get("password").toString(),
				user.get("m_name").toString(),
				user.get("m_phone").toString(),
				user.get("m_email").toString(),
				user.get("postcode").toString(),
				user.get("address").toString(),
				user.get("detailAddress").toString(),
				user.get("extraAddress").toString(),
				user.get("m_gender").toString(),
				user.get("birthdate").toString()
				
			);
	                
	}
}
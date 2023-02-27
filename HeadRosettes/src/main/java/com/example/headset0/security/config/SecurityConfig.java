package com.example.headset0.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.example.headset0.security.sevice.FailureHandler;
import com.example.headset0.security.sevice.SuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig  {

	@Bean 
	  protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
	    http.csrf().disable(); 
		http.authorizeRequests()
			
			
		    .antMatchers("/","/review/**","/review_reply/**","/reply/**","/compare/**","/notice/**", "/event/**", 
		    		"/product/**", "/user/**", "/member/**", "/mypage/**", "/qna/**", "/resources/**","/aboutus.do", "/offline_shops.do").permitAll() 

			.antMatchers("/admin/**").hasAnyRole("ADMIN") 


			.antMatchers("/cart/**").hasAnyRole("USER")
			.anyRequest().authenticated();

		http.formLogin()
			.loginPage("/member/login.do")
			.loginProcessingUrl("/member/login_check.do")
			.usernameParameter("m_id")
			.passwordParameter("m_pwd")
         .successHandler(new SuccessHandler())
			.failureHandler(new FailureHandler());
	     return http.build();
	}

	@Bean
	public PasswordEncoder pwdEncoder() {  
		return new BCryptPasswordEncoder();
	}
}


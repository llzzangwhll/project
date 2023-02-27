package com.example.headset0.security.sevice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class FailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, 
			HttpServletResponse response,
			AuthenticationException exception) 
					throws IOException, ServletException {
		request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
	    RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
	    rd.forward(request, response);
		

	}

}

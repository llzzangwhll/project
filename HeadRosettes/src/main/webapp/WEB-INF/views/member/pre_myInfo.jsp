<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/login_white.css" rel="stylesheet">
<title>비밀번호 확인</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
</head>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
 $(function() {
	$("#btn_pwdCheck").click(function(){
		const m_pwd=$("#m_pwd").val();   
		location.href="/member/preCheck_myInfo.do?m_pwd="+m_pwd;
		
	})
 });



</script>
<body>
<div class="main-signup">
   <header>
        <br><br>
            <div class="logo">
                <a href="/" target="_blank">
                <img src="/resources/images/logo-png.png" width="200" height="200"></a>
               <h2 align="center"> Head Rosettes </h2>
               <h2 align="center"> 비밀번호를 다시 한번 입력해주세요.</h2>
            </div>
        </header>

<form id="form1" name="form1" action="/member/preCheck_myInfo.do" method="post">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
<input type="hidden" name="m_id" id="m_id" 
value= "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
              
                 <span class="signup-input">
                    <input class="signup-name" type="password" id="m_pwd" name="m_pwd" placeholder="비밀번호"></input>
                </span>
                <br>
                <div class="signup-btn-wrap">
                <input type="submit" class="signup-btn" value="확인" id="btn_pwdCheck" >
                </div>
        </form>


</div>
</body>
</html>

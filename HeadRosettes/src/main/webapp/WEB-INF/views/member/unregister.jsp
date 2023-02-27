<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/login_white.css" rel="stylesheet">
<title>회원탈퇴</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function(){
	$("#btn_preCheck").click(function(){
		const m_pwd=$("#m_pwd").val();
		$.ajax({
			url:"/member/pre_unregister.do?m_pwd="+m_pwd,
            success: function(result){
               if(result=="True") {
            	   doUnregister();
               } else {
            	   alert("비밀번호를 다시 확인해주세요.");
            	   return "redirect: /member/unregister";
               }
             }
		})
	});
     function doUnregister(){   
			const m_id=$("#m_id").val();
		    var result=confirm("정말 탈퇴하시겠습니까?");
                  if(result){
                	  location.href="/member/unregister.do?m_id="+m_id;
                	  alert ("탈퇴가 완료되었습니다. 감사합니다.");
                  } else {
                	  location.href="/";
                  }
 		}

	
	
});


</script>
</head>
<body>
<div class="main-signup">
   <header>
        <br><br>
            <div class="logo">
                <a href="/" target="_blank">
                <img src="/resources/images/logo-png.png" width="200" height="200"></a>
               <h2 align="center"> Head Rosettes </h2>
               <h2 align="center"> 회원탈퇴하시겠습니까? </h2>
               <h2 align="center"> 비밀번호를 다시 한번 입력해주세요.</h2>
            </div>
        </header>
<form id="form" name="form" action="/member/pre_unregister.do"  method="post">
<input type="hidden" name="m_id" id="m_id"
value= "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
 <span class="signup-input">
                    <input class="signup-name" type="password" id="m_pwd" name="m_pwd" placeholder="비밀번호"></input>
                </span>
                <br>
                <div class="signup-btn-wrap">
                <input type="button" class="signup-btn" value="확인" id="btn_preCheck" >
                </div>
</form>
</div>
</body>
</html>
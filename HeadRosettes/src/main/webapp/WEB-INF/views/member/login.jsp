<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link href="/resources/css/login_white.css" rel="stylesheet">

</head>

<body>

 <div class="main-signup">
   <header>
        <br><br>
            <div class="logo">
                <a href="/" target="_blank">
                <img src="/resources/images/logo-png.png" width="200" height="200"></a>
               <h2 align="center"> Head Rosettes </h2>
               <h2 align="center"> 로그인 </h2>
            </div>
        </header>
        
        <form action="/member/login_check.do" method="post" name="form1" class="box" >
                <span class="signup-input">
                    <input class="signup-name" type="text" id="m_id" name="m_id" placeholder="아이디" autocomplete="off"></input>
                </span>
                <br>
                 <span class="signup-input">
                    <input class="signup-name" type="password" id="m_pwd" name="m_pwd" placeholder="비밀번호"></input>
                </span>
                <br>
                 <h5 align="center" style="color: red;">${message}</h5>
                <br>
                <div class="signup-btn-wrap">
                <input type="submit" class="signup-btn" value="로그인" >
                </div>
        </form>
         <a href="/member/join.do" class="dnthave">회원가입 |</a>
        <a href="/member/join.do" class="dnthave">Don’t have an account? Sign up <br></a>
  </div>      
</body>

</html>
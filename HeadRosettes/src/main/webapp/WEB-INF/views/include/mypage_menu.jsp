<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
ul {list-style: none; }
#nav {background: #e6e6fa; width:10%; height:500px; float:left;}

</style>
<div id="nav">
  <ul>
    <li><a href="mypage/writing_list.do?m_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">내가 쓴 글</a></li>
    <li><a href="mypage/cart.do">장바구니</a></li>
    <!-- <li><a href="member/myInfo.do">내 정보 수정</a></li> -->
    <li><a href="member/pre_myInfo.do">내 정보 수정</a></li>
    <li><a href="member/unregister_check.do?m_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">회원탈퇴</a></li>
    
  </ul>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="/resources/css/joeblog.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script>
 $(function() {
      $("#btnCartList").click(function(){
    	   location.href="/cart/list.do";  
      });
      
 });
 


</script>
<style>

a {
  color: #73685d;
}
  
#logo { 




  position: absolute; 
  top:10px; left:20px;
  font-weight: bold;
  color: #483d8b;
  font-size: 30px	
  }


.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 100px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
}

.dropdown:hover .dropdown-content {
  display: block;
}  


</style>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/">Head Rosettes</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
               
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/aboutus.do">About us</a></li>
                        <li class="nav-item"><a class="nav-link" href="/product/list.do">Products</a></li>
                        <li class="nav-item"><a class="nav-link" href="/compare/compare.do">제품비교</a></li>
                        <li class="nav-item"><a class="nav-link" href="/offline_shops.do">청음샵 안내</a></li>
                        <div class="dropdown">
                        <li class="nav-item"><a class="nav-link" href="/notice/list.do">Community</a></li>
                      <div class="dropdown-content"> 
                                <li><a class="dropdown-item" href="/notice/list.do">공지사항</a></li>
                                <li><a class="dropdown-item" href="/event/list.do">이벤트</a></li>
                                <li><a class="dropdown-item" href="/review/list.do">상품후기</a></li>
                                <li><a class="dropdown-item" href="/qna/list.do">Q&A게시판</a></li>
                                </div> 
                      </div>
                     <sec:authorize access="isAnonymous()"> 
                        <li class="nav-item"><a class="nav-link" href="/member/login.do">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/member/join.do">회원가입</a></li>
                      </sec:authorize>
                      <sec:authorize access="isAuthenticated()">
                      <div class="dropdown">
                      <li class="nav-item"><a class="nav-link" href="/mypage.do?m_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">마이페이지</a></li>
                      <div class="dropdown-content">
                               <li><a class="dropdown-item" href="/mypage/writing_list.do?m_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">내가 쓴 글</a></li>
                                <li><a class="dropdown-item" href="/cart/list.do">장바구니</a></li>
                                <li><a class="dropdown-item" href="/pay/purchase_list.do">구매내역</a></li>
                                <li><a class="dropdown-item" href="/member/pre_myInfo.do">내 정보 수정</a></li>
                                <li><a class="dropdown-item" href="/member/unregister_check.do?m_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">회원탈퇴</a></li>
                                </div> 
                                </div> 
             
                        <li class="nav-item"><a class="nav-link" href="/member/logout.do">로그아웃</a></li>
                         &nbsp&nbsp&nbsp
                       
                         <button class="btn btn-outline-light" id="btnCartList" type="submit" >
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                        
                       </sec:authorize>
                       <sec:authorize access="hasRole('ROLE_ADMIN')">
                       <li class="nav-item"><a class="nav-link" href="/admin/list.do">관리자페이지</a></li>
                       </sec:authorize>
                        
                    </ul>
                </div>
            </div>
        </nav>


<hr>  <!-- 수평선 --></body>
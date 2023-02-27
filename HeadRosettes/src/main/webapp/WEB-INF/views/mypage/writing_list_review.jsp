<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글 Review</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
</head>
<style>
th{
	 background-color: #F5F5F5;
		color: #343A40;"

	/* background-color: #343A40; */
}

table{
	margin: auto;
	width: 90%;

}

@import url(https://fonts.googleapis.com/css?family=Roboto:700);
html, body{background : #FBC02D; font-family : Roboto; height: 100%; width: 100%; margin: 0;}
.button {
  background: #3D4C53;
  margin : 10px auto;
  width : 200px;
  height : 25px;
  overflow: hidden;
  text-align : center;
  transition : .2s;
  cursor : pointer;
  border-radius: 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,.2);
}
.btnTwo {
  position : relative;
  width : 200px;
  height : 100px;
  margin-top: -100px;
  padding-top: 2px;
  background : #B0C4DE;
  left : -250px;
  transition : .3s;
}
.btnText {
  color : white;
  transition : .3s;
}
.btnText2 {
  margin-top : 63px;
  margin-right : -130px;
  color : #FFF;
}
.button:hover .btnTwo{
  left: -130px;
}
.button:hover .btnText{
  margin-left : 65px;
}
.button:active {
  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
}
</style>
<body>
<%@ include file="../include/main_menu.jsp" %>
<br><br>
<h3 align="center">내가 쓴 글 : Review</h3>
<br><br>


<div class="button" id="qna_list" onclick="location.href='/mypage/writing_list.do'">
    <p class="btnText">Q&A</p>
    <div class="btnTwo">
      <p class="btnText2">GO!</p>
    </div>
 </div>

<div class="button" id="review_list" onclick="location.href='/mypage/writing_list_review.do'">
    <p class="btnText">Review</p>
    <div class="btnTwo">
      <p class="btnText2">GO!</p>
    </div>
 </div>


<br>

 <table border="0" width="800px">
 <tr> 
    <th>구매한 제품</th>
    <th>글 제목</th>
    <th>작성날짜</th>
    <th>조회수</th>
    <th>좋아요</th>
 </tr>
     <c:forEach var ="row" items="${review_list}">
       <tr>
         <td>${row.p_code}</td>
         <td><a href="/review/detail_2.do?r_idx=${row.r_idx}">${row.r_title}</a></td>
         <td><fmt:formatDate value="${row.r_date}" pattern="yyyy-MM-dd" /></td>
         <td>${row.r_hit}</td>
         <td>${row.like_count}</td>
        </tr>  
     
     </c:forEach>
     </table>
 




</body>
</html>
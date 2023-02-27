<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function(){
	$("#btnList").click(function(){
	location.href="/notice/list.do";
	});
});
	

</script>

</head>
<body>
<%@include file="../include/main_menu.jsp" %>

<h3>공지사항</h3>
<div>제목&nbsp;${dto.n_title}&nbsp;&nbsp;작성자&nbsp;${dto.n_writer}&nbsp;&nbsp;작성일자&nbsp;<fmt:formatDate value="${dto.n_date}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
<div align="right">조회수&nbsp;${dto.n_viewcount}</div>
<br>
<br>
<div>${fn:replace(dto.n_text, replaceChar, "<br/>") } </div>
	<div><img src="/resources/images/${dto.n_image}" onerror="this.style.display='none'"></div>
<br>
<button id="btnList" type="button">목록</button>
</body>
</html>
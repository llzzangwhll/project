<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>이벤트</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
</head>
<body>
<%@ include file="../include/main_menu.jsp" %>
<table border="1" width="700px">
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>등록날짜</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>${dto.e_title}</td>
			<td>${a_name}</td>
			<td><fmt:formatDate value="${dto.e_date}" pattern="yyyy-MM-dd HH:MM:ss" /></td>
			<td>${dto.e_viewcount}</td>
		<tr>
			<th colspan="4">내용</th>
		</tr>
		<tr>
			<td align="center" colspan="4">${dto.e_text}</td>
		</tr>
		<tr>
			<th colspan="4">사진</th>
		</tr>
		<tr>
			<td align="center" colspan="4"><img src="/resources/images/${dto.e_image}" width="700px" height="700px"></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="button" value="목록" onclick="location.href='/event/list.do'"></td>
		</tr>
</table>
</body>
</html>
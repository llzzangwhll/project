<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
	$(function() {
		$("#btnAdd").click(function() {
			location.href = "/event/write.do";
		});
	});
	 
function list(page){
	location.href="/event/list.do?curPage="+page+"&search_option=${map.search_option}&keyword=${map.keyword}";
}
</script>

<title>이벤트</title>
<link href="/resources/css/styles.css" rel="stylesheet">
<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<style type="text/css">
th{
	 background-color: #F5F5F5;
		color: #343A40;"
}

table{
	margin: auto;
	width: 90%;

}
</style>
</head>
<body>
<%@ include file="../include/main_menu.jsp" %>
<h3 style="padding-left: 80px;">이벤트</h3>
<br>
<span style="padding-left: 80px;">
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button type="button" id="btnAdd">이벤트등록</button>
</sec:authorize>
</span>
<hr>
<table border="0" width="1500px">
<tr>
	<c:forEach var="row" items="${map.list}" varStatus="vs">
		<td style="width:20%; word-break: break-word; vertical-align: bottom;">
			<c:choose>
				<c:when test="${row.e_image != '-' }">
					<img src="/resources/images/${row.e_image}" width="500px" height="500px"><br>
				</c:when>
				<c:otherwise><br>
				</c:otherwise>
			</c:choose>
			
			<a href="/event/detail/${row.e_idx}">
			글제목: ${row.e_title}<br></a>
			작성자: headRosettes<br>
			조회수: ${row.e_viewcount}<br>
			작성날짜: <fmt:formatDate value="${row.e_date}" pattern="yyyy-MM-dd HH:MM:ss" />
			<div><input type="hidden" name="idx" value="${dto.idx}"></div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
					<br>
			<a href="/event/edit/${row.e_idx}">[편집]</a>
			</sec:authorize></td>
	</c:forEach>
	</tr>
	<tr>
		<td colspan="5" align="center">
			<c:if test="${map.page_info.curPage > 1 }">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.page_info.curBlock > 1}">
				<a href="javascript:list('${map.page_info.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${map.page_info.blockBegin}" end="${map.page_info.blockEnd}">
				<c:choose>
					<c:when test="${num == map.page_info.curPage }">
						<span style="color:red">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.page_info.curBlock <= map.page_info.totBlock }">
				<a href="javascript:list('${map.page_info.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.page_info.curPage <= map.page_info.totPage}">
				<a href="javascript:list('${map.page_info.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>				
</table>
</body>
</html>
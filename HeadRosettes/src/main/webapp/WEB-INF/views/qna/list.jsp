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
<title>Q&A page</title>
<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script>
$(function(){
	$("#btnAdd").click(function(){
		location.href="/qna/write.do";
	});
});

function list(page){
	   location.href="/qna/list.do?curPage="+page;
	}
</script>
<style>
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
<%@include file="../include/main_menu.jsp" %>
<%@include file="../include/community_menu.jsp" %>
<h3 style="padding-left: 80px;">Q&A게시판</h3>
<br>
<span style="padding-left: 80px;">
 <sec:authorize access="isAuthenticated()"> 
	<button type="button" id="btnAdd">글 작성</button>
</sec:authorize>
</span>
<br>
<table border="0" width="1500px">
<tr>
   <th>글 번호</th>
   <th>문의종류</th>
   <th>글 제목</th>
   <th>작성자</th>
   <th>작성날짜</th>
   <th>답변상태</th>
   <th>조회수</th>
</tr>
<c:forEach var = "row" items="${list}">
  <tr>
     <td width="10%" >${row.q_idx}</td>
     <td width="15%">${row.q_type}</td>
     <td width="30%">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
	 <a href="/qna/detail.do?q_idx=${row.q_idx}">${row.q_title}</a>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<a href="/qna/check.do?q_idx=${row.q_idx}">${row.q_title}</a>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
	<a href="/qna/check.do?q_idx=${row.q_idx}">${row.q_title}</a>
</sec:authorize>
            </td>
     <td width="15%">${row.m_name}</td>
     <td width="15%"><fmt:formatDate value="${row.q_date}" pattern="yyyy-MM-dd" /></td>
     <td width="10%">${row.q_state}</td>
     <td width="5%">${row.q_hit}</td>
   </tr>
   </c:forEach>
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
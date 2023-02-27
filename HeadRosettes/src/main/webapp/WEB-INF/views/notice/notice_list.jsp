<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="/resources/css/styles.css" rel="stylesheet">
<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function(){
	$("#btnAdd").click(function(){
		location.href="/notice/write.do";
	});
});

function list(page){
	   location.href="/notice/list.do?curPage="+page;
	}
</script>

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
<%@include file="../include/main_menu.jsp" %>
<h3 style="padding-left: 70px;">Notice</h3>
<br>
<span style="padding-left: 80px;">
 <sec:authorize access="hasRole('ROLE_ADMIN')">
<button type="button" id="btnAdd" >공지등록</button>
</sec:authorize>
</span>
<br>
<table border="0" width="1500px"> 
<tr>
<th align="left">번호</th>
<th align="left">제목</th>
<th align="left">작성자</th>
<th align="left">작성일자</th>
<th align="left">조회수</th>
</tr>

<c:forEach var="row" items="${map.list}">
<tr>
<td class="line">${row.n_idx}</td>
<td class="line"><a href="/notice/detail/${row.n_idx}">${row.n_title}</a>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="/notice/edit/${row.n_idx}">[편집]</a>
</sec:authorize>
</td>
<td class="line">${row.n_writer}</td>
<td class="line"><fmt:formatDate value="${row.n_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
<td class="line">${row.n_viewcount}</td>
</tr>
</c:forEach>
<tr>
<td colspan="5" align="center">
   <c:if test="${map.page_info.curPage > 1}">
      <a href="javascript:list('1')">[처음]</a>
   </c:if>
   <c:if test="${map.page_info.curBlock > 1}">
      <a href="javascript:list('${map.page_info.prevPage}')">[이전]</a>
   </c:if>
   <c:forEach var="num" begin="${map.page_info.blockBegin}" end="${map.page_info.blockEnd}">
      <c:choose>
         <c:when test="${num == map.page_info.curPage}">
         <span style="color:red">${num}</span>&nbsp;
         </c:when>
         <c:otherwise>
         <a href="javascript:list('${num}')">${num}</a>&nbsp;
         </c:otherwise>
      </c:choose>
   </c:forEach>
   <c:if test="${map.page_info.curBlock <= map.page_info.totBlock }">
   <a href="javascript:list('${map.page_info.nextPage}')">[다음]</a>
   </c:if>
   <c:if test="${map.page_info.curPage <= map.page_info.totPage }">
   <a href="javascript:list('${map.page_info.totPage}')">[끝]</a>
   </c:if>
</tr>
</table>
</body>
</html>
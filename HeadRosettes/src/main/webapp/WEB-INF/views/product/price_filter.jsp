<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../include/main_menu.jsp" %>
<%@include file="../include/product.jsp" %>
<table width="100%">
<c:forEach var="row" items="${map.price_filter}" varStatus="vs">
	<td style="width:20%; word-break; break-word; vertical-align: bottom">
		<c:choose>
			<c:when test="${row.p_image != '-'}">
				<a href="/product/detail.do?p_code=${row.p_code}&cur_page=${map.page_info.curPage}&search_option=${map.search_option}&keyword=${map.keyword}">
				<img src="/resources/images/${row.p_image}"  width="200px" height="200px"><br></a>
			</c:when>
		<c:otherwise>
			[상품 이미지 미등록]<br>
		</c:otherwise>	
		</c:choose>	
	<a href="/product/brand_list/${row.p_brand}">${row.p_brand_name}<br></a> 
	<a href="/product/detail.do?p_code=${row.p_code}&cur_page=${map.page_info.curPage}&search_option=${map.search_option}&keyword=${map.keyword}">
	${row.p_name}</a><br>
	<fmt:formatNumber value="${row.p_price}" pattern="#,###" />원
	 <sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/product/edit/${row.p_code}">[편집]</a>
	</sec:authorize>
	</td>
	
	<c:if test="${vs.count mod 5 == 0 }">
	<tr></tr>
	</c:if>
</c:forEach>
</table>
</body>
</html>
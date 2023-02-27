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
<title>Products</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link type="text/css" href="/resources/css/styles.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location="/product/write.do";
	});
});

function list(page){
	location.href="/product/list.do?curPage="+page+"&search_option=${map.seach_option}&keyword=${map.keyword}";
}
</script>
<style type="text/css">
.line_limit {
      width:200px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
      display:inline-block;
  }
  
 a:link {
  color : #343A40;
}
a:visited {
  color : #343A40;
}
a:hover {
  color : #343A40;
}
a:active {
  color : #343A40;
}
</style>
</head>
<body>
<%@include file="../include/main_menu.jsp" %>
<%@include file="../include/product.jsp" %>
<div id="productList">
<br>
<h6 style="padding-left: 50px;">상품 ${map.count}개</h6>
<table width="100%">
<c:forEach var="row" items="${map.list}" varStatus="vs">
	<td style="width:20%; word-break; break-word; 
	vertical-align: bottom; padding-left: 50px; padding-bottom: 50px;">
		<c:choose>
			<c:when test="${row.p_image != '-'}">
							
				<a href="/product/detail_1.do?p_code=${row.p_code}&cur_page=${map.page_info.curPage}&search_option=${map.search_option}&keyword=${map.keyword}"></a>
			
			
				<a href="/product/detail_2.do?p_code=${row.p_code}&cur_page=${map.page_info.curPage}&search_option=${map.search_option}&keyword=${map.keyword}"></a>
			
				<img src="/resources/images/${row.p_image}"  width="200px" height="200px"><br>
			</c:when>
		<c:otherwise>
			[상품 이미지 미등록]<br>
		</c:otherwise>	
		</c:choose>
		
	<a href="/product/brand_list/${row.p_brand}">${row.p_brand_name}<br></a>
	<sec:authorize access="isAnonymous()">	
	<a class="line_limit"
	href="/product/detail_1.do?p_code=${row.p_code}&cur_page=${map.page_info.curPage}&search_option=${map.search_option}&keyword=${map.keyword}">
	${row.p_name}</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<a class="line_limit"
	href="/product/detail_2.do?p_code=${row.p_code}&cur_page=${map.page_info.curPage}&search_option=${map.search_option}&keyword=${map.keyword}">
	${row.p_name}</a>
	</sec:authorize>
	<br>
	<fmt:formatNumber value="${row.p_price}" pattern="#,###" />원
	 <sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/product/edit/${row.p_code}">[편집]</a>
</sec:authorize> 
	</td>
	
	<c:if test="${vs.count mod 4 == 0 }">
	         
	<tr></tr> 
	</c:if>
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
</div>
<br>
<br>
</body>
</html>
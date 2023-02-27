<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 리스트</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
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
<body style="padding-left: 50px;">
<%@include file="../include/main_menu.jsp" %>
<%@include file="../include/product.jsp" %>
<br>
<hr>
<c:forEach var="row2" items="${map.brand_list}" begin="0" end="0" step="1">
<h3 style="text-align: center;">${row2.p_brand_name}</h3>
</c:forEach>
<br>상품 ${map.brand_count}개
<table width="100%">
<c:forEach var="row" items="${map.brand_list}" varStatus="vs">
   <td style="width:20%; word-break; break-word; vertical-align: bottom; padding-bottom: 50px;">
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
   <c:if test="${sessionScope.a_id != null }"><br>
   <a href="/product/edit/${row.p_code}">[편집]</a>
   </c:if>   
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
</body>
</html>
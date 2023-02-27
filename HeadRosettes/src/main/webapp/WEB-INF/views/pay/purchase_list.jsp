<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<link href="/resources/css/styles.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
<style>
th{
	 background-color: #F5F5F5;
		color: #343A40;
}

table{
	margin: auto;
	width: 90%;

}
</style>
<script>
function write_review(data){
	var bpc_idx=data;
	document.form1.action="/review/write.do?bpc_idx="+bpc_idx;
	document.form1.submit();
}
</script>
</head>
<body>
<%@ include file="../include/main_menu.jsp"%>
<form name="form1" method="post">
<h3 style="padding-left: 80px;" align="center">구매내역</h3>
   <table>
      <thead align="center">
      <tr>
         <th>주문번호</th>
         <th>주문자명</th>
         <th>배송지</th>
         <th>제품이름</th>
         <th>제품수량</th>
         <th>주문날짜</th>
         <th>총주문금액</th>
         <th>배송현황</th>
         <th>기타</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="row" items="${map.p_code_list}">
      <tr>
         <td align="center">${row.pay_idx}</td>
         <td align="center">${map.m_name}</td>
         <td align="center">${map.address} ${map.detailAddress}[${map.postcode}]</td>
         <td align="center">${row.p_name}</td>
         <td align="center">${row.amounts}</td>
         <td align="center"><fmt:formatDate value="${row.bpc_date}" pattern="yyyy-MM-dd" /></td>
         <td align="center">${row.money}</td>
         <td align="center">${row.b_state}</td>
         <td align="center">
         <c:if test="${row.b_state == '배송완료' && row.r_idx == null }">
         <input type="button" value="리뷰쓰기"  onclick="write_review('${row.bpc_idx}')">
         </c:if>
         <c:if test="${row.r_idx != null }">
         리뷰쓰기 완료
         </c:if>
      </c:forEach>
      </tbody>
   </table>
   </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link href="/resources/css/styles.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link type="text/css" href="/resources/css/table_style1.css"
	rel="stylesheet">
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
</head>
<body>
	<%@ include file="../include/main_menu.jsp"%>
	<div>
	<h3 style="padding-left: 80px;">주문처리가 완료되었습니다.</h3>
	  <br>
	</div>
	<table border="0" width="1500px">
		<tr>
			<th colspan="2" class="text-center">주문정보</th>
		</tr>
		<tr>
			<td align="center">이름</td>
			<td align="center">${map.m_name}</td>
		</tr>
		<tr>
         <td align="center">결제금액</td>
         <c:forEach var="row2" items="${map.buy_list}" begin="0" end="0">
         <td align="center">${row2.money}원</td>
         </c:forEach>
         </tr>
		<tr>
			<td align="center">연락처</td>
			<td align="center">${map.m_phone}</td>
		</tr>
		  <tr>
         <td align="center">배송지주소</td>
         <td align="center">${map.address} ${map.detailAddress} [${map.postcode}]</td>
      </tr>

		<tr>
			<td align="center">이메일주소</td>
			<td align="center">${map.m_email}</td>
	</table>


</body>
</html>
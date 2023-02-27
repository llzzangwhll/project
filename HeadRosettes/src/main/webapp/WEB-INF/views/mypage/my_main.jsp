<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
function write_review(data){
	var bpc_idx=data;
	// console.log("bpc_idx" + bpc_idx);
	document.form1.action="/review/write.do?bpc_idx="+bpc_idx;
	document.form1.submit();
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



.center{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="../include/main_menu.jsp" %>
<form name="form1" method="post">

<div class="center">
<table width="1500px">
<c:forEach var="row" items="${map.my_main}">
<tr>
<td style="font-size: 25px;">${row.m_name}님 안녕하세요.</td>
</tr>
<tr>
<td>보유 적립금 : ${row.m_point}원</td>
</tr>
</c:forEach>
</table>
</div>


<br><br>
<div style="text-align: center; font-size: 20px;">최근 주문 내역</div>
   <br>
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
         <th>리뷰</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="row2" items="${map.purchase_list}">
      <tr>
         <td align="center">${row2.b_idx}</td>
         <td align="center">${row2.m_name}</td>
         <td align="center">${row2.address} ${row2.detailAddress}[${row2.postcode}]</td>
         <td align="center">${row2.p_name}</td>
         <td align="center">${row2.amounts}</td>
         <td align="center"><fmt:formatDate value="${row2.b_date}" pattern="yyyy-MM-dd" /></td>
         <td align="center">${row2.money}</td>
         <td align="center">${row2.b_state}</td>
         <td align="center">
         <c:if test="${row2.b_state == '배송완료' && row2.r_idx == null }">
         <input type="button" value="리뷰쓰기"  onclick="write_review('${row2.bpc_idx}')">
         </c:if>
         <c:if test="${row2.r_idx != null }">
         리뷰쓰기 완료
         </c:if>
         </td>
      </c:forEach>
      </tbody>
   </table>

	</form>
</body>
</html>
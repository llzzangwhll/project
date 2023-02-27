<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link href="/resources/css/styles.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		$("#btnList").click(function() {
			location.href = "/product/list.do";
		});
		$("#btnCart").click(function(){
			document.form1.action = "/cart/insert.do";
			document.form1.submit();
		});
		$("#btnPay").click(function(){
			document.form1.action = "/pay/insert.do";
		    document.form1.submit();
		});
	});

	
	var sell_price;
	var amounts;

	function init() {
		sell_price = document.form1.sell_price.value;
		amounts = document.form1.amounts.value;
		document.form1.sum.value = sell_price;
		change();
	}

	function add() {
		hm = document.form1.amounts;
		sell_price = document.form1.sell_price;
		hm.value++;
		var sum_ = parseInt(hm.value) * sell_price.value;	
		document.getElementById("my_sum").innerHTML = sum_.toLocaleString('ko-KR');
	}

	function del() {
		hm = document.form1.amounts;
		sell_price = document.form1.sell_price;
		if (hm.value > 1) {
			hm.value--;
			var sum_ = parseInt(hm.value) * sell_price.value;
			document.getElementById("my_sum").innerHTML = sum_.toLocaleString('ko-KR');		
		}
	}

	function change() {
		hm = document.form1.amounts; 
		var sum_ = parseInt(hm.value) * sell_price;
		document.getElementById("my_sum").innerHTML = sum_.toLocaleString('ko-KR');
	}
</script>

<style type="text/css"> 

 padding-right: 5%;
 padding-left: 5%;
}
</style>
</head>
<body>
	<%@include file="../include/main_menu.jsp"%>
	
	<form name="form1" method="POST">
	<div align="left" style="padding-top: 10px; padding-left: 5%;">
      <input type="hidden" name="p_code" value="${dto.p_code}">
         <h3>${dto.p_name}</h3>
         <img src="/resources/images/${dto.p_image}"
            onerror="this.style.display='none'">
      
      
      </div>
     <div align="right" style="padding-top: 10px; padding-right: 5%;">
         <h3>Product Info 제품정보</h3>
			<br>
			<h4>브랜드/품번&nbsp;&nbsp;&nbsp;${dto.p_brand_name}/${dto.p_code}</h4>
			<h4>
				<fmt:formatNumber value="${dto.p_price}" pattern="#,###" />원
			</h4>
			<br> <br> 옵션선택&nbsp;&nbsp;
				<select name="color">
				<option value="p_color1">${dto.p_color1}</option>
				<c:if test="${dto.p_color2 != '없음' }">
					<option value="p_color2">${dto.p_color2}</option>
				</c:if>				
				<c:if test="${dto.p_color3 != '없음' }">
					<option value="p_color3">${dto.p_color3}</option>
				</c:if>
			</select>
			<br>
			<br>	
				수량<input type="button" value=" - " onclick="del();">
					<input type="hidden" name="sell_price" style="width:30px;" 
					value="${dto.p_price}" >
					<input type="text" name="amounts" value="1"
				size="3" onchange="change();">
				<input type="button" value=" + " onclick="add();">
				<input type="hidden" name="sum" size="11" readonly>
				<div>금액 :<span id="my_sum"><fmt:formatNumber 
				value="${dto.p_price}" pattern="#,###" /></span>원</div>	
<input type="hidden" name="m_id" id="m_id"
					value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">

			<br> <br>
			<button type="button" style="width: 150px; height: 30px;"
				id="btnCart">장바구니</button>
			<br> <br>
			<button type="button" style="width: 150px; height: 30px;" id="btnPay">바로구매</button>
		</div>
		<hr>
		<br>	
<div style="text-align: center;">
      <img src="/resources/images/${dto.p_detail_image}" style="width: 600px;">
      </div>
      <br>
      <div align="center">
		<button id="btnList" type="button">목록</button></div>
		<br>
		<hr>
	</form>
	<%@include file="../include/spe_review.jsp" %>
		<br><br>
</body>
</html>
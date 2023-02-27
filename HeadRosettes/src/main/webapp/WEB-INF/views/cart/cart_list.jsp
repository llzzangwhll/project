<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
$(function(){
   $("#btnList").click(function() {
	location.href = "/product/list.do";
   });
   var chkObj = document.getElementsByName("RowCheck");
   var rowCnt = chkObj.length;

   $("input[name='allCheck']").click(function() {
	var chk_listArr = $("input[name='RowCheck']");
	for (var i = 0; i < chk_listArr.length; i++) {
		chk_listArr[i].checked = this.checked;
	}
  });

  $("input[name='RowCheck']").click(function() {
	if ($("input[name='RowCheck']:checked").length == rowCnt) {
		$("input[name='allCheck']")[0].checked = true;
	} else {
		$("input[name='allCheck']")[0].checked = false;
	}
  });
  $("#btnDelete").click(function() {
	if (confirm("장바구니를 비우시겠습니까?")) {
		location.href = "/cart/deleteAll.do";
	}
  });
  $("#btnPay").click(function() {
	  if (${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.address == ""}){
		  location.href="/member/insert_address.do";
	  }else if (${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.address != ""}){
	  if (confirm("결제페이지로 이동하시겠습니까?")) {
		document.form1.action = "/pay/cart_insert.do";
		document.form1.submit();
	}
	  }
});

});

function deleteValue() {
	var url = "delete.do";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	for (var i = 0; i < list.length; i++) {
	if (list[i].checked) {
		valueArr.push(list[i].value);
			}
		}
	if (valueArr.length == 0) {
		alert("선택된 상품이 없습니다.");
		} else {
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data : {
					valueArr : valueArr
				},
			success : function(jdata) {
				if (jdata = 1) {
					alert("삭제 성공");
				location.href = "/cart/list.do"
			} else {
				alert("삭제 실패")
			}
		}
	});
}
}

function change() {
	   
	   var amounts= new Array();
	   var cart_idx=[];
	   var p_price=[];
	   var money=[];
	   
	   $("#cart tbody").find('tr').each(function() {
	       amounts.push($(this).find(':nth-child(5)').children("input").val());
	       cart_idx.push($(this).find(':nth-child(1)').children("input").val());
	       p_price.push($(this).find(':nth-child(4)').text());
	       money.push($(this).find(':nth-child(6)').text());
	   });
	     $.ajax ({
	       url : "/cart/update.do",
	       type : "POST",
	       data: {amounts : amounts,
	            cart_idx : cart_idx,
	            p_price : p_price,
	            money : money},
	       success : function() {
	          for (var i=0; i<amounts.length; i++) {
	                money[i] = amounts[i] * p_price[i];        
	                       } 
	       
	          for (var i=0; i< amounts.length; i++){
	            
	           cart.rows[i+1].cells[5].innerHTML=money[i];
	      
	           }
	          cal_sumMoney()
	            
	      }
	             
	          
	         });
	     
	}

	function cal_sumMoney() {
	   $.ajax({
	      url : "/cart/cal.do",
	       dataType : "json",
	       success : function(data) {
	           $("#sumMoney").text(data.sumMoney+ "원"); 
	           $("#fee").text(data.fee +"원");
	           $("#sum").text(data.sum +"원");
	         
	       }
	       
	   });
	}


</script>
<title>장바구니</title>
<link href="/resources/css/styles.css" rel="stylesheet">
<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
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
	<h3 style="padding-left: 80px;">Cart</h3>
	<c:choose>
		<c:when test="${map.count == 0 }">
      <h5 style="padding-left: 80px;">장바구니가 비었습니다.</h5>
   </c:when>
		<c:otherwise>
			<form method="post" name="form1" action="/pay/cart_insert.do">
				<table id="cart" border="0" width="1500px">
					<thead align="center">
						<tr>
							<th><input type="checkbox" id="allCheck" name="allCheck">전체선택</th>
							<th>상품명</th>
							<th>상품사진</th>
							<th>단가</th>
							<th>수량</th>
							<th>상품금액(원)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${map.list}">
							<tr>
								<td align="center"><input type="checkbox" name="RowCheck"
									id="cart_idx" value="${row.cart_idx}" /></td>
								<td align="center">${row.p_name}</td>
								<td align="center"><c:choose>
										<c:when test="${row.p_image != '-' }">
											<img src="/resources/images/${row.p_image}" width="100px"
												height="100px">
											<br>
										</c:when>
										<c:otherwise>
											<br>
										</c:otherwise>
									</c:choose></td>
								<td align="center">${row.p_price}</td>
								<td align="center"><input type="number"
									style="width: 50px;" min="0" max="100" id="amount"
									name="amount" onchange="change();" value="${row.amounts}">개
								<td align="center">
									<span id="money">${row.money}</span>
								</td>

							</tr>
							<input type="hidden" name="p_code" id="p_code" value="${row.p_code}">
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div align="center" id="inform">

					 상품가격:<span id = "sumMoney">${map.sumMoney}원</span><br>
					 배송비:<span id = "fee"> ${map.fee}원</span><br> 
					 주문금액:<span id = "sum">${map.sum}원</span>
				</div>
				<br>
				<span style="padding-left : 80px;">
				<button type="button" onclick="deleteValue()">선택삭제</button>&nbsp;
				<button type="button" id="btnDelete">장바구니 비우기</button>
			</span>
			
			</form>
		</c:otherwise>
	</c:choose>
	<br>
	<span style="padding-left: 80px;">
	<button type="button" id="btnList">계속 쇼핑하기</button>&nbsp;
	<input type="button" id="btnPay" value="결제">
    </span>
</body>
</html>
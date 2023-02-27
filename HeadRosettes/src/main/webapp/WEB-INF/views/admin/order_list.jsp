<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/styles.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<link type="text/css" href="/resources/css/table_style1.css"
   rel="stylesheet">
   <link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script>
$(function(){

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
         if (confirm("주문목록를 비우시겠습니까?")) {
            location.href = "/admin/buy_deleteAll.do";
         }
         });
   });
function deleteValue() {
   var url = "buy_delete.do";
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
            location.href = "/admin/list.do"
         } else {
            alert("삭제 실패")
         }
      }
   });
}
}

function btnB_state_change() {
   var b_idx=[];
   var b_state=[];
   
   $("#order tbody").find('tr').each(function() {
      b_idx.push($(this).find(':nth-child(1)').children("input").val());
      b_state.push($(this).find(':nth-child(9)').children("select").val());
   });
   confirm("정말 변경하시겠습니까?");
   $.ajax ({
      url : "/pay/update_b_state.do",
      type : "POST",
      data : {b_idx : b_idx,
            b_state : b_state},
      success : function() {
         
      
         alert("변경되었습니다.");
      
      }
   });
}
</script>
<title>주문정보</title>
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
<%@ include file="../include/main_menu.jsp" %>
<h3 style="padding-left: 80px;">주문관리</h3>
<br>
<c:choose>
   <c:when test="${map.count == 0 }">
      주문정보가 없습니다.
   </c:when>
   <c:otherwise>
      <form method="post" name="form1">
         <table id ="order" border="0">
            <thead align="center">
            <tr>
               <th><input type="checkbox" id="allCheck" name="allCheck">전체선택</th>
               <th>주문자 아이디</th>
               <th>주문자 이름</th>
               <th>배송지 주소</th>
               <th>주문자 연락처</th>
               <th>주문자 이메일주소</th>
               <th>주문날짜</th>
               <th>주문금액</th>
               <th>배송현황</th>
            </tr>
            </thead>
         <tbody>
            <c:forEach var="row" items="${map.buy_list}">
            <tr>
               <td align="center"><input type="checkbox" name="RowCheck"
                           id="b_idx" value="${row.b_idx}" /></td>
            <td align="center">${row.m_id}</td>
            <td align="center">${row.m_name}</td>
            <td align="center">${row.address} ${row.detailAddress} [${row.postcode}]</td>
            <td align="center">${row.m_phone}</td>
            <td align="center">${row.m_email}</td>
            <td align="center">${row.b_date}</td>
            <td align="center">${row.money}</td>
            <td align="center">
            <select name="b_state" id="b_state">
               
               <option value="상품준비중"<c:if test="${row.b_state == '상품준비중'}">selected</c:if>>상품준비중</option>
               <option value="출고완료"<c:if test="${row.b_state == '출고완료'}">selected</c:if>>출고완료</option>
               <option value="배송중"<c:if test="${row.b_state == '배송중'}">selected</c:if>>배송중</option>
               <option value="배송완료"<c:if test="${row.b_state == '배송완료'}">selected</c:if>>배송완료</option>
               
            </select>
            <button type="button" onclick="btnB_state_change()">주문현황변경</button></td>
            </tr>
            </c:forEach>
         </tbody>
               
         </table>
         <br>
         <span style="padding-left: 80px;">
         <button type="button" onclick="deleteValue()">선택삭제</button>
      <button type="button" id="btnDelete">주문목록 비우기</button>
      </span>
      </form>
   </c:otherwise>
</c:choose>
</body>
</html>
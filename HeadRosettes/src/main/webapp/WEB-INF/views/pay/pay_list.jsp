<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<link href="/resources/css/styles.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>

function requestPay() {
    var amounts = [];
    var p_code = [];
    var p_name=[];

 
   const amount = document.getElementById("result2").innerText;
   const pay_idx = document.getElementById("pay_idx").value;
   const m_name = document.getElementById("m_name").value;
   const m_id = document.getElementById("m_id").value;
   const m_email = document.getElementById("m_email").value;
   const address = document.getElementById("address").value;
   const detailAddress = document.getElementById("detailAddress").value;
   const m_phone = document.getElementById("m_phone").value;
   const postcode = document.getElementById("postcode").value;
   const used_point = parseInt(document.getElementById("result").innerText);
   const all_point2=parseInt(document.getElementById('all_point').value);
   const used_point2=parseInt(document.getElementById('used_point').value); 
   
   $("#pay tbody").find('tr').each(function() {
      amounts.push($(this).find(':nth-child(4)').children("input").val());
      p_code.push($(this).find(':nth-child(3)').children("input").val());
      p_name.push($(this).find(':nth-child(1)').children("input").val());
      
   });
  
   if(amount < 0 || used_point2 > all_point2){
      alert("적립금을 올바르게 입력하세요.");
      location.href="/pay/list.do";
   }else{

              IMP.init('imp36656544');

                
                 IMP.request_pay({
                     pg : 'kakaopay.TC0ONETIME',
                      pay_method : 'card',
                      merchant_uid: pay_idx+m_id,
                       
                      name : '헤드폰',
                      amount : amount,
                      buyer_email : m_email,
                      buyer_name : m_name,
                      buyer_tel : m_phone,
                      buyer_addr : address,
                      buyer_postcode : postcode
                  }, function (rsp) {
                    if (rsp.success) {
                      jQuery.ajax({
                          url: "/pay/buy_insert.do", 
                          method: "POST",
                          data: {
                             m_name : m_name,
                             money : amount,
                             m_id : m_id,
                             m_email : m_email,
                             m_phone : m_phone,
                             address : address,
                             detailAddress : detailAddress,
                             postcode : postcode,
                             p_code : p_code,
                             amounts : amounts,
                             pay_idx : pay_idx,
                             p_name : p_name,
                             used_point : used_point
                              
                              
                          }
                      }).done(function (result) {
                         
                         location.href="/pay/pay_success.do"
                        
                              
         
                      })
                    } else {
                      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
                      location.href="/"
                    }
                  });
                }   
             }
             

function all_m_point(){
   const all_point=document.getElementById('all_point').value;
   const used_point=document.getElementById('used_point');
   const sum=document.getElementById('sum').value;
   const dd=sum-all_point;
   if(all_point!=0){
      used_point.value=all_point;
      document.getElementById("result").innerText=all_point;
      document.getElementById("result2").innerText=dd;
      
      
   }else{
      alert("사용 가능한 적립금이 없습니다.");
   }
      
}

function print(){
   const all_point2=document.getElementById('all_point').value;
   const used_point2=document.getElementById('used_point').value;
   const sum2=document.getElementById('sum').value;
   const dd2=sum2-used_point2;

   document.getElementById("result").innerText=used_point2;   
   document.getElementById("result2").innerText=dd2;      
}

                
</script>
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
<%@ include file="../include/main_menu.jsp" %>
<h3 style="padding-left: 80px;">결제페이지</h3>

<c:choose>
   <c:when test="${map.count == 0 }">
      구매목록이 비었습니다.
   </c:when>
   <c:otherwise>
      <form method="post" name="form1">
         <table id="pay" border="0" width="1500px">
            <thead>
            <tr>
               <th>상품명</th>
               <th>상품사진</th>
               <th>단가</th>
               <th>수량</th>
               <th>상품금액</th>
            </tr>
            </thead>
            <tbody>
   <c:forEach var="row" items="${map.list}">
            <tr>
               <td align="center">${row.p_name}<input type="hidden" id="p_name" value="${row.p_name}"></td>
               <td align="center">
               <c:choose>
                  <c:when test="${row.p_image != '-' }">
                  <img src="/resources/images/${row.p_image}" width="100px" height="100px"><br>
               </c:when>
               <c:otherwise><br>
               </c:otherwise>
            </c:choose>
               </td>
                 <td align="center">${row.p_price}원<input type="hidden" id="p_code" value="${row.p_code}"></td> 
               <td align="center">${row.amounts}개
              <input type="hidden" id="amounts" value="${row.amounts}">
              
       
               </td>
               <td align="center">${row.money}원<input type="hidden" id="m_name" value="${row.m_name}">
                  <input type="hidden" id="m_id" value="${row.m_id}">
                  <input type="hidden" id="m_email" value="${row.m_email}">
               <input type="hidden" id="address" value="${row.address}">
               <input type="hidden" id="detailAddress" value="${row.detailAddress}">
               <input type="hidden" id="postcode" value="${row.postcode}">
                  <input type="hidden" id="m_phone" value="${row.m_phone}">
                  <input type="hidden" id="pay_idx" value="${row.pay_idx}">
                  </td>
               
            </tr>
         </c:forEach>
         
           
            <c:forEach var="row2" items="${map.list}" begin="0" end="0" step="1">
               <tr>
                  <td>사용 가능 적립금&nbsp;(${row2.m_point}원)&nbsp;&nbsp;<button type="button" value="${row2.m_point}" 
                  onclick="all_m_point()" id="all_point">전액 사용</button></td>
                  <td><input type="text" id="used_point" style="text-align: right;" onkeyup="print()" value="0">원</td>
                  <td></td>
               </tr>            
         </c:forEach>
         
            <tr>
               <td colspan="7" align="center">
                  상품가격
                  <fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###" />원<br>
                  적립금 사용
                  <span id="result">0</span>원<br>
                  배송비 ${map.fee}원<br>
                  주문금액
                  <input type="hidden" id="sum" value="${map.sum}">
                  <%-- <fmt:formatNumber value="${map.sum}" pattern="#,###,###" /> --%><span id="result2">${map.sum}</span>원
                  
               </td>
            </tr>  
            </tbody> 
         </table>  
         <br>   
         <span style="padding-left: 80px;">
      <button type="button" onclick="requestPay()">결제하기</button>
      </span>
      </form>
   </c:otherwise>
</c:choose>

</body>
</html>
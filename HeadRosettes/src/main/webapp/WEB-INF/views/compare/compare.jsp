<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품비교</title>
<link type="text/css" href="/resources/css/compare_style.css" rel="stylesheet">
<link href="/resources/css/styles.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">

<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

 $(function() {
	$("#sel1").change(function() {
 				document.form1.submit();	
	});
	$("#sel2").change(function() {
 				document.form2.submit(); 
	});
 	compare();  
 });	
 
 

  function compare() {
	 var price1 = parseInt($('table tbody tr:nth-child(5) td:nth-child(1)').text());
	 var price2 = parseInt($('table tbody tr:nth-child(5) td:nth-child(3)').text());
	 var noise1=$('table tbody tr:nth-child(10) td:nth-child(1)').text();
	 var noise2=$('table tbody tr:nth-child(10) td:nth-child(3)').text();
	 var weight1=parseInt($('table tbody tr:nth-child(7) td:nth-child(1)').text());
	 var weight2=parseInt($('table tbody tr:nth-child(7) td:nth-child(3)').text());
	 var line1=$('table tbody tr:nth-child(11) td:nth-child(1)').text();
	 var line2=$('table tbody tr:nth-child(11) td:nth-child(3)').text();
     if ( price1 > price2 ) {
    	 $('table tbody tr:nth-child(5) td:nth-child(3)').css("background-color", "#FFF0F5");
     } else if (price1 < price2 ) {
    	 $('table tbody tr:nth-child(5) td:nth-child(1)').css("background-color", "#FFF0F5");
     }
  
  
     if (noise1 == "y" && noise2 == "n") {
    	 $('table tbody tr:nth-child(10) td:nth-child(1)').css("background-color", "#FFF0F5");
     } else if (noise1 == "n" && noise2 == "y"){
    	 $('table tbody tr:nth-child(10) td:nth-child(3)').css("background-color", "#FFF0F5"); 
    	 } 
      
      if (weight1 < weight2) {
    	  $('table tbody tr:nth-child(7) td:nth-child(1)').css("background-color", "#FFF0F5");
      } else if (weight1 > weight2) {
    	  $('table tbody tr:nth-child(7) td:nth-child(3)').css("background-color", "#FFF0F5");
      }
      
      if (line1 == "n" && line2 == "y") {
    	  $('table tbody tr:nth-child(11) td:nth-child(1)').css("background-color", "#FFF0F5");
      } else if (line1 == "y" && line2 == "n") {
    	  $('table tbody tr:nth-child(11) td:nth-child(3)').css("background-color", "#FFF0F5");
      }
  }  
	 

 
 
 
 
 
 </script>
 <style>

table{ text-align: center;

 }

 th{
 	 background-color: #F5F5F5;
     color: #343A40;"
     background-color: #343A40;
} 

table{
 	margin: auto;
 	width: 90%;
 }
 
 @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

select {
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  
  font-family: "Noto Sansf KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  
  color: #444;
  background-color: #fff;
   
  padding: .6em 1.4em .5em .8em;
  margin: 0;
  
  border: 1px solid #aaa;
  border-radius: .5em;
  box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
}

select:hover {
  border-color: #888;
}

select:focus {
  border-color: #aaa;
  box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
  box-shadow: 0 0 0 3px -moz-mac-focusring;
  color: #222;
  outline: none;
}

select:disabled {
  opacity: 0.5;
}

label {
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 600;
  line-height: 1.3;
  
  color: #444;
  
  margin-right: 0.5em;
}

body {
  margin: 0;
}
 
 </style>
	
</head>
<body>
	<%@ include file="../include/main_menu.jsp"%>
	<h3 style="padding-left: 70px;">제품비교</h3>
	<br>
	
	<span id="test"></span>
	
	
	<table>
	<tr>
	<td align="center">
	<form id="form1" name="form1" method="post">
		<select id="sel1" name="p_name1">
			<option value="">선택</option>
			<c:forEach var="row" items="${map.list}">
			  <optgroup label="${row.p_brand_name}">
				<option value="${row.p_name}"  <c:if test="${row.p_name == p_name1 }">selected</c:if>>${row.p_name}</option>
			  </optgroup>
			</c:forEach>
		</select>
		<input type="hidden" name="p_name2" value="${map.dto2.p_name}">
	</form>
	</td>
	<td>&nbsp</td>
	<td align="center">	
	   <form id="form2" name="form2" method="post">
		<select id="sel2" name="p_name2">
			<option value="">선택</option>
			<c:forEach var="row" items="${map.list}">
			   <optgroup label="${row.p_brand_name}">
				<option value="${row.p_name}"  <c:if test="${row.p_name == p_name2 }">selected</c:if> >${row.p_name}</option>
			   </optgroup>
			</c:forEach>
		</select>
		<input type="hidden" name="p_name1" value="${map.dto1.p_name}">
	</form>
	</td>
	</tr>
	<tbody>
		<tr>
		<th id="p_name1">${map.dto1.p_name}</th>
		<th>상품명</th>
		<th>${map.dto2.p_name}</th>
		</tr>
		<tr>
		<td><img src="/resources/images/${map.dto1.p_image}"
					width="300px" height="300px" onerror="this.style.display='none'"></td>
		<th>상품 이미지</th>
		<td><img src="/resources/images/${map.dto2.p_image}"
					width="300px" height="300px" onerror="this.style.display='none'"></td>
		</tr>
		<tr>
		<td>${map.dto1.p_code}</td>
		<th>상품코드</th>
		<td>${map.dto2.p_code}</td>
		</tr>
		<tr>
		<td>${map.dto1.p_brand}</td>
		<th>제조사</th>
		<td>${map.dto2.p_brand}</td>
		</tr>
		<tr>
		<td>${map.dto1.p_price}</td>
		<th>가격</th>
		<td>${map.dto2.p_price}</td>
		</tr>
		<tr>
		<td>
		<c:set var="size" value="${map.dto1.p_length}"/>
		<c:choose>
			<c:when test="${size == '0' }">
			-
			</c:when>
			<c:otherwise>
			${map.dto1.p_length}mm*${map.dto1.p_width}mm*${map.dto1.p_height}mm
			</c:otherwise>
		</c:choose>
		</td>
		<th>사이즈</th>
		<td>
		<c:set var="size" value="${map.dto2.p_length}"/>
		<c:choose>
			<c:when test="${size == '0' }">
			-
			</c:when>
			<c:otherwise>
			${map.dto2.p_length}mm*${map.dto2.p_width}mm*${map.dto2.p_height}mm
			</c:otherwise>
		</c:choose>
		</td>
		</tr>
		<tr>
		<td>${map.dto1.p_weight}</td>
		<th>무게</th>
		<td>${map.dto2.p_weight}</td>
		</tr>
		<tr>
		<td>${map.dto1.p_color1}/${map.dto1.p_color2}/${map.dto1.p_color3}</td>
		<th>색상</th>
		<td>${map.dto2.p_color1}/${map.dto2.p_color2}/${map.dto2.p_color3}</td>
		</tr>
		<tr>
		<td>${map.dto1.p_playtime}</td>
		<th>재생시간</th>
		<td>${map.dto2.p_playtime}</td>
		</tr>
		<tr>
		<td>${map.dto1.p_noise}</td>
		<th>노이즈캔슬링</th>
		<td>${map.dto2.p_noise}</td>
		</tr>
		<tr>
		<td>${map.dto1.p_line}</td>
		<th>유무선여부</th>
		<td>${map.dto2.p_line}</td>
		</tr>
		</tbody>
	</table>

<br>
<br>
</body>
</html>
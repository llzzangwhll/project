<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/joeblog.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script>
function filter(event){
	const brand_filter=document.form1.brand_filter.value;	
	const price_filter=document.form1.price_filter.value;
	
	document.form1.action="/product/list_filter.do";
	document.form1.submit();
}


$(function(){
   $("#btnFilter").click(function(){
	 var p_brand=$('input[name=p_brand]:checked').val();
     var p_price=$('input[name=p_price]:checked').val();
     var p_noise=$('input[name=p_noise]:checked').val();
     var p_line=$('input[name=p_line]:checked').val();

      $.ajax({
         url : "/product/list_filter.do",
         type : "post",
         data : {p_brand : p_brand,
                 p_price : p_price,
                 p_noise : p_noise,
                 p_line : p_line
                 	}, 
         success : function (result){
        	 		$("#productList").css("display","none");
         			$("#product").html(result);
         
         }
      })
	      
	      
   })
});





$(function(){
	$("#btnSearch").click(function(){
		var search_option=$("select[name=search_option]").val();
		var keyword=$("input[name=keyword]").val();
		$.ajax({
	         url : "/product/list.do",
	         type : "post",
	         data : {search_option : search_option,
	        	 		keyword : keyword
	                 	},
	         success : function (result){
	        	 		alert("검색완료");		
	         }
	      })
		      
		      
	})
});



$(function(){
	$("#btn_toggle").click(function(){
		$("#toggle").toggle();
	});
});

</script>

</head>
<body>
<div style="padding-left: 50px;">
<h3>Items</h3>
<form name=form1 method="post" action="/product/list.do"> 
<select name="search_option" id="search_option">
	<option value="all"
	<c:out value="${map.search_option == 'all' ? 'selected' : ''}"/> >전체</option>
	<option value="p_name"
	<c:out value="${map.search_option == 'p_name' ? 'selected' : ''}"/> >상품명</option>
	<option value="p_brand_name"
	<c:out value="${map.search_option == 'p_brand_name' ? 'selected' : ''}"/> >브랜드</option>	
</select>
<input name="keyword" value="${map.keyword}"> 
<input type="submit" value="검색">
 <sec:authorize access="hasRole('ROLE_ADMIN')">
	<button type="button" id="btnWrite">상품등록</button>
</sec:authorize> 	
<br><br>
브랜드&nbsp;&nbsp;
<input type=radio value="0" name="p_brand" id="p_brand" checked>&nbsp;전체
<c:forEach var="row" items="${map.list2}">
<input type="radio" value="${row.p_brand_idx}" name="p_brand" id="p_brand">&nbsp;${row.p_brand_name}
</c:forEach>


<br><br>
가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" value="100000000" name="p_price" id="p_price" checked>&nbsp;전체
<input type="radio" value="50000" name="p_price" id="p_price">&nbsp;~50,000원
<input type="radio" value="100000" name="p_price" id="p_price">&nbsp;~100,000원
<input type="radio" value="200000" name="p_price" id="p_price">&nbsp;~200,000원
<input type="radio" value="300000" name="p_price" id="p_price">&nbsp;~300,000원
<input type="radio" value="1000000" name="p_price" id="p_price">&nbsp;300,000원~


<br><br>
<div id="toggle" style="display: none;">
노이즈캔슬링&nbsp;
<input type="radio" value="n" name="p_noise" id="p_noise" checked>&nbsp;n
<input type="radio" value="y" name="p_noise" id="p_noise">&nbsp;y


<br><br>
유무선&nbsp;
<input type="radio" value="n" name="p_line" id="p_line" checked>&nbsp;무선
<input type="radio" value="y" name="p_line" id="p_line">&nbsp;유선
</div>

<button type="button" id="btn_toggle">+</button>

<br><br>

<button type="button" id="btnFilter">조회</button>

<br>
<br>

<div id="product"></div>
</form>
</div>
</body>
</html>
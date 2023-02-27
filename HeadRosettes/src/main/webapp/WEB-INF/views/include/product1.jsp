<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

function test(n){
	document.myform.brand.value=n;
	document.myform.brand.value=n;
	document.myform.submit();
}

</script>
</head>
<body>
<h3>Items</h3>
<form name=form1 method="post" action="/product/list.do"> 
<select name="seach_option">
	<option value="all"
	<c:out value="${map.search_option == 'all' ? 'selected' : ''}"/> >전체</option>
	<option value="p_name"
	<c:out value="${map.search_option == 'p_name' ? 'selected' : ''}"/> >상품명</option>
	<option value="p_brand_name"
	<c:out value="${map.search_option == 'p_brand_name' ? 'selected' : ''}"/> >브랜드</option>	
</select>
<input name="keyword" value="${map.keyword}"> 
<input type="submit" value="검색">
<c:if test="${sessionScope.a_id != null }">
	<button type="button" id="btnWrite">상품등록</button>
</c:if>


<br>
가격&nbsp;
<a href="/product/price/1" onclick="document.form1.value='1';">~50,000원</a>&nbsp;&nbsp;	
<a href="/product/price/2">50,000원~100,000만원</a>&nbsp;&nbsp;
<a href="/product/price/3">100,000원~200,000만원</a>&nbsp;&nbsp;
<a href="/product/price/4">200,000~300,000만원</a>&nbsp;&nbsp;
<a href="/product/price/5">300,000~</a>

<br><br>
제조사&nbsp;   
<a href="/product/brand_list/1" href="#" onclick="document.form1.value='1';" <c:if test="${p_brand == '1' }">class="bold"</c:if>  >애플</a>&nbsp;&nbsp;	
<a href="/product/brand_list/2" href="#" onclick="document.form1.value='2';" <c:if test="${p_brand  == '2' }"> class="bold"</c:if> >로지텍</a>&nbsp;&nbsp;
<a href="/product/brand_list/3" href="#" onclick="document.form1.value='3';" <c:if test="${p_brand  == '3' }"> class="bold"</c:if> >소니</a>&nbsp;&nbsp;
<a href="/product/brand_list/4" href="#" onclick="document.form1.value='4';" <c:if test="${p_brand  == '4' }"> class="bold"</c:if> >JBL</a>&nbsp;&nbsp;
<a href="/product/brand_list/5" href="#" onclick="document.form1.value='5';" <c:if test="${p_brand  == '5' }"> class="bold"</c:if> >마샬</a>&nbsp;&nbsp;
<a href="/product/brand_list/6" href="#" onclick="document.form1.value='6';" <c:if test="${p_brand  == '6' }"> class="bold"</c:if> >브리츠</a>&nbsp;&nbsp;
<a href="/product/brand_list/7" href="#" onclick="document.form1.value='7';" <c:if test="${p_brand  == '7' }"> class="bold"</c:if> >보스</a>&nbsp;&nbsp;
<a href="/product/brand_list/8" href="#" onclick="document.form1.value='8';" <c:if test="${p_brand  == '8' }"> class="bold"</c:if> >젠하이저</a>&nbsp;&nbsp;
<a href="/product/brand_list/9" href="#" onclick="document.myform.value='9';" <c:if test="${p_brand  == '9' }"> class="bold"</c:if> >뱅앤올룹슨</a>&nbsp;&nbsp;
<a href="/product/brand_list/10" href="#" onclick="document.form1.value='10';" <c:if test="${p_brand  == '10' }"> class="bold"</c:if> >슈어</a>&nbsp;&nbsp;
<a href="/product/brand_list/11" href="#" onclick="document.form1.value='11';" <c:if test="${p_brand  == '8' }"> class="bold"</c:if> >오디오테크니카</a>&nbsp;&nbsp;
<br>
<br>상품 ${map.count}개
<br>
<br>
<input type="hidden" name="p_price" value="p_price">
<input type="hidden" name="p_brand" value="p_brand">
</form>
</body>
</html>
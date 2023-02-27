<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
function product_write(){
	const p_name=document.form1.p_name.value;
	const p_brand=document.form1.p_brand.value;
	const p_code=document.form1.p_code.value;
	if(p_code==""){
		alert("상품코드를 입력하세요.");
		document.form1.p_code.focus();
		return;
	}
	if(p_name==""){
		alert("상품명을 입력하세요.");
		document.form1.p_name.focus();
		return;
	}
	if(p_brand==""){
		alert("브랜드를 입력하세요.");
		document.form1.p_brand.focus();
		return;
	}
	document.form1.action="/product/insert.do";
	document.form1.submit();
}
</script>
</head>
<body>
<%@include file="../include/main_menu.jsp" %>
<h3>상품 등록</h3>
<form method="post" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>상품코드</td>
		<td><input name="p_code"></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td><input name="p_name"></td>
	</tr>
	<tr>
		<td>브랜드</td>
		<td><input name="p_brand"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input name="p_price"></td>		
	</tr>
	<tr>
		<td>색상1</td>
		<td><input name="p_color1"></td>
	</tr>	
	
	<tr>
		<td>색상2</td>
		<td><input type="text" value="없음" name="p_color2"></td>
	</tr>
	<tr>
		<td>색상3</td>
		<td><input value="없음" name="p_color3"></td>
	</tr>
	<tr>
		<td>가로 길이</td>
		<td><input name="p_length"></td>
	</tr>
	<tr>
		<td>세로 길이</td>
		<td><input name="p_width"></td>
	</tr>
	<tr>
		<td>높이 길이</td>
		<td><input name="p_height"></td>
	</tr>
	<tr>
		<td>무게</td>
		<td><input name="p_weight"></td>
	</tr>
	<tr>
		<td>재생시간</td>
		<td><input name="p_playtime"></td>
	</tr>
	<tr>
		<td>노이즈캔슬링</td>
		<td>
		<input type="radio" name="p_noise" value="y">가능
		<input type="radio" name="p_noise" value="n">불가능
		</td>
	</tr>
	<tr>
		<td>유무선</td>
		<td>
		<input type="radio" name="p_line" value="y">무선
		<input type="radio" name="p_line" value="n">유선
		</td>
	</tr>
	<tr>
		<td>파일</td>
		<td><input type="file" name="file1" id="file1">	
		
		</td>
		<td><input type="file" name="file2" id="file2">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="등록" onclick="product_write()">
		<input type="button" value="목록" onclick="location.href='/product/list.do'">
	</tr>	
</table>
</form>
</body>
</html>
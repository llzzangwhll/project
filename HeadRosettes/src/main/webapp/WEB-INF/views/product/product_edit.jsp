<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
function product_update() {
	var p_code=document.form1.p_code.value;
	var p_brand=document.form1.p_brand.value;
	var p_name=document.form1.p_name.value;
	
	if (p_brand == "") {
		alert("브랜드를 입력하세요.");
		document.form1.p_brand.focus();
		return;
	}
	if (p_name == "") {
		alert("상품명을 입력하세요.");
		document.form1.p_name.focus();
		return;
	}
	document.form1.action = "/product/update.do";
	document.form1.submit();
}
function product_delete(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="/product/delete.do";
		document.form1.submit();
	}
}
</script>
</head>
<body>
<%@include file="../include/main_menu.jsp"%>
	<h3>상품 수정/삭제</h3>
	<form name="form1" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>브랜드</td>
				<td><input name="p_brand" value="${dto.p_brand}"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input name="p_name" value="${dto.p_name}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="p_price" value="${dto.p_price}"></td>
			</tr>
			<tr>
				<td>색상1</td>
				<td><input name="p_color1" value="${dto.p_color1}"></td>
			</tr>
			<tr>
				<td>색상2</td>
				<td><input name="p_color2" value="${dto.p_color2}"></td>
			</tr>
			<tr>
				<td>색상3</td>
				<td><input name="p_color3" value="${dto.p_color3}"></td>
			</tr>
			<tr>
			<td>가로 길이</td>
			<td><input name="p_length" value="${dto.p_length}"></td>
		</tr>
		<tr>
			<td>세로 길이</td>
			<td><input name="p_width" value="${dto.p_width}"></td>
		</tr>
		<tr>
			<td>높이 길이</td>
			<td><input name="p_height" value="${dto.p_height}"></td>
		</tr>
		<tr>
		<td>무게</td>
		<td><input name="p_weight" value="${dto.p_weight}"></td>
	</tr>
	<tr>
		<td>재생시간</td>
		<td><input name="p_playtime" value="${dto.p_playtime}"></td>
	</tr>
	<tr>
		<td>노이즈캔슬링</td>
		<td>
		<c:if test="${dto.p_noise=='y'}">
			<input type="radio" name="p_noise" value="y" checked="checked">가능
			<input type="radio" name="p_noise" value="n">불가능
		</c:if>
		<c:if test="${dto.p_noise=='n'}">
			<input type="radio" name="p_noise" value="y">가능
			<input type="radio" name="p_noise" value="n" checked="checked">불가능
		</c:if>
		</td>
	</tr>
	<tr>
		<td>유무선</td>
		<td>
		<c:if test="${dto.p_line=='y'}">
			<input type="radio" name="p_line" value="y" checked="checked">유선
			<input type="radio" name="p_line" value="n">무선
		</c:if>
		<c:if test="${dto.p_line=='n'}">
			<input type="radio" name="p_line" value="y">유선
			<input type="radio" name="p_line" value="n" checked="checked">무선
		</c:if>		
		</td>
	</tr>
			<tr>
				<td>파일1</td>
				<td><img src="/resources/images/${dto.p_image}" width="300px" height="300px">
				<br>
				<input type="file" name="file1"></td>
			</tr>
			<tr>
				<td>파일2</td>
				<td><img src="/resources/images/${dto.p_detail_image}" width="300px" height="600px">
				<br>
				<input type="file" name="file2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="hidden" name="p_code" value="${dto.p_code}">
				<input type="button" value="수정" onclick="product_update()">
				<input type="button" value="삭제" onclick="product_delete()">
				<input type="button" value="목록" onclick="location.href='/product/list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
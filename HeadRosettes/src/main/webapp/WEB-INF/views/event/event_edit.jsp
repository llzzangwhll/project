<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 편집</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">

<script>
function event_delete(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="/event/delete.do";
		document.form1.submit();
	}
}
function event_update(){
	var e_title=document.form1.e_title.value;
	var e_text=document.form1.e_text.value;
	if(e_title =="") {
		alert("제목을 입력하세요.");
		document.form1.e_title.focus();
		return;
	}
	if(e_text ==""){
		alert("내용을 입력하세요.");
		document.form1.e_text.focus();
		return;
	}
	document.form1.action="/event/update.do";
	document.form1.submit();
}
</script>
</head>
<body>
<%@ include file="../include/main_menu.jsp" %>
<h2>상품 정보 수정/삭제</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>제목</td>
		<td><input name="e_title" value="${dto.e_title}"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="5" cols="60" name="e_text"></textarea></td>
	</tr>
	<tr>
		<td>이미지</td>
		<td>
			<img src="/resources/images/${dto.e_image}" width="300px" height="300px">
			<br>
			<input type="file" name="file1">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="hidden" name="e_idx" value="${dto.e_idx}">
			<input type="button" value="수정" onclick="event_update()">
			<input type="button" value="삭제" onclick="event_delete()">
			<input type="button" value="목록" onclick="location.href='/event/list.do'">
		</td>
	</tr>
</table>
</form>
</body>
</html>
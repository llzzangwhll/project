<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

function notice_delete(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="/notice/delete.do";
		document.form1.submit();
	}
}

function notice_update(){
	var n_title=document.form1.n_title.value;
	var n_text=document.form1.n_text.value;
	if (n_title==""){
		alert("제목을 입력하세요.");
		document.form1.n_title.focus();
		return;
	}
	document.form1.action="/notice/update.do";
	document.form1.submit();
}	
</script>
</head>
<body>
	<%@include file="../include/main_menu.jsp"%>
	<h3>공지사항 수정/삭제</h3>
	<form name="form1" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제목</td>
				<td><input name="n_title" value="${dto.n_title}"></td>
			</tr>	
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="60" name="n_text" id="n_text">${dto.n_text}</textarea></td>
			</tr>
			
			<tr>
				<td>파일</td>
				<td>
					<img src="/resources/images/${dto.n_image}" width="300px" height="300px">
					<br>
					<input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="hidden" name="n_idx" value="${dto.n_idx}">
				<input type="button" value="수정" onclick="notice_update()">
				<input type="button" value="삭제" onclick="notice_delete()">
				<input type="button" value="목록" onclick="location.href='/notice/list.do'"></td>
			</tr>	
		</table>
	</form>
</body>
</html>
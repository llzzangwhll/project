<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script>
function notice_write(){
	const n_title=document.form1.n_title.value;
	const n_text=document.form1.n_text.value;
	if (n_title==""){
		alert("제목을 입력하세요.");
		document.form1.n_title.focus();
		return;
	}
	document.form1.action="/notice/insert.do";
	document.form1.submit();
}
</script>
</head>
<body>
<%@ include file="../include/main_menu.jsp" %>
<h3>공지사항 등록</h3>
<form name="form1" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>제목</td>
		<td><input name="n_title"></td>
	</tr>	
	<tr>
		<td>작성자</td>
		<td><input type="text" value="Head Rosettes" readonly="readonly" name="n_writer"></td>	
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="5" cols="60" name="n_text"></textarea></td>
	</tr>
	<tr>
		<td>파일</td>
		<td><input type="file" name="file1"></td>
	</tr>	
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="등록" onclick="notice_write()">
			<input type="button" value="목록" onclick="location.href='/notice/list.do'">
		</td>
	</tr>		
</table>
</form>
</body>
</html>
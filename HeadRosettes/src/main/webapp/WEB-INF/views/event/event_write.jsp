<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function event_write(){
	var e_title=document.form1.e_title.value;
	var e_text=document.form1.e_text.value;
	if(e_title == ""){
		alert("제목을 입력하세요.");
		document.form1.e_title.focus();
		return;
	}
	document.form1.action="/event/insert.do";
	document.form1.submit();
}
	
</script>
<title>이벤트</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
</head>
<body>
<%@ include file="../include/main_menu.jsp" %>
<h2>이벤트 등록</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<div>제목</div>
<div><input name="e_title"></div>
<div>내용</div>
<div style="width:800px"><textarea rows="5" cols="80" name="e_text"></textarea></div>
<div>사진</div>
<div><input type="file" name="file1"></div>
<div style="width:700px; text-align:center;"></div>
<div>---------------------------------------------------------------------</div>
<div><input type="button" value="등록" onclick="event_write()"><input type="button" value="목록" onclick="location.href='/event/list.do'"></div>
</form>
</body>
</html>
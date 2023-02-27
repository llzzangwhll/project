<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품후기</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="/resources/summernote/summernote.min.css" rel="stylesheet">
<script src="/resources/summernote/summernote.min.js"></script>
<script>
$(function() {
	$("#r_text").summernote({
		height : 300,
		width : 800,
		placeholder: '최대 2048자까지 쓸 수 있습니다',
		lang: "ko-KR"
		
	});
});
function review_write() {
	var r_title=document.form1.r_title.value;
	var r_text= document.form1.r_text.value;
    if (r_title == "") {
    	alert("제목을 입력하세요.");
    	document.form1.r_title.focus();
    	return;
    }
    if (r_text =="" ){
    	alert("내용을 입력하세요.");
    	document.form1.r_text.focus();
    	return;
    }
    document.form1.action ="/review/insert.do";
    document.form1.submit();
}
</script>
<style>

</style>
</head>
<body>
<%@ include file="../include/main_menu.jsp" %>
<h2>게시물 작성</h2> 
<form id="form1" name="form1" method="post" enctype="multipart/form-data" action="/review/insert.do">
<table>
<tr>
<td>제품이름 : ${map.p_name}</td>
</tr>
<tr>
<td>구매날짜 : ${map.bpc_date}</td>
</tr>
<tr>
<td><input name="r_title" id="r_title" size="80" placeholder="제목을 입력하세요."></td>
</tr>
<tr>
<td><textarea rows="5" cols="60" name="r_text" id="r_text" placeholder="내용을 입력하세요."></textarea></td>
</tr>
<tr>
<td><input type="file" name="file1" id="file1"></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="hidden" name="bpc_idx" id="bpc_idx" value="${map.bpc_idx}">
<input type="hidden" name="p_code" id="p_code" value="${map.p_code}">
 <input type ="button" value="등록" onclick="review_write()">
 <input type="button" value="목록" onclick="location.href='/review/list.do';">
</table>
</form>
</body>
</html>
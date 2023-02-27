<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		$("#btnReplyDelete").click(function() {
			$.ajax({
				url : "/reply/delete/${dto.qre_idx}",
				success : function(result) {
					if (result == "success") {
						alert("삭제되었습니다 .");
						$("#modifyReply").css("visibility", "hidden");
						listReply();
					}
				}
			});
		});
		$("#btnReplyUpdate").click(function() {
			const qre_text = $("#detail_replytext").val();
			$.ajax({
				type : "post",
				url : "/reply/update/${dto.qre_idx}",
				headers : { "Content-Type" : "application/json"},
				data : JSON.stringify({	qre_text : qre_text}), 
				dataType : "text",
				success : function(result) {
					if (result == "success") {
						$("#modifyReply").css("visibility", "hidden");
					}
				}
			});
		});
		$("#btnReplyClose").click(function() {
			$("#modifyReply").css("visibility", "hidden");
		});
	});
</script>
</head>
<body>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<textarea id="detail_replytext" rows="3" cols="40">${dto.qre_text}</textarea>
	<div style="text-align: center">
		<button id="btnReplyUpdate" type="button">수정</button>
		<button id="btnReplyDelete" type="button">삭제</button>
		<button id="btnReplyClose" type="button">닫기</button>
</body>
</html>
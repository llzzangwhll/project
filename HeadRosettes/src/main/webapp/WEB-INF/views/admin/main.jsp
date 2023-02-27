<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script>
function order_list() {
	location.href="/admin/list.do";
}
</script>
</head>
<body>
<%@ include file="../include/main_menu.jsp"%>
<input type="button" value="주문관리" onclick="order_list()">
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
 $(function() {
	 $("#btnCheck").click(function() {
	     const q_idx=$("#q_idx").val();
		 const q_pwd=$("#q_pwd").val();
		 if (q_pwd==""){
			 alert("글 비밀번호를 입력하세요.");
			 $("#q_pwd").focus();
			 return;
		 }
		 document.form1.action="/qna/check_q_pwd.do?q_idx=${q_idx}";
		 document.form1.submit();
	 }); 
 });
</script>
</head>
<body>
<%@include file="../include/main_menu.jsp" %>
<h2>글 비밀번호를 입력하세요</h2>
<form name ="form1" method="post" >
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" id="q_idx" name="q_idx" value="q_idx">
<table border="1" width ="400px">
  <tr>
      <td>글 비밀번호</td>
      <td><input type="password" id="q_pwd" name="q_pwd"></td>
   </tr>
   <tr>
     <td colspan="2" align="center">
        <button type="button" id="btnCheck">확인</button>
        <c:if test="${message == 'error' }">
            <div style="color: red;">비밀번호가 일치하지 않습니다.</div>
         </c:if>
      </td>
        


</table>
</form>
</body>
</html>
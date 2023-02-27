<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 코어태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- 포맷태그 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 함수태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<table style="width:700px">
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:forEach var="row" items="${list}">
  <c:set var="str" value="${fn:replace(row.qre_text,' ','&nbsp;&nbsp;')}" />
  <c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />
<tr>
   <td><input type ="hidden" value="${row.qre_writer}"> HeadRosettes( <fmt:formatDate value="${row.qre_date}" 
pattern="yyyy-MM-dd" /> )
<br>${str}
<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == row.qre_writer}">
<input type="button" value="Modify" onclick="showModify('${row.qre_idx}')">
 </c:if> 
</tr>
</c:forEach>
</table>

</body>
</html>
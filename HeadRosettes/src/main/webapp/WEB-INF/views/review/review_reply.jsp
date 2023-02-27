<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="width: 700px">
		<%
		pageContext.setAttribute("newLineChar", "\n");
		%>
		<c:forEach var="row" items="${list}">
			<c:set var="str"
				value="${fn:replace(row.rre_text,'		','&nbsp;&nbsp;')}" />
			<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />
			<tr>
				<td><input type="hidden" value="${row.rre_id}">HeadRosettes(<fmt:formatDate value="${row.rre_date}"
						pattern="yyyy-MM-dd" /> ) <br>${str} <c:if
						test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == row.rre_id}">
						<input type="button" value="수정"
							onclick="showModify('${row.rre_idx}')">
					</c:if>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
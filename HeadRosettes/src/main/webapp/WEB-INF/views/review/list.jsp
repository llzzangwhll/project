<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script>
	function list(page) {
		location.href = "/review/list.do?curPage=" + page
				+ "&search_option=${map.search_option}&keyword=${map.keyword}";
	}
	
</script>
<style type="text/css">
th{
	 background-color: #F5F5F5;
		color: #343A40;"
}

table{
	margin: auto;
	width: 90%;
	counter-reset: section;

}

.count:before {
	counter-increment: section;
	content: counter(section);
}
</style>
</head>
<body>
	<%@ include file="../include/main_menu.jsp"%>
	<h3 style="padding-left: 80px;">상품후기</h3>
   <br>
   <div style="padding-left: 80px;">
	<form name="form1" method="post" action="/review/list.do">
		<select name="search_option">
			<option value="all"
				<c:out value="${map.search_option == 'all' ? 'selected' : ''}"/>>작성자+내용+제목</option>
			<option value="r.m_id"
				<c:out value="${map.search_option == 'r.m_id' ? 'selected' : '' }"/>>작성자</option>
			<option value="r_text"
				<c:out value="${map.search_option == 'r_text' ? 'selected': '' }"/>>내용</option>
			<option value="r_title"
				<c:out value="${map.search_option == 'r_title' ? 'selected' :'' }"/>>제목</option>
		</select> <input name="keyword" value="${map.keyword}"> <input
			type="submit" value="조회">
	</form>
	
	${map.count}개의 게시물이 있습니다.
	</div>
	<br>
	<table border="0" width="1500px" style="text-align:center">
		<tr>
			<th>번호</th>
			<th>제품</th>
			<th width="600px">제목</th>
			<th>이름</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.r_idx}</td>
				<td>${row.p_name}</td>
				<td>
				<a href="/review/detail.do?r_idx=${row.r_idx}&cur_page=${map.page_info.curPage}&search_option=${map.search_option}&keyword=${map.keyword}">${row.r_title}</a>
	            </td>
				<td>${row.m_id}</td>
				<td><fmt:formatDate value="${row.r_date}"
						pattern="yy-MM-dd" /></td>
			    <td>${row.r_hit}</td>
			    <td>${row.like_count}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="center"><c:if
					test="${map.page_info.curPage > 1 }">
					<a href="javascript:list('1')">[처음]</a>
				</c:if> <c:if test="${map.page_info.curBlock > 1}">
					<a href="javascript:list('${map.page_info.prevPage}')">[이전]</a>
				</c:if> <c:forEach var="num" begin="${map.page_info.blockBegin}"
					end="${map.page_info.blockEnd}">
					<c:choose>
						<c:when test="${num == map.page_info.curPage}">
							<span style="color: red">${num}</span>&nbsp;
					</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
				</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${map.page_info.curBlock <= map.page_info.totBlock }">
					<a href="javascript:list('${map.page_info.nextPage}')">[다음]</a>
				</c:if> <c:if test="${map.page_info.curPage <= map.page_info.totPage}">
					<a href="javascript:list('${map.page_info.totPage}')">[끝]</a>
				</c:if></td>
		</tr>
	</table>
</body>
</html>
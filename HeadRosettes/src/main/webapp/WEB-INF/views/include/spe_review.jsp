<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link href="/resources/css/styles.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function(){
   $(".toggle_target").click(function(){
	   var target = $(this).nextUntil(".toggle_target"); 
		$(target).toggle();
	});
   });

</script>
<style>*/
table {
  counter-reset: section;
}

.count:before {
  counter-increment: section;
  content: counter(section);
}
</style>


</head>
<body>
    
<form id="form2" name="form2" method="post">
 <table border="2" width="1000px"> 
 
 <tr align="center">
    <td colspan="3">상품후기</td>
  </tr>
<c:forEach var="row" items="${map.list}">
 
      <tr>
        <td>리뷰 작성자 : ${row.m_id} </td>
        <td>작성 날짜 :<fmt:formatDate value="${row.r_date}" pattern="yyyy-MM-dd" /></td> 
      </tr> 
      <tbody>
      <tr id="toggle_target" class="toggle_target">
        
        <td colspan="3" value="${row.r_title}">${row.r_title}</td>
      </tr> 
 
         <tr style="display: none;">  
         <td><img src="/resources/images/${row.filename}" width="100px" height="100px"></td>
         <td colspan="3">${row.r_text}</td>
         </tr>
       
         <tr style="display: none;">
         <td>${row.rre_id}&nbsp;
         <fmt:formatDate value="${row.rre_date}" pattern="yyyy-MM-dd" /> </td>
         <td>${row.rre_text}</td>
         </tr>
          
        </tbody></c:forEach> 
</table> 
<br><br>
</form>
</body>
</html>
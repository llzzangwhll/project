<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function(){ // 자동실행
	$("#btnList").click(function(){
		location.href="/qna/list.do";
	});
	listReply();
	$("#btnReply").click(function(){
		reply();
	}); 
	
	$("#btnQ_state_change").click(function (){
	    const q_state = document.getElementById("q_state").value;
	    $.ajax({
	    	url:"/qna/update_q_state.do?q_idx=${dto.q_idx}&q_state="+q_state,
	    	success: function(){
	    	alert("상태가 변경되었습니다.");
	    	
	    	}
	    })
	});

	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault(); 
	});

	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		const files=e.originalEvent.dataTransfer.files;
		const file=files[0];
		const form_data=new FormData();
		form_data.append("file", file);
		$.ajax({
			url: "/upload/ajax_upload",
			data: form_data,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data){
				const fileInfo=getFileInfo(data); 
				let html="<a href='"+fileInfo.get_link+"'>"
					+fileInfo.original_name+"</a><br>";
				html+="<input type='hidden' class='file' value='"+fileInfo.file_name+"'>";
				$("#uploadedList").append(html);
			}
		});
	});
	listAttach();
	
	$("#uploadedList").on("click",".file_del",function(e){
		const that=$(this);
		$.ajax({
			type: "post",
			url: "/upload/delete_file",
			data: { file_name: $(this).attr("data-src")},
			dataType: "text",
			success: function(result){
				if(result == "deleted"){
				that.parent("div").remove();
			}
		}
	});
	});
	$("#btnUpdate").click(function(){
		const str="";
		$("#uploadedList .file").each(function(i){
			str+="<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
		});
		$("#form1").append(str);
		document.form1.action="/qna/update.do";
		document.form1.submit();
		});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="/qna/delete.do";
			document.form1.submit();
		}
	});
});
function getFileInfo(file_name){ 
	var get_link="/upload/display_file?file_name="+file_name;
	original_name=file_name.substr(file_name.indexOf("_")+1);
	return { original_name: original_name, get_link: get_link, 
		file_name: file_name};
}
function listAttach(){
	$.ajax({
		type: "post",
		url: "/qna/list_attach/${dto.q_idx}",   
		success: function(list){
			$(list).each(function(){
			var fileInfo=getFileInfo(this);
			let html="<div><a href='"+fileInfo.get_link+"'>"+fileInfo.original_name+"</a>&nbsp;&nbsp;";
			html+="<a href='#' class='file_del' data-src='"+this+"'>[삭제]</a></div>"; 
			$("#uploadedList").append(html);
			});
		}
		});
	}
	
function reply(){
	const qre_text=$("#qre_text").val();  
	const q_num="${dto.q_idx}"; 
	const params={
			"qre_text": qre_text,
			"q_num": q_num}; 
	$.ajax({
		type: "post",
		url: "/reply/insert.do", 
		data: params,
		success: function(){
		alert("댓글이 등록되었습니다.");
		listReply();
	}
	});
}
function listReply(){ 
	$.ajax({
		url: "/reply/list.do?q_num=${dto.q_idx}",
		success: function(result){
	        $("#listReply").html(result);
	     }
	});
} 
function showModify(qre_idx){
	$.ajax({
		url: "/reply/detail/"+qre_idx,
		success: function(result){
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility","visible");
		}
	});
	}

</script>
<style>
.fileDrop {
width: 600px; height: 100px; 
border: 1px dotted gray; background: gray;
}

</style>

</head>
<body>
<%@include file="../include/main_menu.jsp" %>
<h2>Q&A</h2>
<form id="form1" name="form1" method ="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<table border="1">
 <tr> 
   <td width="150px">작성일자</td>
   <td><fmt:formatDate value="${dto.q_date}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
     <td>조회수</td>
     <td>${dto.q_hit}</td>
   </tr>
   <tr>
      <td>이름</td>
      <td>${dto.m_name}</td>
   </tr>
   <tr>
       <td>문의종류</td> 
       <td>${dto.q_type}</td>
   </tr>
   <tr>
       <td>상태</td>
       <td>${dto.q_state}</td>
    </tr>
    <tr>
       <td>제목</td>
       <td><input name="q_title" value="${dto.q_title}"></td>
     </tr>
     <tr>
        <td>내용</td>
        <td><textarea rows="3" cols="75" name="q_text" id="q_text">${dto.q_text}</textarea></td>
      </tr>
      </table>

<div>
&nbsp;<div id="uploadedList"></div>
&nbsp;<div class="fileDrop"></div>
</div>
<div>
  <input type="hidden" name="q_idx" value="${dto.q_idx}">  <!-- hidden으로 글번호 보냄. -->
     <button type="button" id="btnUpdate">수정</button>
     <button type="button" id="btnDelete">삭제</button>
   <button type="button" id="btnList">목록으로</button>
</div>
</form> 
<br>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<div style="width:700px;">
     <textarea rows="5" cols="80" id="qre_text" placeholder="댓글 작성"></textarea>
     <input type="hidden" id="qre_writer" name="qre_writer"
               value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
     <br>
     
     <button type="button" id="btnReply">댓글쓰기</button>
     <br>
     <select name="q_state" id="q_state">
         <option value="검토전">검토전</option>
          <option value="검토중">검토중</option>
           <option value="답변완료">답변완료</option></select>
   <button type="button" id="btnQ_state_change">답변상태변경</button>
   
</div>
</sec:authorize>
<br>
<div id="qre_text"></div>
<div id="listReply"></div>
<div id="modifyReply"></div>

</body>
</html>
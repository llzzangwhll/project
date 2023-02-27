<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		$(".uploadedList").on("click", "span", function(event) {
			                  
			const that = $(this); 
		
			$.ajax({
				url : "/upload/delete_file",
				type : "post",
				data : {
					file_name : $(this).attr("data-src")  
					            
				},
				dataType : "text",
				success : function(result) {  
					if (result == "deleted") {
						that.parent("div").remove();
					}
				}
			});
		});
		$(".fileDrop").on("dragenter dragover", function(event) {
			
			event.preventDefault();
		});
		$(".fileDrop").on("drop",function(event) {
		    event.preventDefault();
			const files = event.originalEvent.dataTransfer.files; 
			const file = files[0]; 
			const form_data = new FormData(); 
			form_data.append("file", file);
			$.ajax({
				type : "post",
				url : "/upload/ajax_upload",
				data : form_data,
				processData : false,  
				contentType : false, 
				success : function(data) {
				    const fileInfo=getFileInfo(data);
				    let html="<a href='"+fileInfo.get_link+"'>"+fileInfo.original_name+"</a><br>";
				    html+="<input type='hidden' name='files' value='"+fileInfo.file_name+"'>";
				    $("#uploadedList").append(html);
				    }
				  });
		  });
		$("#btnSave").click(function() {
			const q_title = document.form_qna.q_title.value;
			const q_text = document.form_qna.q_text.value;
			const q_pwd = document.form_qna.q_pwd.value;
			const q_state=document.form_qna.q_state.value;
		    const q_type = document.getElementById("q_type").value;
		    
			
		    if (q_type == "") {
		    	alert("문의종류를 선택해주세요");
		    	q_type.focus();
		    	return;
		    }
			
			if (q_title == "") { 
				alert("제목을 입력하세요.");
				q_title.focus();
				return;
			}
			if (q_text == "") {
				alert("내용을 입력하세요.");
				q_text.focus();
				return;
			}
			if (q_pwd == "") {
				alert("글 비밀번호를 설정하세요");
				q_pwd.focus();
				return;
			}
		    document.form_qna.action="/qna/insert.do";
			document.form_qna.submit(); 
		});
	});
	function getFileInfo(file_name) {
		var get_link = "/upload/display_file?file_name=" + file_name;
		original_name = file_name.substr(file_name.indexOf("_") + 1);
		return {
			original_name : original_name,
			get_link : get_link,
			file_name : file_name
		};
	}
</script>
<style>
.fileDrop {
	width: 50%;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
th{
	 background-color: #F5F5F5;
		color: #343A40;"

}

table{
	margin: auto;
	width: 50%;

}
</style>
</head>
<body>
	<%@ include file="../include/main_menu.jsp"%>
	<%@ include file="../include/community_menu.jsp"%>
	<br>
	<h3 align="center">Q&A 문의 등록</h3>
	<br>
	<form align="center" id="form_qna" name="form_qna" method="post"
		action="/qna/insert.do">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div>
		<table align ="center" border="1">
			<tr>
				<td width="150px">문의종류</td>
				<td> <select name="q_type" id="q_type" style="width:720px;">
				        <option value="">선택하세요</option>
						<option value="배송">배송</option>
						<option value="교환or환불">교환/환불</option>
						<option value="상품">상품</option>
						<option value="기타">기타</option> 
					</select>
            </td>
			</tr>
			<tr>
				<td >작성자</td>
				<td style="padding-right: 650px;"><input type="hidden" name="q_writer" id="q_writer"
					value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.m_name}
					
					</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td><input name="q_title" id="q_title" size="80" placeholder="제목을 입력하세요"></td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td><textarea rows="20" cols="80" name="q_text" id="q_text"
						placeholder="내용을 입력하세요"></textarea></td>
			</tr>
			<tr>
				<td >비밀번호</td>
				<td><input style="padding-right: 500px;" type="password" name="q_pwd" id="q_pwd"></td>
			</tr>
			</table>
			</div>
			<br><br>
			<div align ="center">
				원하는 이미지 파일을 끌어다놓으세요.
				<div class="fileDrop"></div> 
				<div id="uploadedList"></div> 
			</div>
			<br>
			<input type ="hidden" name="q_state" id="q_state" value="검토전">
			<span style="width:700px; text-align:center;">
             <button type="button" id="btnSave" style=" display: inline-block;"> 확인</button> 
             <input type="button" value="나가기" style=" display: inline-block;" onclick="location.href='/qna/list.do'">
           </span>
			<br><br>
	</form>
</body>
</html>
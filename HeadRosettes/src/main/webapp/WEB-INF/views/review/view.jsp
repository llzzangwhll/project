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
<link type="text/css" href="/resources/css/styles.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="/resources/summernote/summernote.min.css" rel="stylesheet">
<script src="/resources/summernote/summernote.min.js"></script>
<script>

$(function() {
	like_count();
	like_val_set();
	
	 $("#r_text").summernote({
		height : 300,
		width : 800,
		lang: "ko-KR"
		
	}); 
	
	
	if(${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == dto.m_id}){
		
	    $('#r_text').summernote('enable');
	} else {
		$('#r_text').summernote('disable');
	};

	
		$("#btnList").click(function() {
			location.href = "/review/list.do";
		});
		listReply();
		$("#btnReply").click(function() {
			review_reply();
		});
		
		$("#btnUpdate").click(
				function() {
					var str = "";
					$("#uploadedList .file").each(function(i) {
								str += "<input type='hidden' name='files[" + i
										+ "]' value='" + $(this).val() + "'>";
							});
					$("#form1").append(str);
					document.form1.action = "/review/update.do";
					document.form1.submit();
				});
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "/review/delete.do";
				document.form1.submit();
			}
		});
		
		
		$("#LikeBtn").click(function() {
	 		 var r_idx=$("#r_idx").val();
	 		 var likeVal=$("#LikeBtn").val();
	  	     var r_idx = '${dto.r_idx}';
		  if (likeVal == 'y' ){
		  		$.ajax({
			  		url : "/review/likeDown.do",
			  		type : "post",
			  		data : { r_idx : r_idx,
				      		 likeVal : 'n'},
		       		success: function(result) {
		       			if (result == 'G'){
				    	$("#LikeBtn").attr("value", "n");
				    	$("#LikeBtn").css("background-color","#fff");
				    	like_count();
			  			} else if (result == 'R') {
			  				alert("로그인해주세요");
			  			}}
		  				});
			 
					} else if (likeVal== 'n'){
				   $.ajax ({
			   			url : "/review/likeUp.do",
			   			type : "post",
			   			data : {
				   				r_idx : r_idx,
				  			    likeVal : 'y'},
			  			success : function(result) {
			  				if (result == 'G') {
					  	    $("#LikeBtn").attr("value", "y");
					  	    $("#LikeBtn").css("background-color","#C3E7FA");
					 		like_count();
				  			} else if (result == 'R'){
				  				alert("로그인해주세요.");
				  			}
			  				}
						});
			   
					} 
		});
});

function review_reply() {
		const rre_text = $("#rre_text").val();
		const r_idx = $("#r_idx").val();
		const p_code=$("#p_code").val();
		const params = {
			"rre_text" : rre_text,
			"r_idx" : r_idx,
			"p_code" : p_code };
		$.ajax({
			type : "post",
			url : "/review_reply/insert.do",
			data : params,
			success : function() {
				alert("댓글이 등록되었습니다.");
				listReply();
			}
		});
	}
function listReply(){
		$.ajax({
			url : "/review_reply/list.do?r_idx=${dto.r_idx}",
			success : function(result) {
				$("#listReply").html(result);
			}
		});
	}
function showModify(rre_idx) {
		$.ajax({
			url : "/review_reply/detail/" + rre_idx,
			success : function(result) {
				$("#modifyReview_Reply").html(result);
				$("#modifyReview_Reply").css("visibility", "visible");
			}
		});
	}

function like_val_set(){
	var likeVal=$("#LikeBtn").val();
	if (likeVal === "undefined" || likeVal == null || likeVal =="" ) {
	    $("#LikeBtn").val('n');
	} else if (likeVal =='y') {
		$("#LikeBtn").css("background-color","#C3E7FA");
	}
	var test = $("#LikeBtn").val();
	
}

function like_count(){
	var r_idx = '${dto.r_idx}';
	$.ajax ({
		url : "/review/count_like.do",
		type : "post",
		data : {
			r_idx : r_idx
		},
		success : function(result){
			$("#LikeBtn").text("좋아요"+" "+result);
		}
	})
}
function listReply(){
	$.ajax({
		url : "/review_reply/list.do?r_idx=${dto.r_idx}",
		success : function(result) {
			$("#listReply").html(result);
		}
	});
}
function showModify(rre_idx) {
	$.ajax({
		url : "/review_reply/detail/" + rre_idx,
		success : function(result) {
			$("#modifyReview_Reply").html(result);
			$("#modifyReview_Reply").css("visibility", "visible");
		}
	});
}




</script>
<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background: gray;
}

.LikeBtn {

	  background-color: #fff;

	}

	 

  .LikeBtn:hover {

	  background-color: #C3E7FA;

	}
 
	 

	.LikeBtn:active {

	  background-color: #91D8FA;

	}

</style>
</head>
<body>
	<%@ include file="../include/main_menu.jsp"%>
	<h2>상품 후기</h2>
	<br><br>
	<form id="form1" name='form1' method="post">
		<div>
			작성일자:
			<fmt:formatDate value="${dto.r_date}" pattern="yy-MM-dd" />
		</div>
		<div>구매제품: ${dto.p_name}</div>
		<div>구매날짜:<fmt:formatDate value="${dto.bpc_date}" pattern="yy-MM-dd" /> </div>
		<div>조회수: ${dto.r_hit}</div>
		<div>작성자: ${dto.m_id}</div>
		<div>
			제목: <input name="r_title" value="${dto.r_title}">
		</div>
		<div><img src="/resources/images/${dto.filename}"
					width="200px" height="200px"></div>
		<div style="width: 80%">
			내용:
			<textarea rows="3" cols="80" name="r_text" id="r_text">${dto.r_text}</textarea>
		</div>
		
		<div>
			<input type="hidden" id="r_idx" name="r_idx" value="${dto.r_idx}">
			<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username == dto.m_id }">
				<button type="button" id="btnUpdate">수정</button>
				<button type="button" id="btnDelete">삭제</button>
			</c:if>
			<button type="button" id="btnList">목록</button>
		<button type="button" class="LikeBtn" id="LikeBtn" value="${dto.like_val}">좋아요</button>
		</div>
	
	</form>
	
	<br>
	
  <sec:authorize access="hasRole('ROLE_ADMIN')">
	 <div style="width:700px; text-align:center;">
			<textarea rows="5" cols="80" id="rre_text" placeholder="댓글을 작성하세요."></textarea> 
			<input type="hidden" id="p_code" class="p_code" value="app01">
             <br>
			<button type="button" id="btnReply">댓글쓰기</button>
			</div>	
			</sec:authorize>
	   <br>
	<div id="listReply"></div>
	<!--댓글 수정 화면 영역-->
	<div id="modifyReply"></div> 
</body>
</html>
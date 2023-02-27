<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/login_white.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
        
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("detailAddress").focus();
                
               
            }
           
        }).open(); 
    }
 $(function(){
	 $("#info_update").click(function(){
			var m_pwd=$("#m_pwd").val();
			var num=m_pwd.search(/[0-9]/g);
			var eng=m_pwd.search(/[a-z]/ig);
			var spe=m_pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			var birth_year=document.getElementById("birth_year").value;
			var birth_month=document.getElementById("birth_month").value;
			var birth_day=document.getElementById("birth_day").value;
			birthdate=birth_year+'-'+birth_month+'-'+birth_day;
			$("#birthdate").val(birthdate);
			if(m_pwd.length <8 || m_pwd.length >20){
				alert("비밀번호는 8자리 ~20자리 이내로 입력해주세요");
				m_pwd.focus();
				return;
			 } else if(m_pwd.search(/\s/) != -1){
				alert("비밀번호는 공백 없이 입력해주세요.");
				m_pwd.focus();
				return;
		      } else if (num < 0 || eng < 0 || spe < 0 ){
				alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				m_pwd.focus();
				return;
		      }		
			if (pwd_Check =="R"){
				alert("비밀번호를 확인해주세요.");
				pwd_Check.focus();
				return;
			} 
			document.Info.action="/member/info_update.do";
			document.Info.submit();
		 
	 });
 });
 function fn_pwdCheck() {
	  const m_pwd=$("#m_pwd").val();
	  const pwdConfirm=$("#pwdConfirm").val();
	  
	  if(m_pwd != pwdConfirm) {
		  alert("비밀번호가 일치하지 않습니다.");
	  } else if (m_pwd == pwdConfirm) {
		  $("#pwd_Check").attr("value", "G");
		  alert("비밀번호가 일치합니다.");
		  
	  }
 };
	 
 </script>
<title>회원정보수정</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
</head>

<body>
<%@include file="../include/main_menu.jsp" %>
<form name="Info" id="Info" action="/member/info_update.do" method="post">
<div class="main-signup">
        <header>
        <br><br>
            <div class="logo">
                <a href="/" target="_blank">
                <img src="/resources/images/logo1-1.png" width="200" height="200"></a>
               <h2 align="center">회원정보수정</h2>
            </div>
        </header>
        <br><br>
        <div>
         <h5>*아이디(변경불가)</h5>
                <span class="signup-input">
                    <input class="signup-name" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" 
                    id="m_id" name="m_id" readonly></input>
         
                </span>
                <br>     
                <h5>*비밀번호(재설정해주세요.)</h5>
                <span class="signup-input">
                    <input class="signup-pw" type="password" id="m_pwd" name="m_pwd" placeholder="영문,숫자,특수문자혼합 8~20자리"></input>
                    <span class="pw-lock"></span>     
                </span>
                
                <br>
                <div style="display: flex;">
                 <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                    <input class="signup-pww" type="password" id="pwdConfirm" placeholder="비밀번호 확인"
                            name="pwdConfirm"></input>
                            </span>
                    <span class="cnum-btn-wrap">
                     <button class="cnum-btn"  type="button" id="pwd_Check" name="pwd_Check" 
                    onclick="fn_pwdCheck()" value="R">비밀번호 확인</button>
                </span> 
                </div>
                <br>
                 <h5>*이름(변경불가)</h5>
                <span class="signup-input">
                    <input class="signup-name" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.m_name}" 
                    id="m_name" name="m_name" readonly></input>
                </span>
                <br>
                <h5>이메일</h5>
                <span class="signup-input">
                    <input class="signup-name" type="text" id="m_email" name="m_email" 
                    value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.m_email}"
              placeholder="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.m_email}"></input>
                </span>
                <br>               
              <h5>전화번호</h5>
                <span class="signup-input">
                    <input class="signup-name" type="text" id="m_phone" name="m_phone" 
                    value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.m_phone}"
                   placeholder="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.m_phone}"></input>
                </span>
                <br>
            <h5>주소</h5>  
			<div style="display: flex;">
                <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                    <input class="signup-id" id="postcode" name="postcode" type="text"
	         value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.postcode}">
                    </span>
                <span class="cnum-btn-wrap"> 
                <input type="button" onclick="sample6_execDaumPostcode()" class="cnum-btn"  value="우편번호 찾기">
                    </span>
              </div>
                   
                    <span class="signup-input">
                    <input class="signup-name" type="text" id="address" name="address" 
	               value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.address}">
                   </span>
                  <span class="signup-input">
                    <input class="signup-name" type="text" id="detailAddress" name="detailAddress" 
	               value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.detailAddress}">
                </span>
                <span class="signup-input">
                    <input class="signup-name" type="text" id="extraAddress" name="extraAddress" 
	                    value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.extraAddress}">
                </span>
                <input type="hidden" id="m_address" name="m_address">
               <br>
                <h5>성별 &nbsp;&nbsp; 
                <c:set var="m_gender" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.m_gender}" />
    				 <c:if test="${m_gender eq ''}">
     					<input type="radio" name="m_gender" id="m_gender" value="" checked>선택&nbsp;
    				    <input type="radio" name="m_gender" id="m_gender" value="m" >남&nbsp;
     					<input type="radio" name="m_gender" id="m_gender" value="f">여
    				</c:if>
    				<c:if test="${m_gender eq 'm'}">
      					<input type="radio" name="m_gender" id="m_gender" value="" >선택&nbsp;
     					<input type="radio" name="m_gender" id="m_gender" value="m" checked>남&nbsp;
     					<input type="radio" name="m_gender" id="m_gender" value="f">여
    				 </c:if>
     			     <c:if test="${m_gender eq 'f'}">
     					<input type="radio" name="m_gender" id="m_gender" value="" >선택&nbsp;
     					<input type="radio" name="m_gender" id="m_gender" value="m">남&nbsp;
     					<input type="radio" name="m_gender" id="m_gender" value="f" checked>여
     				</c:if>
           		</h5> 
           		<br>
           		<h5>생년월일</h5>
           		<c:set var="date" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.birthdate}"></c:set>
           		 <span style="display: flex;">
           		  <span class="signup-input-birth"> 
           		  <select class="signup-birth-yy" id="birth_year" name="birth_year">
           		 <option value="">년</option>
				<c:forEach var="i" begin="1900" end="2023">
				 <option value="${i}"  <c:if test="${i == date1 }">selected</c:if>  >${i}</option>
				 </c:forEach>
				 </select></span>
				 <span class="signup-input-birth" style="margin-left: 10px;"> 
				  <select class="signup-birth-mm" id="birth_month" name="birth_month" >
				<option value="">월</option>
				<c:forEach var="i" begin="1" end="12">
				<c:choose> 
					<c:when test="${i lt 10}">
					   <option value="0${i}"  <c:if test="${i == date2 }">selected</c:if> >0${i}</option>
					</c:when>
					<c:otherwise>
					<option value="${i}" <c:if test="${i == date2 }">selected</c:if> >${i}</option>
					</c:otherwise>
					</c:choose>
				</c:forEach>				
				</select>
				 </span>
				 <span class="signup-input-birth" style="margin-left: 10px;">
				 <select class="signup-birth-dd" id="birth_day" name="birth_day" >
				 <option value="">일</option>
				<c:forEach var="i" begin ="1" end="31">
				<c:choose>
				<c:when test="${i lt 10 }">
					<option value="0${i}"  <c:if test="${i == date3 }">selected</c:if> >0${i}</option>
				</c:when>
				<c:otherwise>
				 <option value="${i}" <c:if test="${i == date3 }">selected</c:if> >${i}</option>
				 </c:otherwise>
				 </c:choose>
				 </c:forEach>					
				</select></span>
				<input type = "hidden" id="birthdate" name="birthdate">
           		</span>
           
             <div class="signup-btn-wrap">
               
                   <button type="button" name="info_update" id="info_update" class="signup-btn">정보수정</button>
                </div>
        
        </div>
        
   </div>
   </form>
</body>
</html>

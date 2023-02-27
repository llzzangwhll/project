<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

	$(function() {
		
		
		$("#btnSave").click(function(){
			
			var m_pwd=$("#m_pwd").val();
			var num=m_pwd.search(/[0-9]/g);
			var eng=m_pwd.search(/[a-z]/ig);
			var spe=m_pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			var idCheck=$("#idCheck").val();
			var pwd_Check=$("#pwd_Check").val();
			const m_name=document.form1.m_name.value;
			const m_phone=document.form1.m_phone.value;
			var postcode=document.getElementById('postcode').value;
			var address=document.getElementById("address").value;
			var detailAddress=document.getElementById("detailAddress").value;
			var extraAddress=document.getElementById("extraAddress").value;
			
			var birth_year=document.getElementById("birth_year").value;
			var birth_month=document.getElementById("birth_month").value;
			var birth_day=document.getElementById("birth_day").value;
			birthdate=birth_year+'-'+birth_month+'-'+birth_day;
			$("#birthdate").val(birthdate);
			
			var mail_detail=document.getElementById("mail_detail").value;
			var mail_site=document.getElementById("mail_site").value;
			m_email=mail_detail+mail_site;
			$("#m_email").val(m_email);			
			   if (idCheck =="N"){
				   
			    	alert("아이디 중복확인해주세요.");
			    	$("#m_id").val(' ');
			    	idCheck.focus();
			    	return;
			   } 
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
				if (m_name == "") { 
					alert("이름을 입력하세요.");
					m_name.focus();
					return;
				}
				if (m_email == "") {
					alert("이메일을 입력하세요.");
					m_email.focus();
					return;
				}
				if (m_phone == "") {
					alert("전화번호를 설정하세요");
					m_phone.focus();
					return;
				}
				document.form1.action="/member/insert.do";
				document.form1.submit();
			});
		});
	 
	
	function fn_idCheck(){
		var m_id=$("#m_id").val();
		var idType=/^[a-zA-Z0-9]{5,12}$/;
		if(!idType.test($("#m_id").val())){
			alert("아이디는 영문, 숫자 조합으로 5~12자이어야 합니다");
			return;
		} else {		
			$.ajax({
				url : "/member/idCheck.do?m_id="+m_id,
				success : function(data) {
					if(data==1) {
						alert("중복된 아이디입니다.");
					} else if (data==0) {
						$("#idCheck").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			
			})
			
		}};
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
<title>회원가입</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link href="/resources/css/naver_login.css" rel="stylesheet">
</head>
<body>
<%@include file="../include/main_menu.jsp" %>

	<form id="form1" name="form1" method="post" action="/member/insert.do">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		 <div class="main-signup">
        <header>
        <br><br>
            <div class="logo">
                <a href="/" target="_blank">
                <img src="/resources/images/logo1-1.png" width="200" height="200"></a>
               <h2 align="center">회원가입</h2>
            </div>
        </header>
   
        <section class="signup-wrap">

            <div>
                 <h5>*아이디</h5>
                 <div style="display: flex;">
                <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                    <input class="signup-id" id="m_id" name="m_id" type="text" placeholder="영문, 숫자 5~12자"></input>
                    </span>
                <span class="cnum-btn-wrap"> 
                <button class="cnum-btn" type="button" id="idCheck" name="idCheck" 
                onclick="fn_idCheck()" value="N">중복확인</button>
                    </span>
                   </div>
               <br>


                <h5>*비밀번호</h5>
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

            </div>
        
            <div style="margin-top: 35px;">
                <h5>*이름</h5>
                <span class="signup-input">
                    <input class="signup-name" type="text" id="m_name" name="m_name"></input>
                </span>
                <br>
            
                <h5>*전화번호</h5>
                <span class="signup-input">
                    <input class="signup-phone" type="text" id="m_phone" name="m_phone" placeholder="숫자만 입력해주세요"></input>
                </span>
                <br>
                
                		
				
                <h5>*이메일</h5>
			<span class="signup-input">
			    <input class ="signup-email" type="text" id="mail_detail" name="mail_detail">
				    @
				    <select name="mail_site" id="mail_site" style="margin-left: 10px;">
				    	<option value="">직접입력</option>
				    	<option value="@gmail.com">gmail.com</option>
				    	<option value="@naver.com">naver.com</option>
				    	<option value="@daum.net">daum.net</option>				    
				    </select>
				    <input type="hidden" id="m_email" name="m_email">
			</span>
			<br>
			<h5>주소</h5>  
			<div style="display: flex;">
                <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                    <input class="signup-id" id="postcode" name="postcode" type="text" placeholder="우편번호">
                    </span>
                <span class="cnum-btn-wrap"> 
                <input type="button" onclick="sample6_execDaumPostcode()" class="cnum-btn"  value="우편번호 찾기">
                    </span>
              
                   </div>
                    <span class="signup-input">
                    <input class="signup-name" type="text" id="address" name="address" placeholder="주소">
                </span>
                  <span class="signup-input">
                    <input class="signup-name" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
                </span>
                <span class="signup-input">
                    <input class="signup-name" type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
                </span>
                <input type="hidden" id="m_address" name="m_address">
               <br>
			
			
			
			
                <h5>생년월일</h5>
                <span style="display: flex;">
                    <span class="signup-input-birth">
                    <select class="signup-birth-yy" id="birth_year" name="birth_year">
				<option value="">년</option>
				<c:forEach var="i" begin="1900" end="2023">
				 <option value="${i}">${i}</option>
				 </c:forEach>
				</select> </span>
                   <span class="signup-input-birth" style="margin-left: 10px;"> 
                   <select class="signup-birth-mm" id="birth_month" name="birth_month" >
				<option value="">월</option>
				<c:forEach var="i" begin="1" end="12">
				<c:choose> 
					<c:when test="${i lt 10}">
					   <option value="0${i}">0${i}</option>
					</c:when>
					<c:otherwise>
					<option value="${i}">${i}</option>
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
					<option value="0${i}">0${i}</option>
				</c:when>
				<c:otherwise>
				 <option value="${i}">${i}</option>
				 </c:otherwise>
				 </c:choose>
				 </c:forEach>					
				</select>
                    </span>
                </span>
                <input type ="hidden" id="birthdate" name="birthdate">
              <br>

                <h5>성별</h5>
                <span class="signup-input">
                    <select class="signup-gender" id="m_gender" name="m_gender" >
                        <option value="">선택안함</option>
                        <option value="m">남자</option>
                        <option value="f">여자</option>
                    </select>
                </span>
                <br>
 
			</div>
            <div>
                <div class="signup-btn-wrap">
			    <input type="hidden" id="authority" name="authority" value="ROLE_USER">
                    <button type="button" id="btnSave" class="signup-btn">가입하기</button>
                </div>
            </div>
        </section>
        </div>
	</form>
</body>
</html>
    



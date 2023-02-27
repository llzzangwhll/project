<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지로 이동</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/joeblog.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<script>
function window_onload(){
	setTimeout('go_url()',3000)
}

function go_url(){
	location.href="login.do";
}

</script>
</head>
<body onload="javascript_:window_onload()">
<div class="services_section layout_padding">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <h1 class="services_taital">로그인 페이지로 이동합니다.</h1><br>
        <h1 class="services_taital_below">로그인해주세요.</h1>
      </div>
      <div class="col-md-4">
        <div><img src="/resources/images/logo1-1.png" alt="website template image" class="image_1"></div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
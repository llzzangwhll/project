<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>Welcome to Head Rosettes</title>
<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/joeblog.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
const outer=document.querySelector('.outer');
const innerList=document.querySelector('.inner-list');
const inners=document.querySelectorAll('.inner');
let currentIndex = 0;

inners.forEach((inner)=>{
	inner.style.width=`${outer.clientWidh}px`;
})


innerList.style.width = `${outer.clientWidth * inners.length}px`;
const buttonLeft = document.querySelector('.button-left');
const buttonRight = document.querySelector('.button-right');

buttonLeft.addEventListener('click', () => {
  currentIndex--;
  currentIndex = currentIndex < 0 ? 0 : currentIndex;
  innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`;
});

buttonRight.addEventListener('click', () => {
  currentIndex++;
  currentIndex = currentIndex >= inners.length ? inners.length - 1 : currentIndex; 
  innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`;
});
</script>

<style>
ul,li{list-style:none;}

.slide{overflow:hidden;}
.slide ul{width:calc(100% * 4);display:flex;animation:slide 20s infinite;}


@keyframes slide {
   0% {margin-left:0;} 
    10% {margin-left:0;} 
    25% {margin-left:-100%;}
    35% {margin-left:-100%;} 
    50% {margin-left:-200%;}
    60% {margin-left:-200%;}
}
.line_limit {
      width:200px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
      display:inline-block;
}
@import url(https://fonts.googleapis.com/css?family=Roboto:700);
html, body{font-family : Roboto; height: 100%; width: 100%; margin: 0;}

.button {
  background: #3D4C53;
  margin : 10px auto;
  width : 200px;
  height : 25px;
  overflow: hidden;
  text-align : center;
  transition : .2s;
  cursor : pointer;
  border-radius: 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,.2);
}
.btnTwo {
  position : relative;
  width : 200px;
  height : 100px;
  margin-top: -100px;
  padding-top: 2px;
  background : #B0C4DE;
  left : -250px;
  transition : .3s;
}
.btnText {
  color : white;
  transition : .3s;
}
.btnText2 {
  margin-top : 63px;
  margin-right : -130px;
  color : #FFF;
}
.button:hover .btnTwo{
  left: -130px;
}
.button:hover .btnText{ 
  margin-left : 65px;
}
.button:active { 
  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<%@ include file="include/main_menu.jsp" %>
<div class="slide" style="text-align: center;">
   <ul>
      <li><img src="/resources/images/젠하이저 메인.jpg" style="width: 1500px; height: 500px; object-fit: cover;"></li>   
      <li><img src="/resources/images/오디오테크니카 메인.jpg" style="width: 1500px; height: 500px; object-fit: cover;"></li>
      <li><img src="/resources/images/슈어 메인.jpg" style="width: 1500px; height: 500px; object-fit: cover;"></li>
   </ul>
</div>
<br>
	<br>
	<div class="feature-posts">
		<a href="pages/single-post.php" class="feature-post-item"
			style="background-color: #B0C4DE; text-decoration: none;"> 
			<span>Best Items</span>
		</a>
		<c:forEach var="row" items="${map.best_list}" begin="0" end="4">
			<sec:authorize access="isAnonymous()">
				<a href="/product/detail_1.do?p_code=${row.p_code}" class="feature-post-item">
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="/product/detail_2.do?p_code=${row.p_code}" class="feature-post-item">
			</sec:authorize>
			<img src="/resources/images/${row.p_image}" class="w-75" alt="website template image">
			<div class="feature-post-caption">
				<span class="line_limit">${row.p_name}</span>
			</div>
			</a>
		</c:forEach>
	</div>
     <hr>
        <br><br><br>
      
      <div class="page-container" >
    <div class="page-content" width="70%">
      <div class="card">
        <div style="text-align: center; padding-top: 20px; background-color: #F5F5F5;">
        <br>
        <div style="float: left;">
        <h2 style="color: #696969;">Check Your Sound!</h2>
        <br><br><br>
        <div class="row justify-content-center" style="float: left; color: #6C757D;">
		<h6>영상을 재생하면 헤드셋의 사운드를 체크해 볼 수 있습니다.</h6>
        <h6>청음샵에서 원하는 헤드셋을 착용하고 영상을 재생해보세요!</h6>
        <br><br>
        <div class="button" id="qna_list" onclick="location.href='/offline_shops.do'">
    <p class="btnText">청음샵 안내</p>
    <div class="btnTwo">
      <p class="btnText2">GO!</p>
    </div>
 </div>
		</div>
        </div> 
		<br>
        	                   	
          <small class="small text-muted">
          <iframe style="float: left; margin-right: 1rem; width: 400px; height: 300px; padding-bottom: 70px;"  src="https://www.youtube.com/embed/PqVCPE8_ntE" title="YouTube video player" 
frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; 
picture-in-picture; web-share" allowfullscreen></iframe><span class="px-2"><div class="container my-5">
            </div></span> 
            
           <br><br><br>
            </div>
            
            
          <div style="text-align: center;">
      		<h6 class="sidebar-title section-title mb-4 mt-3"></h6><br>
      		<img src="/resources/images/logo-png.png" alt="website template image" class="circle-100 mb-3"> 
      <p>Consectetur adipisicing elit Possimus tempore facilis dolorum veniam impedit nobis. Quia, soluta incidunt nesciunt dolorem reiciendis iusto.</p>
      </small>     
      </div>
            
</body>
</html>
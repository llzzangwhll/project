<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
	<title>오프라인 매장</title>
	<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
	<link type="text/css" href="/resources/css/table_style1.css" rel="stylesheet">
	<link href="/resources/css/joeblog.css" rel="stylesheet">
	<link href="/resources/css/styles.css" rel="stylesheet">
<style>
	.map-frame {text-align: center; margin: 0 auto;}
	th{
	 background-color: #F5F5F5;
		color: #343A40;"
}

table{
	margin: auto;
	width: 90%;

}
</style>
</head>
<body>
<%@include file="../include/main_menu.jsp" %>
<div class="daum-map" style="text-align: center; margin: 0 auto;">
<br><br>
<h3>오프라인 정품 매장 안내</h3>
  <br>                                                                                   
	<div id="map"  style="width:800px;height:600px; text-align: center; margin: 0 auto; border-radius: 10px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08149365eca9aea4cbd1344ea5da7c19"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.5547, 126.9708),
			level: 8
		};

		var map = new kakao.maps.Map(container, options);
		var positions = [
		    {
		        title: '애플스토어 명동', 
		        latlng: new kakao.maps.LatLng(37.5648, 126.9829)
		    },
		    {
		        title: '애플스토어 가로수길', 
		        latlng: new kakao.maps.LatLng(37.521, 127.0227)
		    },
		    {
		        title: '애플스토어 여의도', 
		        latlng: new kakao.maps.LatLng(37.5261, 126.9282)
		    },
		    {
		        title: '애플스토어 잠실',
		        latlng: new kakao.maps.LatLng(37.514, 127.1042)
		    },
		    {
		        title: '소니스토어 압구정점',
		        latlng: new kakao.maps.LatLng(37.5263, 127.0401)
		    },
		    {
		        title: '뱅앤올룹슨 압구정 플래그십 스토어',
		        latlng: new kakao.maps.LatLng(37.5278, 127.0332)
		    },
		    {
		        title: '뱅앤올룹슨 롯데백화점 본점',
		        latlng: new kakao.maps.LatLng(37.5657, 126.9818)
		    },
		    {
		        title: '뱅앤올룹슨 신세계 강남점',
		        latlng: new kakao.maps.LatLng(37.5043, 127.0031)
		    },
		    {
		        title: '뱅앤올룹슨 현대백화점 본점',
		        latlng: new kakao.maps.LatLng(37.5274, 127.0275)
		    },
		    {
		        title: 'BOSE 더현대 서울점',
		        latlng: new kakao.maps.LatLng(37.526, 126.9285)
		    },
		    {
		        title: 'BOSE 신세계백화점 본점',
		        latlng: new kakao.maps.LatLng(37.5613, 126.9813)
		    },
		    {
		        title: 'BOSE 파주프리미엄 아울렛',
		        latlng: new kakao.maps.LatLng(37.7696, 126.697)
		    }
		];
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    var imageSize = new kakao.maps.Size(24, 35);   
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: positions[i].latlng,
		        title : positions[i].title,
		        image : markerImage
		    });
		}  
	</script>
	<br><br>
	<table border="0" align="center">
	<tr>
	   <th>브랜드</th>
	   <th>이름</th>
	   <th>주소</th>
	   <th>전화번호</th>
	</tr>
	   <tr>
	     <td align="center">애플</td>
	     <td><a href="http://kko.to/SC6bDJvfmy">애플스토어 명동</a></td>
	     <td>중구 남대문로 2가 9-1 하이드파크 영등포구, 서울특별시</td>
	     <td>080-500-1007</td>
	    </tr>
	    <tr>
	     <td align="center">애플</td>
	     <td><a href="http://kko.to/GKWEivQLhe">애플스토어 가로수길</a></td>
	     <td>서울 강남구 가로수길 43</td>
	     <td>080-500-0029</td>
	    </tr>
	      <tr>
	     <td align="center">애플</td>
	     <td><a href="http://kko.to/nzadPki_hI">애플스토어 여의도</a></td>
	     <td>서울 영등포구 국제금융로 10 IFC몰 지하 1층</td>
	     <td>080-500-0013</td>
	    </tr>
	      <tr>
	     <td align="center">애플</td>
	     <td><a href="http://kko.to/T0uUBvMvZI">애플스토어 잠실</a></td>
	     <td>서울 송파구 올림픽로 300 롯데월드몰 1층</td>
	     <td>080-500-0098</td>
	    </tr>
	      <tr>
	     <td align="center">소니</td>
	     <td><a href="http://kko.to/DyXwa-1GoL">소니스토어 압구정점</a></td>
	     <td>서울 강남구 선릉로 801 배강빌딩</td>
	     <td>02-515-7946</td>
	    </tr>
	      <tr>
	     <td align="center">뱅앤올룹슨</td>
	     <td><a href="http://kko.to/CCaU25gkLy">글로벌뱅앤올룹슨 압구정본점</a></td>
	     <td>서울 강남구 언주로 865 태승빌딩 1층</td>
	     <td>02-518-1380</td>
	    </tr>
	      <tr>
	     <td align="center">뱅앤올룹슨</td>
	     <td><a href="http://kko.to/nbmiJliefT">뱅앤올룹슨 롯데백화점본점</a></td>
	     <td>서울 중구 남대문로 81 8층</td>
	     <td>-</td>
	    </tr>
	      <tr>
	     <td align="center">뱅앤올룹슨</td>
	     <td><a href="http://kko.to/vUSPkpcn8q">뱅앤올룹슨 신세계백화점강남점</a></td>
	     <td>서울 서초구 신반포로 176 신관 3층</td>
	     <td>-</td>
	    </tr>
	      <tr>
	     <td align="center">BOSE</td>
	     <td><a href="http://kko.to/ALuP9LlhTX">BOSE 더현대 서울점</a></td>
	     <td>서울 영등포구 여의대로 108 더현대 서울 5층</td>
	     <td>02-3277-0589</td>
	    </tr>
	    <tr>
	     <td align="center">BOSE</td>
	     <td><a href="http://kko.to/rK2wUvygNJ">BOSE 신세계백화점 본점</a></td>
	     <td>서울 중구 소공로 63 신세계백화점 본점 신관 7층</td>
	     <td>02-310-1497</td>
	    </tr>
	    <tr>
	     <td align="center">BOSE</td>
	     <td><a href="hhttp://kko.to/Rcp0sHxZlH">BOSE 파주프리미엄 아울렛</a></td>
	     <td>경기 파주시 탄현면 필승로 200 파주프리미엄아울렛 LEVEL 1 259호</td>
	     <td>031-8071-7334</td>
	    </tr>

	</table>
	 
</div>
<br>
<br>	   
</body>
</html>
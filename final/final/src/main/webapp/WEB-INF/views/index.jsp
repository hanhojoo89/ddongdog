<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DDOGDOG HomePage</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>

body, html { 
    margin: 0;
    padding: 0;
    height: 100%;
}

</style>
</head>
<body>
	<div class="divWrap">
		<div id="divMenu">
			<jsp:include page="menu.jsp"/>
		</div>
		<div id="divImg">
			<img src="/resources/img/index.jpg">		<!-- 배경 이미지 -->
		</div>
		<button id="divImgBtn">입양하기</button>
		<button id="divDogBtn">보러가기</button>
		<a href="#" id="aTop">
			<img src="/resources/img/top.jpg" >
		</a>

	</div>
	<jsp:include page="footer.jsp"/>

</body>
<script>
	$("#aTop").click(function(){
	    $('body,html').animate({scrollTop:0},400 );
	    return false;
	  });
	
</script>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
* { font-family:"Nanum Gothic" !important }
	#divItem {
		width:1500px;
		margin-top:20px;
		position: fixed;	
		top: 0;
		/* width: 100% */
		left: 0;
		right: 0;
		
	}

	#divItem img{
		width:130px;
		margin-left:115px;
		cursor:pointer;	
		
	}

	.items {
		margin-left:50px;
		font-size: 20px;
		font-weight:bold;
		cursor:pointer;
	}
	
	.items a {
		text-decoration:none;
		color:black;
	}
	
	.itemSearch {
		margin-left:40px;
		
	}
	
	.itemSearch input[type='text'] {
	   height: 37px; 
	   width:250px;
	   background-color: #ebecee;
	   border-radius: 30px 30px 30px 30px;
	   border: none;
	   outline: none;
	
	}
	
	.wordSearch {
		background: #F2BB13;
		border-radius: 5px 5px 5px 5px;
		cursor:pointer;	
		font-weight:bold;
		height:35px;
		border: none;
		outline: none;
	}
</style>
<div id="divItem">
	<span class="mitems"><img src="/resources/img/logo.png" align=middle ></span>
	<span class="items"><a href="">유기견</a>
		<a href="#">입양 절차</a>
		<a href="#">유기견 목록</a>
	</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
	<span class="items"><a href="">실종동물</a>
		<a href="#">유기 신고</a>
		<a href="#">유기 제보</a>
	</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
	<span class="items"><a href="">접종예상비용</a>
		<a href="#">예상 비용 체크</a>
		<a href="#">내 주변 병원 찾기</a>
	</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
	<span class="items"><a href="">커뮤니티</a>
		<a href="#">자유게시판</a>
		<a href="#">후원하기</a>
	</span>
	<span class="itemSearch">
		<input type="text" placeholder="     검색어를 입력하세요">
		&nbsp;&nbsp;&nbsp;
		<input type="button" class="wordSearch" value="SEARCH">
	</span>
	<span class="items"><a href="">LOGIN</a></span>
</div>
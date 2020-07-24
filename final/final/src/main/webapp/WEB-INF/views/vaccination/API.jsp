<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <!-- 핸들바 import -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a382b7b4cb477ebc8804e2f12197a4be&libraries=services"></script>
   <title>카카오지역검색</title>
   <style>
      #tbl{width:800px;border-collapse:collapse;}
      td{border:2px solid green;}
      .row:hover{background:skyblue;color:white;}
      .place{width:200px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;}
      .address{width:350px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;}
      .phone{width:150px;text-overflow:ellipsis;wh	ite-space:nowrap;overflow:hidden;}
      .title{background:yellow;color:purple;text-align:center;}
      .location{width:100px;}
      #map{width:800px;height:400px;border:1px solid gray;margin-top:10px;
          display:none;}
   </style>
</head>
<body>
   <h1>[동물병원검색]</h1>
   <div id=search>
      검색수: <span id="total"></span>
      <input type="text" id="textSearch" value="미추홀구 동물병원">
      <input type="button" id="btnSearch" value="검색">
   </div>
   <table id="tbl"></table>
   <script id="temp" type="text/x-handlebars-template">
      <tr class="title">
         <td><b>Title</b></td>
         <td><b>Address</b></td>
         <td><b>Telephone</b></td>
         <td><b>Location</td>
      </tr>
   {{#each documents}}
      <tr class=row>
         <td><div class=place><a href='{{place_url}}'>{{place_name}}</a></div></td>
         <td><div class=address>{{address_name}}</div></td>
         <td><div class=phone>{{phone}}</div></td>
         <td class=location><button x1={{x}} y1={{y}} place="{{place_name}}" phone="{{phone}}">위치 보기</button></td>
      </tr>
   {{/each}}
   </script>
   <div id="pagination">
      <button id="btnPre">이전</button>
      <button id="btnNext">다음</button>
      page:<span id="page"></span>
   </div>
   <!-- 지도출력 -->
   <div id="map"></div>
</body>
<script>
   var page=1;   //페이지 초기값:1
   var is_end;   //마지막페이지 지정
   getList();
   
   $("#tbl").on("click",".row button",function(){
      var x=$(this).attr("x1");
      var y=$(this).attr("y1");
      var place=$(this).attr("place");
      var phone=$(this).attr("phone");	
    //지도
      $("#map").show();
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var options = { //지도를 생성할 때 필요한 기본 옵션
         center: new kakao.maps.LatLng(y, x), //지도의 중심좌표.
         level: 3 //지도의 레벨(확대, 축소 정도)
      
      };
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      	mapOption = { 
          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };

      var marker=new kakao.maps.Marker({position:new kakao.maps.LatLng(y,x)});
      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	  marker.setMap(map);
      
	  var str="<div>" + place + "<br>" + phone + "</div>";
      var info=new kakao.maps.InfoWindow({content:str});
      kakao.maps.event.addListener(marker, "mouseover", function(){ info.open(map, marker); });
      kakao.maps.event.addListener(marker, "mouseout", function(){ info.close(map, marker); });
   });
   //지도끝
   
   
   $("#btnSearch").on("click",function(){
      page=1;
      getList();
   });
   
   $("#textSearch").keydown(function(key){
      if(key.keyCode==13){
         page=1;
         getList();
      }
   });
   
   $("#btnNext").on("click",function(){
      if(is_end==false){
         page=page+1;
         getList();
      }else{
         alert("마지막 페이지입니다!");
      }
   });
   
   $("#btnPre").on("click",function(){
      if(page>1){
         page=page-1;
         getList();
      }else{
         alert("첫번째 페이지입니다!");
      }
   });
   
   function getList(){
      var query=$("#textSearch").val();
      $("#page").html(page);
      $.ajax({
         type:"get",
         url:"https://dapi.kakao.com/v2/local/search/keyword.json",
         headers:{"Authorization":"KakaoAK a382b7b4cb477ebc8804e2f12197a4be"},
         dataType:"json",
         data:{"query":query,"page":page,"size":10},
         success:function(localData){
            is_end=localData.meta.is_end;
            var total=localData.meta.pageable_count;
            $("#total").html(total+"건");
            var temp=Handlebars.compile($("#temp").html());   //temp에 temp id를 컴파일한다.
            $("#tbl").html(temp(localData));   //지정한 localData를 테이블에 출력한다 .
         }
      });
   }
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	 $("input[name='weather']").click(function() {
		 $("#test").stop(true).fadeToggle();
	 
		 var urlAddress = $(this).val();
	    $.ajax({
	        url: "http://api.wunderground.com/api/a876e7a78280d5b6/forecast/lang:KR/q/"+urlAddress,
	        dataType : "jsonp",
	        success : function(parsed_json) {
	            var forecast = parsed_json['forecast']['txt_forecast']['forecastday'];
	             $("#titles").empty();
	             $("#images").empty();
	            for (index in forecast) {
	               var newForecastString = forecast[index]['title'];
	               var newForecastParagraph = $('<td/>').text(newForecastString);
	                $("#titles").append(newForecastParagraph);
	               var newForecastImages = forecast[index]['icon_url'];
	               $("#images").append("<img src="+newForecastImages+">");
	            } 
	        }
	    });
	}); 
 }); 
	</script>
<!-- map -->
<script>
var map;
var markers=[];
var infoList= [];
var windowNames = [];
var selectedstation = [];
var cityurl =[];
var number = [];
$(document).ready(function(){
	$("#trcancleBtn").click(function(){
		$("#tomoroading").html("");
		names =[];
	});
});

function buttonClick(id,marker,windowName){
	$(document).on("click","#"+id,function(){
		if(selectedstation.indexOf(id) != -1){
			alert("이미 추가한 여행지입니다! 다른 여행지를 선택해주세요!");
		}else{
			selectedstation.push(id);
			$("#tomoroading").html("<h2> 선택한 여행지:"+selectedstation+"</h2>");
			windowName.close(map,marker);
		}			
	});
}


function initMap() {
	   var directionsDisplay = new google.maps.DirectionsRenderer;
		var directionsService = new google.maps.DirectionsService;
	  map = new google.maps.Map(document.getElementById('map'), { 
		center: {lat:37.402040, lng:127.107296}, //사용자가 위치정보 전송을 원하지않을때는 이 좌표 (유스페이스)로 이동함.
	    zoom: 9
	  });
	  var infoWindow = new google.maps.InfoWindow({map: map});
	  	<c:forEach items = "${station}" var = "station" varStatus="status">		
	 	 markers[${status.index}] = new google.maps.Marker({
			map: map,
			animation: google.maps.Animation.DROP,
			position: {lat: ${station.lat},lng: ${station.lng}},
			title: "${station.name}"
		});
		infoList[${status.index}] += '<div id="content">';
		if("${station.cityurl}"=="http://icons.wxug.com/i/c/k/.gif"){
		infoList[${status.index}] +='<h1 class="firstHeading">${station.name}</h1>'+'This area does not provide weather information.';			
		}else{
		infoList[${status.index}] +='<h1 class="firstHeading">${station.name}<img src="'+"${station.cityurl}"+'">'+'</h1>';			
		}
		infoList[${status.index}] +='<div id="bodyContent">';
		infoList[${status.index}] +='<br>';
     	if("${mvo.id}"==""){
     	}else{
     	infoList[${status.index}] +='<a href='+'"${pageContext.request.contextPath}/station/getDetailInfo.do?name="'+'"${station.name}">${station.name}정보 보러가기</a>  ';
     	infoList[${status.index}] +='<a href='+"${pageContext.request.contextPath}/getBurnListByStation.do?pageNo=1&stationName=${station.name}"+'>${station.name} 번개시판가기</a><br>';
		infoList[${status.index}] +='<input type="button" value="담기" id="${station.name}">';
		//infoList[index] +='<input type="button" value="담기" id="'++'"'
     	}
		infoList[${status.index}] +='</div>';
		infoList[${status.index}] +='</div>';    				
		windowNames[${status.index}] = new google.maps.InfoWindow({
       	content: infoList[${status.index}]
		});
		doInfo(markers[${status.index}],windowNames[${status.index}],windowNames);
	    buttonClick("${station.name}" , markers[${status.index}] ,windowNames[${status.index}]);		
	    </c:forEach>
		function doInfo(marker,windowName,windowNames){
			google.maps.event.addListener(marker,'click',function(){
				for(var z=0;z<windowNames.length;z++){
					windowNames[z].close();	
				}
				windowName.open(map,marker);
			});
		}
	    if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position){
	      var pos = {
	        lat: position.coords.latitude,
	        lng: position.coords.longitude
	      };
	      map.setCenter(pos); //위치정보를 허가했을때는 위치가 여기로 바뀜ㅋ
	      //버튼2 눌렀을 때 현재 위치로 이동.
	  	
	  		infoWindow.close();
	    }, function() {
	      handleLocationError(true, infoWindow, map.getCenter());
	    });
	  } else {
	    // Browser doesn't support Geolocation
	    handleLocationError(false, infoWindow, map.getCenter());
	  }
	}

	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	    infoWindow.setPosition(pos);
	    infoWindow.setContent(browserHasGeolocation ?
	                          'Error: 현재위치 불러오기에 실패했습니다. 현재위치 정보 받아오기에 동의하지않으신 경우, 현재위치관련 서비스를  제공받을 수 없습니다.' :
	                          'Error: Your browser doesn\'t support geolocation.');
	  }


$(document).on("click","#roading",function(){
	if(selectedstation.length<2){
		alert("투모로딩을 하기위해선 2가지 이상의 역을 선택해주셔야합니다.");
		return false;
	}else{
		location.href="${pageContext.request.contextPath}/tomoroading/tomoroading.do?names="+selectedstation;
	}
});
</script>

<!-- 2차로 해야지.
검색 자동완성 //
<script>
  $( function() {
    var criterion=""; //검색 기준
    var keyword=""; //검색 키워드
    
    $("#form").hide(); //검색기준이 리뷰가 아닐 땐 숨겨놓음.
    
	if(${sessionScope.mvo==null}){ //세션이 없을 때는 검색기능 사용 불가
		$("#searchkeyword").val("로그인 후 가능합니다.");
	}else{
		var reviewFilter="제목만"; //리뷰검색 기준-제목이냐 제목+내용이냐
		$("#searchkeyword").removeAttr("readonly");
	    
		 //리뷰 선택 시 나타나는 검색기준 셀렉트박스
		 $(":input[name=reviewForm]").change(function(){
		 	reviewFilter=$(":input[name=reviewForm] option:selected").val();
		  });
		  
	    //자동완성
	     $( "#searchkeyword" ).autocomplete({
	    	source : function( request, response){
	    		//alert(reviewFilter);
	    		$.ajax({
	    			url: criterion+"/getKeyword.do",
	    			dataType:"json",
	    			data:"keyword="+request.term+"&reviewFilter="+reviewFilter, //사용자가 최근 입력한 단어를 보냄
	    			success: function(data){
	    				response(data);
	    			}//success
	    		});//ajax
	    	}//source:function
	    }); //autocomplete
	    
	    $(":input[name=searchForm]").change(function(){ //선택상자 폼에서 변했을 때,
			 criterion=$(this).val();  // 검색기준을 정하고
			 keyword=$("#searchkeyword").val(); // 키워드를 담음. 어쨌든 내가 선택을 해도 어쨌뜬 최종 검색어가 정해지는거니까
			
			//리뷰 선택 시 나타나게만 함.
			if(criterion=="review"){
				$("#form").show();
			}else{
				$("#form").hide();
			}
		});//form change
	}//else
		
  }); //function 
</script>
-->
  
<!-- //검색자동완성//
<select name="searchForm">
	<option id="all">전체</option>
	<option id="hash">해시태그</option>
	<option id="local">station</option>
	<option id="place">place</option>
	<option id="review">review</option>
</select>
<div class="ui-widget">
		<label for="searchkeyword"><img src="${pageContext.request.contextPath}/resources/images/SearchIcon.png" style="width:20px; height:20px;"></label>
		<!-- 리뷰 선택 시에만 나타나는 폼. //
		<span id="form">
			<select name=reviewForm style="width:101px; height: 30px;">
				<option id="title">제목만</option>
				<option id="idAndContent">제목+내용</option>
			</select>
		</span>
		<input id="searchkeyword" type="text" readonly="readonly">
</div>
-->

<!-- 지도 -->
<div id=map style="width:100%;height:600px"></div>
<div id="tomoroading"></div>
<c:if test="${mvo!=null }">
<input type="button" id="roading" value="투모로딩하기!">
<input type="button" id="trcancleBtn" value="지우기">
</c:if>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpL8aL2d8fezUQNHEeiaIOaLo7yarXVk8&callback=initMap"
 async defer></script>
 
 	 <div class="dividerHeading">
            <h4><span>날씨를 알고 싶어요╹◡╹)ﾉ</span></h4>
        </div>
<!-- 날씨 -->
		<div id="titles"></div>
		    <div id="images"></div>


		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="제천" 
			name="weather" value="seoul.json">서울
		</div>
				<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="제천" 
			name="weather" value="daegu.json">대구
		</div>
		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="miryang.json">밀양
		</div>
				<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="제천" 
			name="weather" value="gunsan.json">군산
		</div>
		<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="busan.json">부산
		</div>
				<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="gwangju.json">광주
		</div>
				<div >
			<input type="image" src="${pageContext.request.contextPath}/resources/img/1.png"  id="논산" 
			name="weather" value="gangneung.json">강릉
		</div>
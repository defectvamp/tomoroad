<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
function reqeustList(){
	location.href = "${pageContext.request.contextPath}/mypage/friend_RequestList.do";
}

$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/friend_RequestInfo.do",
		success:function(data){
				if(data != 0){
					$("#requestFriend").html("<input height = 35 width = 35 type = image src = ${pageContext.request.contextPath}/resources/images/99-1.png onclick = reqeustList()> ");
					$("#requestCount").text(data);
					$("#bubble").append("<img height = 35 width = 35  src = ${pageContext.request.contextPath}/resources/images/bubble.png>");
			 	}else{
					$("#requestFriend").html("<img height = 35 width = 35  src = ${pageContext.request.contextPath}/resources/images/99.png>");
					
				}
			}
	})
})
</script>
<style>
</style>
<header id="header">
	<%-- <div class="col-sm-12">
		<div id="logo">
			<h1>
				<a href="${pageContext.request.contextPath}/home.do"><img
					src="${pageContext.request.contextPath}/resources/images/logo.png" /></a>
			</h1>
		</div>
	</div> --%>

	<!-- Navigation
    ================================================== -->

	<div style="border-bottom-color : #fff; background-color:#fff;" class="navbar navbar-default navbar-static-top col-sm-12"
		role="navigation">
		<div id="my-navbar" class="navbar-collapse collapse col-sm-12">
			<ul class="nav navbar-nav" style="text-align:center">
				<li>　</li>

				<li><a href="${pageContext.request.contextPath}/getBurnListByStation.do?stationName=all">
						BURNING </a></li>
				<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/review/noauth_showList.do">
						REVIEW </a></li>
				<li>　</li>
					
				<li><a href="${pageContext.request.contextPath}/mypage/mypage.do">
						MYPAGE </a></li>
				<li>　</li>
				
				<li><a href="${pageContext.request.contextPath}/home.do">
				<img src="${pageContext.request.contextPath}/resources/images/logo.png" 
					style="height:40px; margin-top:-10px;"/>
				</a></li>
				<li>　</li>

				<li><a
					href="${pageContext.request.contextPath}/station/getTourInfoData.do">
						TourInfo </a></li>
				<li>　</li>
				<c:choose>
						<c:when test="${empty mvo}">
							<li><a href="${pageContext.request.contextPath}/member/noauth_login.do">
								LogIn </a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/logout.do">
								${mvo.name}님 LogOut </a></li>
							<li><a href="${pageContext.request.contextPath}/bucket/bucketList.do?id=${mvo.id}">버킷리스트</a>
							</li>
						</c:otherwise>
					</c:choose>
				<c:if test="${mvo != null }">
				
				<li><jsp:include page="message.jsp"/></li>
				
				&nbsp;&nbsp;&nbsp;&nbsp;
								
				<li><span id = "requestFriend"></span></li>
				<div id = "bubble" style="position: absolute; top: -25px; left: 883px;">
				<span id = "requestCount"style = "position: absolute; top:8px; left:13px;"></span>
				<!-- 	<img height = 35 width = 35  src = ${pageContext.request.contextPath}/resources/images/bubble.png> -->
				</div>
				</c:if>
<%-- 				<li><a href="${pageContext.request.contextPath }/hotplace/noauth_hotplace.do">HotPlace</a> </li>
				<li> </li>
 --%>			
 
 				
 	

 				
			</ul>
		</div>
	</div>
</header>

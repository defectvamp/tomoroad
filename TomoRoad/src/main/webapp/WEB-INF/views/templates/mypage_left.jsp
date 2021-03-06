<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <script>
    	$(document).ready(function(){
    		$("#withdraw").click(function(){
    			if(confirm("정말 탈퇴 하시겠습니까?")){
    				location.href="${pageContext.request.contextPath}/deleteMember.do?id=${mvo.id}";	
    			}
    			
    		});
    	});
    </script>
    
    <ul class = "arrows_list list_style">
    	<li><a href= "${pageContext.request.contextPath}/mypage/mypage.do"><span style = "font-size:18px"> 나의 여행</span></a></li>
    	<li><a href= "${pageContext.request.contextPath}/mypage/showListByMember.do"><span style = "font-size:18px">작성한 리뷰보기</span></a></li>
    	<li><a href = "${pageContext.request.contextPath}/mypage/friendList.do"><span style = "font-size:18px">친구 목록</span></a></li>
    	<li><a href = "${pageContext.request.contextPath}/mypage/friend_RequestList.do"><span style = "font-size:18px">친구요청 목록</span></a></li>
    	<li><a href = "${pageContext.request.contextPath}/mypage/friend_BlockList.do"><span style = "font-size:18px">차단친구 목록</span></a></li>
    	<li><a href = "${pageContext.request.contextPath}/mypage/update_form.do"><span style = "font-size:18px">회원수정</span></a></li>
    	<li><a href = "#." id="withdraw"><span style = "font-size:18px">회원탈퇴</span></a></li>
    </ul>
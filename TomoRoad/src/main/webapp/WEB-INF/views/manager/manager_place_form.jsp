<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div class="col-lg-12 col-sm-12"> 
	
	 <div class="dividerHeading" >
            <h4><span>수정 해주세요</span></h4>
        </div>

	 <form method="post" enctype ="multipart/form-data" action="${pageContext.request.contextPath}/updatePlaceManager.do" id="registerForm">
	 <div class="comment_form">
    	 <div class="row">
   	     <div class="col-sm-4">
               	 역이름<input  class="col-lg-4 col-md-4 form-control" type="text" id="station_name" name="station_name" value="${place.station_name}" readonly>
             </div>  	 
<%--     <div id="listStation" class="col-sm-4" >
    <select class="col-sm-4 form-control" name="station_name" id="station_name" required="required" >
	<option value="all">전체보기</option>
	<c:forEach items="${station}" var="sname">
	<option value="${sname.name}">${sname.name}</option>
	</c:forEach>
	</select>
             </div>
             <label>원하시는 역을 선택 해주세요</label> --%>
         </div>
     </div>
     	 <div class="comment_form">
    	 <div class="row">
    	     <div class="col-sm-4">
               	 번호<input class="col-lg-4 col-md-4 form-control" name="no" id="no" type="text" value="${place.no}" readonly>
             </div>
<!--               <div class="col-sm-4">
               	이미지파일<input type = "file" name = "uploadfile" id = "uploadfile" >
             </div> -->
    	     <div class="col-sm-4">
               	 관광지 이름<input class="col-lg-4 col-md-4 form-control" name="name" id="name" type="text" value="${place.name}" required="required" >
             </div>
             <br>
              <div class="col-sm-4">
               	<input class="col-lg-4 col-md-4 form-control" id="area" type="text" value="${place.area}" readonly>         
    	
   지역<select class="col-lg-4 col-md-4 form-control" name="area" required="required">
    <option value="Capital">수도권</option>
    <option value="Chungcheong">충청도</option>
    <option value="Honam">전라도</option>
    <option value="Youngnam">경상도</option>
     <option value="Gwandong">강원도</option>
  </select>
             </div>
             
         </div>
     </div>
     <br>
	<div align="center">
     <input class="btn btn-danger" type="submit" value="수정하기" style="width: 500px; height: 35px; margin: 0 auto; align:center;"> 
     <br>
     <br>
      <a class="btn btn-danger" href="${pageContext.request.contextPath}/getMemberList.do" style="width: 500px; height: 35px; margin: 0 auto; align:center;">관리자 화면</a>
    </div>  
  </form>
  </div>
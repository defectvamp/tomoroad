<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- ${param.id}-->


	<!-- 사진영역 -->
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="porDetCarousel">
		
			<!--사진-->
			<div class="carousel-content">
				<img class="carousel-item" src="${pageContext.request.contextPath}/resources/images/서울역.jpg" alt="" style="display: none;">
				<img class="carousel-item active" src="${pageContext.request.contextPath}/resources/images/서울역2.jpg"	alt="" style="display: block;">
				<img class="carousel-item" src="${pageContext.request.contextPath}/resources/images/서울역3.jpg" alt="" style="display: none;">
			</div>
			
			<!-- 화살표 -->
			<div class="carousel-control">
				<div class="carousel-prev"></div>
				<div class="carousel-next"></div>
				<ul class="carousel-pagination"><!-- 아래에 바(어떤 사진으로 하느냐에 따라 active가 바뀜 -->
					<li class=""></li>
					<li class="active"></li>
					<li class=""></li>
				</ul>
			</div>
			
		</div>
	</div>

<!-- 게시판 설명 시작(가로전체)-->
<div class="row sub_content">
	<!-- 게시판 글만 딱 써있는 부분 -->
	<div class="col-lg-8 col-md-8 col-sm-8">
		<div class="project_description">
			<div class="widget_title"><!-- 제목 -->
				<h4>
					<span>서울역</span>
				</h4>
			</div>
			
			<!-- 설명 -->
			<p>주소 : 서울특별시 용산구 한강대로 405 서울역</p>
			<p>전화번호 : 1544-7788</p>		
		</div>
	</div>

	<!-- 이건 뭐여?? 안나오는 부분 -->
	<div class="col-lg-4 col-md-4 col-sm-4">
		<div class="project_details">
			<div class="widget_title">
				<h4>
					<span>Project Details</span>
				</h4>
			</div>
			<ul class="details">
				<li><span>Client :</span>Louis</li>
				<li><span>Company :</span> Rain Technologies inc.</li>
				<li><span>Category :</span> Web Design, Photography</li>
				<li><span>Date :</span> 05 September 2015</li>
				<li><span>Project URL :</span> <a href="#">www.bestjquery.com</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- 끝 -->

<!-- 사진2 리스트 시작-->
<section class="latest_work row sub_content">
	<div class="col-md-12">
		<div class="dividerHeading">
			<h4>
				<span>Recent Work</span>
			</h4>
		</div>

		<div id="recent-work-slider" class="owl-carousel">
			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Touch and Swipe</h5>
						<p>Technology</p>
					</figcaption>
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역2.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역2.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>fully responsive</h5>
						<p>Mobile</p>
					</figcaption>
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역3.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역3.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Retina Ready</h5>
						<p>Responsive</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Boxed Layout</h5>
						<p>Branding</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역2.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역2.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Touch and Swipe</h5>
						<p>Technology</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역3.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역3.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>fully responsive</h5>
						<p>Mobile</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Retina Ready</h5>
						<p>Responsive</p>
					</figcaption>
					
				</figure>
			</div>

			<div class="box">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/서울역2.jpg" alt="" class="img-responsive">

					<div class="option">
						<a href="portfolio_single.html" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/서울역2.jpg" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption class="item-description">
						<h5>Boxed Layout</h5>
						<p>Branding</p>
					</figcaption>
					
				</figure>
			</div>
		</div>
	</div>
</section>
<!-- 사진리스트2 끝 -->
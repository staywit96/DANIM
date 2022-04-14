<%@ page language="java" session="true"	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script src="https:\\code.jquery.com\jquery-3.6.0.min.js"integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous"></script>
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}\js\jquery.fullPage.js"></script>
<script src="${pageContext.request.contextPath}\js\main.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">

<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/Main/jquery.fullPage.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/Main/main.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/Main/swiper.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>DANIM</title>

<!-- 상단 고정 네비바 -->
<header>
	<nav>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/pages/MyPage/Profile">일정관리</a>
			</li>
			<li><a
				href="${contextPath}/board/free.do">커뮤니티</a>
			</li>
			<li class="login">
			<c:choose>
		     	<c:when test="${empty LOGIN_ID}">
     	 	<li><a href="${pageContext.request.contextPath}/pages/Login">로그인</a></li>
	     	</c:when>
	     		<c:otherwise>
		     		<li class ="textcss">${LOGIN_NAME} 님</li>
		     		<li> <a href="${pageContext.request.contextPath}/pages/logout">로그아웃</a></li>
		     	</c:otherwise>
		    </c:choose>

		</ul>
	</nav>
</header>


<main id="fullpage">

	<!--메인페이지 섹션-->
	<section class="section">
		<div id="main">
			<div class="main_content">
				<div class="main_logo">
					<p class="text1">다님</p>
					<p class="text2">여행을 떠나다</p>
				</div>
				
				<!-- ㅇㅇㅇ -->
				<div class="search_box">
					<form name="searchMap" method="get"
						action="${contextPath}/map.do">
						<input type="text" name="search_map" placeholder="어디로 가시나요?"
							autocomplete="off" />
						<button class="button" type="submit">
							<img class="search_icon" src="${pageContext.request.contextPath}\images\Search_white.png" />
						</button>
					</form>
				</div>
				
				<!-- 태그 -->
				<div class="search_tag">
					<div class="map1">#제주도 해변</div>
                    <div class="map2">#강릉 캠핑</div>
				</div>
			</div>
		</div>
	</section>

	<!--서브페이지 섹션-->
	<section class="section">
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="tag">
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image1.jpg">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="tag">
						<div class="tag_name">
							<p class="text4">#캠핑
							<p></p>
							</br>
							<p class="text5">Camping</p>
						</div>
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image2.jpg">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="tag">
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image3.jpg">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="tag">
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image1.jpg">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="tag">
						<div class="tag_name">
							<p class="text4">#카페
							<p></p>
							</br>
							<p class="text5">Cafe</p>
						</div>
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image2.jpg">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="tag">
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image3.jpg">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="tag">
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image1.jpg">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="tag">
						<div class="tag_name">
							<p class="text4">#강릉
							<p></p>
							</br>
							<p class="text5">Gangneung</p>
						</div>
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image2.jpg">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="tag">
						<img class="tag_image"
							src="${pageContext.request.contextPath}\images\tag_image3.jpg">
					</div>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
		<div class="swiper-pagination"></div>
		</div>
	</section>
</main>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
	const token = $("meta[name='_csrf']").attr("content");
	const header = $("meta[name='_csrf_header']").attr("content");

	var swiper = new Swiper(".mySwiper", {
		slidesPerView : 3,
		spaceBetween : 30,
		slidesPerGroup : 3,
		loop : true,
		loopFillGroupWithBlank : true,
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});
</script>

<!-- ChatBot -->
<script type="text/javascript">
	(function(d, m) {
		var kommunicateSettings = {
			"appId" : "19698e8c290a01c13bd1edb0c660f946a",
			"popupWidget" : true,
			"automaticChatOpenOnNavigation" : true
		};
		var s = document.createElement("script");
		s.type = "text/javascript";
		s.async = true;
		s.src = "https://widget.kommunicate.io/v2/kommunicate.app";
		var h = document.getElementsByTagName("head")[0];
		h.appendChild(s);
		window.kommunicate = m;
		m._globals = kommunicateSettings;
	})(document, window.kommunicate || {});
</script>

<div class="map1">#제주도 해변</div>
<div class="map2">#강릉 캠핑</div>
<script>
$(document).ready(function(){

    $(".map1").on("click", function(){
        window.location.href = "${contextPath}/map.do?search_map=제주도 해변";
    });

    $(".map2").on("click", function(){
        window.location.href = "${contextPath}/map.do?search_map=강릉 캠핑";
    }); 
});
</script>
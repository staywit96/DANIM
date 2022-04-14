<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>지도 창</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/map.css?ver1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c829cfc2ac1eff1d52f2ebdbbb03cb3&libraries=services">
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>

<header>
	<input id="login_id" style="display:none;" value="${LOGIN_ID}"/>
	<nav>
		<ul>
			<li><a href="${pageContext.request.contextPath}/pages/MyPage/Profile">일정관리</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/pages/Board/Free/FreeList">커뮤니티</a>
			</li>
			<li class="login">
			<c:choose>
		     	<c:when test="${empty LOGIN_ID}">
     	 	<li><a href="${pageContext.request.contextPath}/pages/Login">로그인</a></li>
	     	</c:when>
	     		<c:otherwise>
		     		<li>${LOGIN_NAME} 님</li>
		     		<li> <a href="${pageContext.request.contextPath}/pages/logout">로그아웃</a></li>
		     	</c:otherwise>
		    </c:choose>

		</ul>
	</nav>
</header>

<div class="container">
	<div class="map_wrap">
    <div id="map" style="width:100%;height:850px;position:relative;overflow:hidden; border-radius:20px; box-shadow: 0px 1px 2px 1px gray;"  ></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div style="display: inline-block;
    margin-top: 34px;">
                <form onsubmit="return false">
                    <input type="text" id="keyword" placeholder="장소를 입력해주세요" autocomplete="off" style="width:300px;height:30px; border-color:#2A3D57; border-radius:10px; padding-left:10px; font-size:13pt;"> 
                    <input type="hidden" value='${param.search_map}' id="search_map"/>
                    <button onclick="searchPlaces()"><img src="${pageContext.request.contextPath}/images/search.png" style="width:20px; height:20px;"/></button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
	</div>
	
	</div>
<!-- 검색 목록, 마커 클릭 시 뜨는 창 -->
	<div class = "modal">
	<div class= "modal_content">
	<div class="place_image">
			<img src="${pageContext.request.contextPath}/images/test.jpg" width="150" height="120">
			</div>
			<div class="place">
 <div class= "modal_title">
				<button id="btn_close_location" onclick="closeDetailsWindow()"><img src="${pageContext.request.contextPath}/images/close.png" style="width:30px; height:30px;"/></button>
			</div>
			<div class="place_info">
			<p id="placeName"></p>
			<p id="placeID" style="display:none"></p>
			<p id="address"></p>
			<p id="phone"></p>
			</div>
			<div class="section">
			<div class="review_input">
				<p id="r_id" style="display:none;"></p>
				<textarea id="r_input"></textarea>
				<button id="r_button" onclick="addReview()">작성하기</button>
					<button id="r_cancel" style="display:none;" onclick="modCancel()">취소</button>
				<button id="r_ok" style="display:none;" onclick="modReview()">확인</button>
				<input id="rating" value="0" style="display:none;"/>
				<div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rating" onclick="setRating(5)"/>
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rating" onclick="setRating(4)"/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rating" onclick="setRating(3)"/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rating" onclick="setRating(2)"/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rating" onclick="setRating(1)"/>
					<label for="1-star" class="star">★</label>
				</div>
				</div>
				<div class="review_box">
				<h3>리뷰</h3>
				<ul class="reviewList">
				</ul>
				</div>
			</div>
			</div>
	</div>	
		<div class="modal_layer"></div>
	</div>
<script src="js/map.js"></script>
<!--  <script>
$(function() {
    $('#my_frame').toggle();
    $('#toggle_frame').click(function() {
        $('#my_frame').toggle();
        $('#toggle_frame').hide();
    });
});
</script>
-->
<script type="text/javascript">
(function(d, m) {
    var kommunicateSettings = {
        "appId": "19698e8c290a01c13bd1edb0c660f946a",
        "popupWidget": true,
        "automaticChatOpenOnNavigation": true
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

</body>
</html>
var path = getContextPath();

function getContextPath(){
    var hostIndex = location.href.indexOf(location.host)+location.host.length;
    var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
    return contextPath;
}

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 마커를 누를 때 표시되는 오버레이를 생성합니다.
var co = new kakao.maps.CustomOverlay({zindex:1});

searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	
	if(document.getElementById('keyword').value){
		var keyword = document.getElementById('keyword').value;
		
	} else if(document.getElementById('search_map').value){
		var keyword = document.getElementById('search_map').value;
	} else{
		alert("장소를 입력해주세요");
	}
	
	closeOverlay();
	history.replaceState({}, null, location.pathname);
	ps.keywordSearch(keyword, placesSearchCB); 

}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    

    
    for ( var i=0; i<places.length; i++ ) {
		//평균 평점 가져오기
    	var avg_ratings = getAvgRatings(places[i].id);
    	
		console.log(places[i]);
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i],avg_ratings); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        (function(marker, places) {
            kakao.maps.event.addListener(marker, 'click', function() {
                showPlaceInfo(places);
            });

            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayOverlay(places, marker);
            });

          		itemEl.onmouseover =  function () {
                displayOverlay(places, marker);
            };
            
            //검색 목록 클릭 시 해당 장소 정보 띄움
            	itemEl.onclick = function(){
            	showPlaceInfo(places);
            };

        })(marker, places[i]);

        fragment.appendChild(itemEl);
        
        dataCheck(places[i]);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

function dataCheck(places) {
		
	$.ajax({
		type : 'POST',
		dataType : 'json',
		data : {
			'id' : places.id,
			'place_name' : places.place_name,
			'address_name' : places.address_name,
			'phone' : places.phone,
			'x' : places.x,
			'y' : places.y
		},
		url : 'datamap.do',
		success : function(result) {
			
		}
	});
}

function showPlaceInfo(place){
	//장소 상세정보 설정
	setPlaceDetails(place);         	
	//리뷰 목록 가져오기
	getReviewList();
	//상세정보창 띄우기
	showModal();
}

//장소 정보 세부정보창에 설정하는 함수
function setPlaceDetails(place){
	var placeName = document.getElementById('placeName');
	var address = document.getElementById('address');
	var phone = document.getElementById('phone');
	var placeID = document.getElementById('placeID');
	
	placeName.innerHTML = place.place_name;
	address.innerHTML = place.address_name;
	phone.innerHTML = place.phone;
	placeID.value = place.id;
	
}

//리뷰 리스트 가져오는 함수
function getReviewList(){
	var placeID = document.getElementById('placeID').value;
	
	$('.reviewList').children().remove();	//리뷰 초기화
	
	$.ajax({
		url : "getReviews.do",
		type : 'post',
		data : {
			placeID : placeID,
			
		},
		success : function(result) {
			if(!nullCheck(result)){
				//등록된 리뷰 모두 출력
				$(result).each(function(){
					var login_id = document.getElementById('login_id').value;
					
					var str='';
					var star = '<div class="star-section"><div class="star-ratings">'
					+'<div class="star-ratings-fill space-x-2 text-lg" style= "width: '+ratingToPercent(this.rating)+'%">'
					+'<p>★</p><p>★</p><p>★</p><p>★</p><p>★</p></div>'
					+'<div class="star-ratings-base space-x-2 text-lg">'
					+'<p>★</p><p>★</p><p>★</p><p>★</p><p>★</p></div>'
					+'</div><p id="r_avg">'+this.rating+'</p></div>'; //별점
					
					str += '<li>'
					+'<img id="user_img" src="./images/user.png">'
					+'<p style="font-size: 15px; font-weight: bold; color: #2A3D57">'+this.id+"</p>"
					+star
					+"<p>"+this.review+"</p>"
					+'<div class="review-bottom">'
					+'<p>'+this.writedate+"</p>";
					
					if(login_id==this.id){
					str += '<div class="button-section">'	
					+'<button id="itemMod" onclick="modInput('+this.reviewID+",'"+this.review+"',"+this.rating+')">수정</button></c:if>'
					+'<button id="itemDel" onclick="delReview('+this.reviewID+')">삭제</button></div></div></li>';
					}else{
						str+='</div></li>';
					}
					
					$('.reviewList').append(str);	
					
				});
			}else{
				var str='<p>등록된 리뷰가 없습니다</p>';
				$('.reviewList').append(str);
			}
	   }
	});
}


//////////////
    //리뷰 작성하기
function addReview(){
    //정보 가져옴
    var placeID = $('#placeID').val();
    var rating = $('#rating').val();
    var review = $('#r_input').val();

    //비로그인 사용자 확인
    var login_id = document.getElementById('login_id').value;
    if(nullCheck(login_id)){
        alert("리뷰 작성은 로그인 후 이용 가능합니다.");
        return false;
    }


    //리뷰 공백 확인
    if(review==""){
        alert("리뷰 내용을 입력해 주세요.");
        return false;
    }

    //리뷰 데이터 controller로 전송
    $.ajax({
        url : "writeReview.do",
        type : 'post',
        data : {
            placeID : placeID,
            rating : rating,
            review : review,
        },
        success : function(result) {
            if(result == 1) {
                getReviewList(); //리뷰 목록창 reload 
                alert("리뷰가 등록되었습니다.");
            }
            else if(result == -1) alert("이미 작성한 리뷰가 존재합니다."); //리뷰 작성 여부 확인
            else alert("리뷰 저장에 실패했습니다.");
        }
    });

    //입력창,별점 초기화
    initReviewForm();

}

function delReview(reviewID){
	if(!confirm('삭제하시겠습니까?')) return false;
	
	$.ajax({
		url : "delReview.do",
		type : 'post',
		data : {
			reviewID : reviewID
		},
		success : function(result) {
			if(result == 1) {
				alert("삭제가 완료되었습니다.");
				getReviewList();
			}
	    }
	});
}

function modInput(reviewID,review,rating){
	//수정, 삭제버튼 제거
	
	//확인, 취소버튼 생성
	document.getElementById('r_button').style.display = "none";
	document.getElementById('r_ok').style.display = "inline-block";
	document.getElementById('r_cancel').style.display = "inline-block";

	//수정할 리뷰 불러오기
	document.getElementById('r_id').value=reviewID;
	document.getElementById('r_input').value=review;
	document.getElementById('rating').value=rating;
}

function modCancel(){
	
	//확인, 취소버튼 숨기기
	document.getElementById('r_button').style.display = "block";
	document.getElementById('r_ok').style.display = "none";
	document.getElementById('r_cancel').style.display = "none";
	
	//입력창 초기화
	initReviewForm();
}

function modReview(){
	
	var reviewID = document.getElementById('r_id').value;
	var review = document.getElementById('r_input').value;
	var rating = document.getElementById('rating').value;
	
	$.ajax({
		url : "modReview.do",
		type : 'post',
		data : {
			reviewID : reviewID,
			rating : rating,
			review : review
		},
		success : function(result) {
			if(result == 1) {
				alert("수정이 완료되었습니다.");
				getReviewList();
			}
	    }
	});
	
	modCancel();
}

//세부정보창 띄우는 함수
function showModal(){
	$('.modal').attr('style','display:block');
	$('.modal_content').css({
         "top": (($(window).height()-$('.modal_content').outerHeight())/2+$(window).scrollTop())+"px",
         "left": (($(window).width()-$('.modal_content').outerWidth())/2+$(window).scrollLeft())+"px"
         //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정     
      });
}

//세부정보창 없애기
function closeDetailsWindow(){
	$('.modal').attr('style','display:none');
	initReviewForm();
}

function initReviewForm(){
	//입력창 초기화
	$('#r_input').val('');
	$('#rating').val('0');
	
	//별점 초기화
	$('input[name="rating"]').each(function() {
    $(this).prop('checked', false);
	});
}
//null값 체크하는 함수
function nullCheck(str){
	
	return (!str || str.length === 0 );	
}

//평점 평균 가져오는 함수
function getAvgRatings(placeID){
	var avg_ratings;
	$.ajax({
		url : "avgRatings.do",
		type : 'post',
		async: false,
		data : {
			placeID:placeID
		},
		success : function(result) {
			avg_ratings = result;
	    }
	});
	
	return avg_ratings;
}

function ratingToPercent(avg_ratings){
    const score = +avg_ratings * 20;
    return score;
}

//리뷰 별점 클릭 시 작동하는 함
function setRating(score){
	$('#rating').val(score);
}


// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places,avg_ratings) {
	
	var star = '<div class="star-section"><div class="star-ratings">'
		+'<div class="star-ratings-fill space-x-2 text-lg" style= "width: '+ratingToPercent(avg_ratings)+'%">'
			+'<p>★</p><p>★</p><p>★</p><p>★</p><p>★</p></div>'
			+'<div class="star-ratings-base space-x-2 text-lg">'
			+'<p>★</p><p>★</p><p>★</p><p>★</p><p>★</p></div>'
		+'</div><p id="r_avg">'+avg_ratings+'</p></div>'; //별점 

    var el = document.createElement('li'),
    itemStr = '<div class="limg">' +
                '<img src="'+ path +'/images/map/' + places.id + '.jpg" onError="imgError(this);" width="100" height="100">' +
              '</div>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';
                
    if(avg_ratings!=-1) itemStr += star; //평균 평점 존재 시 별점 추가

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }

      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 오버레이에 장소 정보를 표시합니다.
function displayOverlay(places, marker) {
    var content = '<div class="wrap">' + 
                    '<div class="info">' + 
                          '<div class="title">' + places.place_name + 
                            '<div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                           '</div>' + 
                        '<div class="body">' + 
                            '<div class="img">' +
                                '<img src="'+ path +'/images/map/' + places.id + '.jpg" onError="imgError(this);" width="100" height="100">' +
                            '</div>' + 
                            '<div class="desc">' + 
                                '<div class="jibun ellipsis">' + places.address_name + '</div>' + 
                                '<div class="jibun ellipsis">' + places.phone + '</div>' +
                            '</div>' + 
                        '</div>' + 
                    '</div>' +
                  '</div>';

    co.setContent(content);
    co.setPosition(marker.getPosition());
    co.setMap(map);
}
function imgError(image) {
    image.onerror = "";
    image.src = path + "/images/logo.jpg";
    return true;
}
function closeOverlay() {
    co.setMap(null);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
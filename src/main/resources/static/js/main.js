/* 풀페이지 옵션 */
$(function () {
    $('#fullpage').fullpage({
        //options here
        autoScrolling: true,
        scrollHorizontally: true,
        navigation: true,
        controlArrows: true,
        navagationPosition: 'right',
    });
});

/* 스크롤 시 네비바 변경 */
$(function () {
    $(window).scroll(function () {
        var scroll = $(this).scrollTop();
        var $header = $('header');
        if (scroll > 1080) {
            $header.addClass('black');
        } else {
            $header.removeClass('black');
        }
    })
})

/* 새로고침 이미지 변경 */
window.onload = function () {
    var background_img = "images/main_";
    var number = Math.floor(Math.random() * 4) + 1;
    var main = document.getElementById("main");
    background_img += number + ".png";
    main.style.backgroundImage = "url('" + background_img + "')";
}

/* 태그페이지 슬라이드 */
var swiper = new Swiper(".mySwiper", {
    slidesPerView: 3,
    spaceBetween: 30,
    slidesPerGroup: 3,
    loop: true,
    loopFillGroupWithBlank: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
});

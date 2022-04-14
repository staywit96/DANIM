<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="나의 일정관리">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>addplan</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/nicepage.css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/addplan.css" media="screen">
<script class="u-script" type="text/javascript" src="${pageContext.request.contextPath}/js/MyPage/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="${pageContext.request.contextPath}/js/MyPage/nicepage.js" defer=""></script>
<meta name="generator" content="Nicepage 4.4.3, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">

<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>

<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="addplan">
<meta property="og:type" content="website">

</head>
<body class="u-body u-xl-mode">
	<header class=" u-clearfix u-header u-section-row-container" id="sec-4203">
		<div class="u-section-rows">
			<div class="u-clearfix u-grey-5 u-section-row u-section-row-1" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction="" id="sec-7299">
				<div class="u-clearfix u-sheet u-sheet-1">
					<nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
						<div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
							<a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
							<svg class="u-svg-link" viewBox="0 0 24 24">
									<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use>
							</svg>
							<svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
									<g>
									<rect y="1" width="16" height="2"></rect>
									<rect y="7" width="16" height="2"></rect>
									<rect y="13" width="16" height="2"></rect>
									</g>
							</svg>
							</a>
						</div>
						<div class="u-custom-menu u-nav-container">
							<ul class="u-nav u-unstyled u-nav-1">
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#" style="padding: 10px 20px;">일정관리</a>
								</li>
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#" style="padding: 10px 20px;">커뮤니티</a>
								</li>
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#" style="padding: 10px 20px;">로그아웃</a>
								</li>
							</ul>
						</div>
						<div class="u-custom-menu u-nav-container-collapse">
							<div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
								<div class="u-inner-container-layout u-sidenav-overflow">
									<div class="u-menu-close"></div>
									<ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="#" style="padding: 10px 20px;">일정관리</a>
										</li>
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="#" style="padding: 10px 20px;">커뮤니티</a>
										</li>
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="#" style="padding: 10px 20px;">로그아웃</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
						</div>
					</nav>
				</div>





			</div>
			<div class="u-section-row u-section-row-2" id="sec-a669">
				<div class="u-clearfix u-sheet u-valign-middle u-sheet-2">
					<nav class="u-menu u-menu-dropdown u-offcanvas u-menu-2">
						<div class="menu-collapse">
							<a class="u-button-style u-nav-link" href="#">
							<svg class="u-svg-link" viewBox="0 0 24 24">
									<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-89b5"></use>
							</svg>
							<svg class="u-svg-content" version="1.1" id="svg-89b5" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
									<g>
									<rect y="1" width="16" height="2"></rect>
									<rect y="7" width="16" height="2"></rect>
									<rect y="13" width="16" height="2"></rect>
									</g>
							</svg>
							</a>
						</div>
						<div class="u-custom-menu u-nav-container">
							<ul class="u-custom-font u-nav u-text-font u-unstyled">
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link" href="#">내정보 수정</a></li>
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link" href="#">일정관리</a>
									<div class="u-nav-popup">
										<ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-4">
											<li class="u-nav-item">
												<a class="u-button-style u-nav-link u-white" href="#">추가</a>
											</li>
										</ul>
									</div>
								</li>
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link" href="#">내 게시글</a>
								</li>
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link" href="#">[관리자 전용] 회원관리</a>
								</li>
							</ul>
						</div>
						<div class="u-custom-menu u-nav-container-collapse">
							<div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
								<div class="u-inner-container-layout u-sidenav-overflow">
									<div class="u-menu-close"></div>
									<ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-5">
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="#">내정보 수정</a>
										</li>
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="#">일정관리</a>
											<div class="u-nav-popup">
												<ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-6">
													<li class="u-nav-item">
														<a class="u-button-style u-nav-link" href="#">추가</a>
													</li>
												</ul>
											</div>
										</li>
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="#">내 게시글</a>
										</li>
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="#">[관리자 전용] 회원관리</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
      
      
      
    <section class="u-align-center u-clearfix u-section-1" id="carousel_0b5d">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-1">나의 일정 작성</h2>
        <a href="#" class="u-border-2 u-btn u-button-style u-custom-color-2 u-hover-custom-color-2 u-text-body-alt-color u-btn-1">지도 펼치기&nbsp;<span class="u-icon"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M441.156,322.876l-48.666-47.386c-3.319-3.243-8.619-3.234-11.93,0.017l-81.894,80.299V8.533 c0-4.71-3.823-8.533-8.533-8.533h-68.267c-4.71,0-8.533,3.823-8.533,8.533v347.273l-81.894-80.299    c-3.311-3.243-8.602-3.251-11.921-0.017l-48.666,47.386c-1.655,1.604-2.586,3.806-2.586,6.11c0,2.304,0.939,4.506,2.586,6.11 l179.2,174.481c1.655,1.613,3.806,2.423,5.948,2.423c2.15,0,4.292-0.811,5.956-2.423l179.2-174.481 c1.647-1.604,2.577-3.806,2.577-6.11C443.733,326.682,442.803,324.48,441.156,322.876z"></path></svg><img></span>
        </a>
        <div class="u-form u-form-1">
          <form action="#" method="POST" class="u-clearfix u-form-spacing-15 u-form-vertical u-inner-form" style="padding: 0;" source="custom" name="form">
            <div class="u-form-group u-form-name u-form-group-1">
              <label for="name-f2a8" class="u-label u-label-1">여행 제목</label>
              <input type="text" placeholder="제목을 입력해 주세요." id="name-f2a8" name="name" class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle" required="">
            </div>
            <div class="u-form-date u-form-group u-form-partition-factor-2 u-form-group-2">
              <label for="date-a740" class="u-label u-label-2">시작일정</label>
              <input type="date" placeholder="YYYY/MM/DD" id="date-a740" name="date-1" class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle" required="">
            </div>
            <div class="u-form-date u-form-group u-form-partition-factor-2 u-form-group-3">
              <label for="date-4441" class="u-label u-label-3">마침일정</label>
              <input type="date" placeholder="YYYY/MM/DD" id="date-4441" name="date" class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle" required="">
            </div>
            <div class="u-form-group u-form-message u-form-group-4">
              <label for="message-f2a8" class="u-label u-label-4">여행 내용</label>
              <textarea placeholder="내용을 입력해주세요." rows="4" cols="50" id="message-f2a8" name="message" class="u-border-2 u-border-grey-75 u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle" required=""></textarea>
            </div>
            <div class="u-align-center u-form-group u-form-submit u-form-group-5">
              <a href="#" class="u-black u-btn u-btn-rectangle u-btn-submit u-button-style u-btn-2">작성완료<br>
              </a>
              <input type="submit" value="submit" class="u-form-control-hidden">
            </div>
            
          </form>
        </div>
      </div>
    </section>
    
    

  </body>
</html>
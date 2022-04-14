<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="나의 일정관리">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>DANIM 내 프로필</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/newstyle.css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Main/Main.css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/nicepage.css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/ppp.css" media="screen">
<script class="u-script" type="text/javascript" src="${pageContext.request.contextPath}/js/MyPage/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="${pageContext.request.contextPath}/js/MyPage/nicepage.js" defer=""></script>
<meta name="generator" content="Nicepage 4.4.3, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>

<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="ppp">
<meta property="og:type" content="website">

</head>

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



<!-- 영역 Header의 하단 메뉴 바 시작 -->
						<div class="u-custom-menu u-nav-container">
							<ul class="u-custom-font u-nav u-text-font u-unstyled">
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link" href="${pageContext.request.contextPath}/pages/MyPage/modinfo">내정보 수정</a></li>
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link" href="${pageContext.request.contextPath}/pages/MyPage/View">일정관리</a>
									<div class="u-nav-popup">
										<ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-4">
											<li class="u-nav-item">
												<a class="u-button-style u-nav-link u-white" href="${pageContext.request.contextPath}/pages/MyPage/addplan">추가</a>
											</li>
										</ul>
									</div>
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link" href="${pageContext.request.contextPath}/pages/MyPage/mode">내 게시글</a>
								</li>
								<li class="u-nav-item">
									<a class="u-button-style u-nav-link" href="${pageContext.request.contextPath}/pages/MyPage/admin">[관리자 전용] 회원관리</a>
								</li>
								</li>
							</ul>
						</div>
<!-- 영역 Header의 하단 메뉴 바 끝 -->

<!-- 영역 Header의 하단 메뉴 바 (그림자) 시작 -->						
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

												</ul>
											</div>
										</li>
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="#">내 게시글</a>
										</li>
										<li class="u-nav-item">
											<a class="u-button-style u-nav-link" href="${pageContext.request.contextPath}/pages/MyPage/admin">[관리자 전용] 회원관리</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
						</div>
<!-- 영역 Header의 하단 메뉴 바 (그림자) 끝 -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	
      
      
      			<!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">myprofile</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                               
                               
                               <!-- 회원 정보 데이터 들어가는 곳 -->
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                        aria-labelledby="dropdownMenuLink">

                                        <a class="dropdown-item" href="#">내용내용n</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
	                                    </div>
		                                </div>
		                            </div>
		                            
		                        <p>내용 나오는 곳 </p>
						     	
						     	
						     	
										     	
										
		                            
		                            
		                            
	                            <table class="u-table-entity">
						            <tbody class="u-table-body u-table-body-2">
						              <tr style="height: 55px;">
						                <td class="u-table-cell">전화번호</td>
						              </tr>
						              <tr style="height: 55px;">
						                <td class="u-table-cell">010-1548-1577</td>
						              </tr>
						              <tr style="height: 55px;">
						                <td class="u-table-cell">이메일</td>
						              </tr>
						              <tr style="height: 55px;">
						                <td class="u-table-cell">multi_manager@multi.com</td>
						              </tr>
						            </tbody>
						          </table>
                            
                            
                            
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-pie pt-4 pb-2">
                                    <canvas id="myPieChart"></canvas>
                                </div>
                                <div class="mt-4 text-center small">
                                    <span class="mr-2"><i class="fas fa-circle text-primary"></i> DANIM</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- myprofile 디자인 끝 지점 -->
                
      
<!-- Section(몸통 디자인 시작) -->      
    <section class="u-clearfix u-section-1" id="sec-9bba">


        
<!-- 닉네임, 사진 넣는 영역 끝 -->

<!-- Section(몸통 하단) 디자인 시작 -->
        <div class="u-table u-table-responsive u-table-2">
          
        </div>
        
        
        
<!-- Section(몸통 하단) 디자인 끝 -->
      </div>
    </section>
    				
    

  </body>
</html>
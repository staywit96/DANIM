<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>DANIM</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
		<title>DANIM 회원 정보변경</title>
<link href="${pageContext.request.contextPath}/css/MyPage/newstyles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/nicepage.css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/modinfo.css" media="screen">
<meta name="generator" content="Nicepage 4.4.3, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">

</head>


    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/">HOME</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                </div>
            </form>
            
            <!-- 메뉴 Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    
					<li><a
						href="${contextPath}/board/free.do">커뮤니티</a>
					</li>
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
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="${pageContext.request.contextPath}/pages/MyPage/Profile">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                내정보
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            
                            <!-- 개인 정보 수정 태그 -->
                            <a class="nav-link collapsed" href="${pageContext.request.contextPath}/pages/MyPage/update" aria-controls="pagesCollapseError">
                            	개인 정보 수정
                            </a>
                            <!-- 일정 관리 수정 태그 -->
                            <a class="nav-link collapsed" href="${pageContext.request.contextPath}/pages/MyPage/View"  aria-controls="pagesCollapseError">
                            	일정 관리하기
                            </a>
                            
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>내 기록 보기<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="${pageContext.request.contextPath}/pages/MyPage/admin"  aria-controls="pagesCollapseError">
                                        댓글 보기</a>
                                   <a class="nav-link collapsed" href="${pageContext.request.contextPath}/pages/MyPage/admin"  aria-controls="pagesCollapseError">
                                        게시글 보기</a>
                                    <a class="nav-link collapsed" href="${pageContext.request.contextPath}/pages/MyPage/admin"  aria-controls="pagesCollapseError">
                                        [관리자 전용] 회원관리</a>
                                    
                                </nav>
                            </div>
                </nav>
            </div>


                        <!-- 레이어 디자인 끝 -->


            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4"> Update</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">내정보를 손 쉽게 변경해요</li>
                        </ol>
                        
                        
                        <!-- 내용 물 -->
					    
					      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
					        <div class="u-form u-form-1">
					          <form action="#" method="POST" class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form" source="custom" name="form" style="padding: 10px;">
					            <div class="u-form-group u-form-name">
					            
					            <!--  닉네임 변경 -->
					              <label for="name-3014" class="u-label">닉네임</label>
					              <input type="text" placeholder="변경할 닉네임을 입력하세요." id="name-3014" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
					            </div>
					            
					            <!-- 비밀번호 입력 -->
					            <div class="u-form-group u-form-group-2">
					              <label for="text-4f5a" class="u-label">비밀번호</label>
					              <input type="text" placeholder="변경할 비밀번호를 입력하세요." id="text-4f5a" name="text-2" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">
					            </div>
					            
					            <!-- 비밀번호 재입력 -->
					            <div class="u-form-group u-form-group-2">
					              <label for="text-4f5a" class="u-label">비밀번호</label>
					              <input type="text" placeholder="변경할 비밀번호를 입력하세요." id="text-4f5a" name="text-2" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">
					            </div>
					            
					            <!-- 핸드폰 번호 변경 -->
					            <div class="u-form-group u-form-phone u-form-group-3">
					              <label for="phone-4b48" class="u-label">전화번호</label>
					              <input type="tel" pattern="\+?\d{0,3}[\s\(\-]?([0-9]{2,3})[\s\)\-]?([\s\-]?)([0-9]{3})[\s\-]?([0-9]{2})[\s\-]?([0-9]{2})" placeholder="변경할 전화번호를 입력하세요." id="phone-4b48" name="phone" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
					            </div>
					            
					            <!-- 이메일 변경 -->
					            <div class="u-form-email u-form-group u-form-group-4">
					              <label for="text-488c" class="u-label">이메일</label>
					              <input type="email" placeholder="변경할 이메일을 입력하세요." id="text-488c" name="text-1" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">
					            </div>
					            
					           
					            <div class="u-align-center u-form-group u-form-submit">
					              <a href="#" class="u-black u-border-none u-btn u-btn-submit u-button-style u-btn-1">변경완료<br>
					              </a>
					              <input type="submit" value="submit" class="u-form-control-hidden">
					            </div>
					            
					          </form>
					        </div>
					      </div>
					    <!--
					    
					     <div class="u-form-group u-form-message u-form-group-5"> -->
					          <!--     <label for="message-6e66" class="u-label">프로필 사진</label><br>  -->
					              <!-- <textarea placeholder="Enter your message" rows="4" cols="50" id="message-6e66" name="message" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required=""></textarea> -->
					         <!--      <input type="file" class="form-control-file" id="exampleInputFile" /> -->
					       <!--      </div>
					    
					    
					     내용 물 -->
   
                            
                        </div>
                      
                           
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 다님</div>

                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/MyPage/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/MyPage/mypageJs.js"></script>
    </body>
    
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



  </body>
</html>
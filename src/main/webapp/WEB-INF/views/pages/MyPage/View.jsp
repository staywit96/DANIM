<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>일정 보기</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/MyPage/newstyles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/nicepage.css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MyPage/viewplan.css" media="screen">
<script class="u-script" type="text/javascript" src="${pageContext.request.contextPath}/js/MyPage/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="${pageContext.request.contextPath}/js/MyPage/nicepage.js" defer=""></script>
<meta name="generator" content="Nicepage 4.4.3, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">


</head>
<body class="u-body u-xl-mode">

	
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
            
            <!-- 네비 끝 -->
	
	
			<!-- 내용 돌릴 곳 -->
			           <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">일정 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">나만의 일정들을 모아 봅시다</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                내 일정들 모아보기
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        <tr>
                                            <td>Colleen Hurst</td>
                                            <td>Javascript Developer</td>
                                            <td>San Francisco</td>
                                            <td>39</td>
                                            <td>2009/09/15</td>
                                            <td>$205,500</td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
    
</html>
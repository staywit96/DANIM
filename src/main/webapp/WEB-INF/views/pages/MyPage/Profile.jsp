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
        <link href="${pageContext.request.contextPath}/css/MyPage/newstyles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/MyPage/mypageJs.js"></script>
    </head>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
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
                            <a class="nav-link" href="#">
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
                                   <a class="nav-link collapsed" href="${pageContext.request.contextPath}/pages/MyPage/boardView"  aria-controls="pagesCollapseError">
                                        게시글 보기</a>
                                    <a class="nav-link collapsed" href="${pageContext.request.contextPath}/pages/MyPage/admin"  aria-controls="pagesCollapseError">
                                        [관리자 전용] 회원관리</a>
                                    
                                </nav>
                            </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">MyProfile</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">내정보를 한눈에 봐요</li>
                        </ol>

   
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        내정보
                                    </div>
                                   
                                   <div><br/><br/>
                                   		아이디 : ${LOGIN_ID}<br/>
                                   		이름 : ${LOGIN_NAME}<br/>
                                   		핸드폰 번호 : ${PHONE}<br/>
                                   		메일 : ${MAIL}<br/>
                                   		닉네임 : ${NICKNAME} 
                                   	</div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
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
        <script src="js/datatables-simple-demo.js"></script>
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

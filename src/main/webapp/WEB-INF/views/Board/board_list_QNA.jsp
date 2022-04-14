<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
<script>
	function Rwrite(){
		location.href="${contextPath}/board/writeq.do";
	}
</script>
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<table>
<tr>
<td>
<header>
    <nav>
        <ul>
        <li><a
				href="${pageContext.request.contextPath}/">홈</a>
			</li>
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
<div class="comm">커뮤니티</div>

<div class="menu">
	<aside id="left">
		<ul>	
	      <li><a href="${contextPath}/board/free.do"/><div>자유게시판</div></a></li>
	      <li><a href="${contextPath}/board/qna.do"><div>질문게시판</div></a></li>
	      <li><a href="${contextPath}/board/list.do"><div>후기게시판</div></a></li>
    	</ul>
	</aside>
</div>	

	<div class="board_wrap">
		<div class="board_title">
			<strong>질문게시판</strong>
			<p>질문을 남겨주세요.</p>
			<button id="write_new_post_btn" onClick="Rwrite()">
			<span class="material-icons-outlined">drive_file_rename_outline</span><a>포스트 작성</a>
			</button>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="RB_UQ" id="QNA_Unique_Number">번호</div>
					<div class="QNA_Title" id="QNA_Title">제목</div>
					<div class="User_ID " id="User_ID">글쓴이</div>
					<div class="QNA_Date_Created" id="QNA_Date_Created">쟉성일</div>
					<div class="cnt" id="cnt">조회</div>
				</div>
				<c:forEach items="${list}" var="test">
				<div>
					<div class="RB_UQ" id="QNA_Unique_Number">${test.QNA_Unique_Number}</div>
					<div class="QNA_Title" id="QNA_Title"><a href="${contextPath}/board/viewq.do?QNA_Unique_Number=${test.QNA_Unique_Number}">${test.QNA_Title}</a></div>
					<div class="User_ID" id="User_ID"></div>
					<div class="QNA_Date_Created" id="QNA_Date_Created">${test.QNA_Date_Created}</div>
					<div class="cnt" id="QNA_Comment_Count">${test.QNA_Comment_Count}</div>
				</div>
				</c:forEach>
			</div>
			<div class="board_page">
				<ul class="paging">
					<c:if test="${paging.prev}">
						<span><a 
							href='<c:url value="/board/qna.do?page=${paging.startPage-1}"/>'>이전</a></span>
								</c:if>
								<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
									var="num">
									<span><a href='<c:url value="/board/qna.do?page=${num}"/>'>${num}</a></span>
								</c:forEach>
								<c:if test="${paging.next && paging.endPage>0}">
						<span><a
							href='<c:url value="/board/qna.do?page=${paging.endPage+1}"/>'>다음</a></span>
					</c:if>
				</ul>
			</div>
						
			<div class="search">
				<input type="text" id="bar" placeholder="검색어 입력">
				<input type="button" onclick="getSearchList()" class="sch" value="검색"></input>
			</div>
		</div>
	</div>
	</td>
	</tr>
	</table>
</body>
</html>

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
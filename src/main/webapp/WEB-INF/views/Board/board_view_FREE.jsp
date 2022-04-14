<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<script>
	function btn(){
		alert("신고가 접수되었습니다.");
	}
	
	function backToListF(){
		location.href="${contextPath}/board/free.do";
	}
	
	function goToEditF(){
		location.href="${contextPath}/board/editf.do";
	}
	
</script>
<link rel="stylesheet" type="text/css" href="../css/css.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<table>
<tr>
<td>
	<div class="board_wrap">
		<div class="board_title">
			<strong>자유게시판</strong>
			<p>자유롭게 이야기를 공유해주세요.</p>
		</div>
		<div class="wrap">
			<div class="board_view">
			<div class="QNA_title" id="FB_Title">
				${testa.FB_Title }
			</div>
			<div class="info">
				<dl>
					<dt><input type="hidden" name = "FB_UQ">번호 ${FB_UQ}</dt>
					<dd>${testa.FB_UQ}</dd>
				</dl>
				<dl>
					<dt><input type="hidden" name = "UserID">글쓴이</dt>
					<dd></dd>
				</dl>
				<dl>
					<dt><input type="hidden" name = "FB_Date_Created">작성일</dt>
					<dd>${testa.FB_Date_Created}</dd>
				</dl>
				<dl>
					<dt><input type="hidden" name = "FB_View">조회수</dt>
					<dd>${testa.FB_View}</dd>
				</dl>
				
			</div>
			<div class="QNA_Contents" name="FB_Contents" type="text">
				${testa.FB_Contents}
			</div>
		</div>
		
		<c:if test="${User_ID == article.id}">
			<div class=bt_wrap>
				<input type="button" id="modi" value="수정" onClick="goToEditF()"/>
				<button type="delete" onclick="location.href='/board/deletef.do?FB_UQ=${testa.FB_UQ}'">삭제</button>
				 <input type="button" id="delete" value="취소" onClick="backToListF()"/>
			</div>
			</c:if>
			<c:if test="${User_ID != article.id}">
			<div class=bt_wrap>
				<button id="FB_Report" class="Report" onclick="javascript:btn()">신고</button>
				<input type="button" id="list" value="목록" onClick="backToListF()" />
			</div>
			</c:if>
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
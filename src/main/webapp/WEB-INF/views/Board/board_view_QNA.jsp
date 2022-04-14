<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
<script>
	function btn(){
		alert("신고가 접수되었습니다.");
	}
	
	function backToListq(){
		location.href="${contextPath}/board/qna.do"
	}
	
	function goToEditq(){
		location.href="${contextPath}/board/editq.do";
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
			<strong>질문게시판</strong>
			<p>질문을 남겨주세요.</p>
		</div>
		<div class="wrap">
			<div class="board_view">
			<div class="QNA_title" id="QNA_Title">
				${test.QNA_Title}
			</div>
			<div class="info">
				<dl>
					<dt><input type="hidden" name = "QNA_Unique_Number">번호 ${QNA_Unique_Number}</dt>
					<dd>${test.QNA_Unique_Number}</dd>
				</dl>
				<dl>
					<dt><input type="hidden" name = "UserID">글쓴이</dt>
					<dd></dd>
				</dl>
				<dl>
					<dt><input type="hidden" name = "QNA_Date_Created">작성일</dt>
					<dd>${test.QNA_Date_Created}</dd>
				</dl>
				<dl>
					<dt><input type="hidden" name = "QNA_Comment_Count">조회수</dt>
					<dd>${test.QNA_Comment_Count}</dd>
				</dl>
				
			</div>
			<div class="QNA_Contents" name="QNA_Contents" type="text">
				${test.QNA_Contents}
			</div>
		
		</div>
		<c:if test="${User_ID == article.id}">
			<div class=bt_wrap>
				<input type="button" id="modi" value="수정" onClick="goToEditq()"/>
				<button type="submit" onclick="location.href='/board/deleteq.do?QNA_Unique_Number=${test.QNA_Unique_Number}'">삭제</button>
				 <input type="button" id="delete" value="취소" onClick="backToListq()"/>
			</div>
			</c:if>
			<c:if test="${User_ID != article.id}">
			<div class=bt_wrap>
				<button id="QNA_Report" class="Report" onclick="javascript:btn()">신고</button>
				<input type="button" id="list" value="목록" onClick="backToListq()" />
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
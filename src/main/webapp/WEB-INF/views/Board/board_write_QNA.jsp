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
	function backToListq(){
		location.href="${contextPath}/board/qna.do";
	}
	function backToViewq(){
		location.href="${contextPath}/board/registerq.do";
	}
</script>
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<form method="post" action="${contextPath}/board/registerq.do">
<table>
<tr>
<td>
	<div class="board_wrap">
		<div class="board_title">
			<strong>질문게시판</strong>
			<p>질문을 남겨주세요.</p>
		</div>
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd><input type="text" name="QNA_Title" placeholder="제목 입력">${test.QNA_Title}</dd>
					</dl>
				</div>	
				
				<div class="info">
					<dl class="User_ID">
						<dt>글쓴이</dt>
						<dd><input type="text" name="User_ID" placeholder="글쓴이 입력"></dd>
					</dl>
				</div>	
				
				<div class="cont">
					<textarea type="text" name="QNA_Contents" placeholder="내용 입력">${test.QNA_Contents}</textarea>
				</div>
					
				
				
			</div>
			
			<div class=bt_wrap>
				<button type="submit">등록</button>
				<input type="button" id="delete" value="취소" onClick="backToListq()"/>
			</div>
		</div>
	</div>
	</td>
	</tr>
	</table>
</form>
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
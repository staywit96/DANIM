<%@ page language="java" session="true" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>



<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Login.css"/>


<div class="container">
<!-- 아래 한 줄 챗봇 코드 -->
<df-messenger intent="welcomeDanim" chat-title="DANIM" agent-id="93c4ca72-b1b0-4991-9b72-f89cc450a038" language-code="ko"></df-messenger>
        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기 화면입니다.</h1>
                                        <br><br><br>
                                    </div>
                                    <form class="user">
                                        <!-- 이름 -->
                                        <div class="form-group">
                                        <label>Name</label>
                                            <input type="text" class="form-control form-control-user" placeholder="이름을 입력해주세요"
                                                id="exampleInputEmail">
                                        </div>
                                        <!-- 핸드폰 번호 -->
                                        <div class="form-group">
                                        <label>Phone Number</label>
                                            <input type="text" class="form-control form-control-user" placeholder="핸드폰 번호를 입력해주세요"
                                                id="exampleInputEmail">
                                        </div>
                                        <!-- 이메일 -->
                                        <div class="form-group">
                                        <label>Email</label>
                                            <input type="email" class="form-control form-control-user" placeholder="이름을 입력해주세요"
                                                id="exampleInputEmail">
                                        </div>
                                        
                                        <a href="login.html" class="btn btn-primary btn-user btn-block">
                                            비밀번호 찾기
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath}/pages/Login">로그인 화면가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    
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
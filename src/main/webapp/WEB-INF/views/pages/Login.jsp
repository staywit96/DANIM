<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html5>

<html lang="ko">
<head>
<title>DANIM Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="${pageContext.request.contextPath}\js\Sign\jquery.min.js"></script>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/Login.css">

</head>




<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body 전체 몸통-->
                    <div class="row">
                    
                    <!-- 이미지 파일 위치는 css가서 고치기 -->
                        <div class="col-lg-6 d-none d-lg-block bg-login-image">
                        </div>
                        <div class="col-lg-6">
                        
                        
                            <div class="p-5">
                                <div class="text-center">
                                    <a href="\" class="h4 text-gray-900 mb-4">로그인</a>
                                </div>
                                
                                <form class="user" name="f1" method="post" id="f1">                              

                                <!-- ID 입력하기 -->
                                    <div class="form-group"><label>ID</label>
                                        <input type="text" id="userId" class="form-control form-control-user" name="userId"
                                        onKeyDown="if(event.keyCode == 13) loginChk()" style="text-indent:1px;"
                                        id="exampleInputEmail" aria-describedby="emailHelp">
                                    </div>
                                    
                                <!-- PW 입력하기 -->
                                    <div class="form-group"><label>PASSWORD</label>
                                        <input type="password" class="form-control form-control-user" name="password"
                                        maxlength="20" style="text-indent:1px;" onKeyDown="if(event.keyCode == 13) loginChk()"
                                            id="exampleInputPassword">
                                    </div>
                                <!-- 쿠키 남기기 -->
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" id="customCheck">
                                            <label class="custom-control-label" for="customCheck">기억하기</label>
                                        </div>
                                        
                                    <!-- ID PW 찾기 위치 -->
                                    <div class="text-center">
                                    		<a class="small" href="${pageContext.request.contextPath}/pages/Sign/FindId">아이디 찾기</a>
                                    		/
                                      <a class="small" href="${pageContext.request.contextPath}/pages/Sign/FindPw">비밀번호 찾기</a>
                               		</div>
                                		<!-- 회원가입 버튼 -->
                                    	<a class="small" href="${pageContext.request.contextPath}/pages/SignUp">회원가입</a>
                                    </div>
                                    
                                   
                               		<button type="button" class="btn btn-primary btn-user btn-block" onclick="loginChk()">로그인</button>

                                    <hr>
                                    
                                    <a href="/" class="btn btn-google btn-user btn-block">
                                        <i class="fab fa-google fa-fw"></i>Google 계정으로 시작하기
                                    </a>
                                    <a href="/" class="btn btn-facebook btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i>Facebook 계정으로 시작하기
                                    </a>
                                    <a href="/" class="btn btn-naver btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i> Naver 계정으로 시작하기
                                    </a>
                                    <a href="/" class="btn btn-kakao btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i> KaKao 계정으로 시작하기
                                    </a>
                                
                                </form>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
  <script>
    function loginChk() {
        var form = document.f1;
        if (!form.userId.value) {
            alert("아이디를 입력해 주십시오.");
            form.userId.focus();
            return;
        }
     
        if (!form.password.value) {
            alert("비밀번호를 입력해 주십시오.");
            form.password.focus();
            return;
        }

        
        var data=$("#f1").serialize();
        $.ajax({
            	url:"Login",
            	type:"post",
            	data:data,
            	success:function(res,status){
            		console.log(res);
            		alert(res);
            		if(res=="로그인에 성공하셨습니다."){
            			location.href="/";	
            		}
            	},
            	error:function(error){
            		console.log("에러");
            		console.log(error);
            		alert(error);
            	}
        });
           
        
        
    }
    </script>

    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<!--jquery.backtotop.js, mobilemenu.js JAVASCRIPTS --> 

<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>

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
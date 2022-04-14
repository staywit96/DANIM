<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html5>

<html lang="ko">
<head>
<title>DANIM 회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/Login.css">
<script src="${pageContext.request.contextPath}\js\Sign\jquery.min.js"></script>
</head>
<body>
<div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            
                            
                       
                            <!-- User_ID[아이디], User_PW[비밀번호], User_Name[이름], User_Mail[메일], User_PN[핸드폰 번호] , User_Nick[닉네임] script 짜놓은거 추가 예정 -->
                            
                            <form name="form" id="form" method="post"  onsubmit="return checkAll()">
                            	
                            	<!-- 아이디  -->
                                <div class="form-group">
                                <label>ID</label>
                                    <input type="text" name="userId" class="form-control form-control-user" id="exampleInputEmail" placeholder="아이디를 입력해주세요.">
                                </div>
                                
                                <div class="form-group row">
                               
                                <!-- 비밀번호 -->
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label>Password</label>
                                    <input type="password" name="password1" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호를 입력해주세요.">
                                </div>
                                <div class="col-sm-6">
                                    <label>Password 확인</label>
                                    <input type="password" name="password2" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호를 다시 입력해주세요.">
                                </div>
                                </div>
                                
                                <!-- 닉네임 name="identi1" -->
                                <div class="form-group">
                                <label>Nick Name</label>
                                    <input type="text"  name="nickname" class="form-control form-control-user" id="exampleInputEmail" placeholder="닉네임을 입력해주세요.">
                                </div>
                                
                                <!-- 이름 -->
                                <div class="form-group">
                                <label>Name</label>
                                    <input type="text"  name="name" class="form-control form-control-user" id="exampleInputEmail" placeholder="이름을 입력해주세요.">
                                </div>
                                
                                <!-- 메일 -->
                                <div class="form-group">
                                <label>Email</label>
                                    <input type="text" name="mail" class="form-control form-control-user" id="exampleInputEmail" placeholder="이메일을 입력해주세요.">
                                </div>
                                
                                <!-- 핸드폰 번호 name="identi2" <-응용해서 사용 -->
                                <div class="form-group">
                                <label>Phone Number</label>
                                    <input type="text"  name="phone" class="form-control form-control-user" id="exampleInputEmail" placeholder="핸드폰번호를 입력해주세요.">
                                </div>
                                <hr>
                                <input type="button" class="btn btn-primary btn-user btn-block"  name="join" value="회원 가입" onclick="checkAll()">
                                
                            </form>
                            
                            <div class="text-center">
                            <br>
                                <a class="small" href="${pageContext.request.contextPath}/pages/Sign/FindPw">비밀번호 찾기</a>
                            <br>
                                <a class="small" href="${pageContext.request.contextPath}/pages/Login">로그인하러 가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  
  <script language="javascript">
    function checkAll() {
    	
        if (!checkUserId(form.userId.value)) {
            return false;
        }
        if (!checkPassword(form.userId.value, form.password1.value,    form.password2.value)) {
            return false;
        }
        if (!checkMail(form.mail.value)) {
            return false;
        }
        if (!checkName(form.name.value)) {
            return false;
        }
        

        
        
        
        var data=$("#form").serialize();
        $.ajax({
            	url:"SignUp",
            	type:"post",
            	data:data,
            	success:function(res,status){
            		console.log(res);
            		if(status=="success"){
            		   if(res=="Duplicate"){
            			   alert("중복된 아이디 입니다.");
            		   }else if(res=="ok"){
            			   alert("회원 가입을 축하합니다.");
            			   location.href="/pages/Login";
            		   }	
            		}else{
            			alert("회원 가입에 실패 하였습니다.");
            		}            		
            	},
            	error:function(error){
            		console.log("에러");
            		console.log(error);
            		alert("회원 가입에 실패 하였습니다.");
            	}
        });
            
        return false;
        
    }
  
    // 공백확인 함수
    function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }
  
    function checkUserId(id) {
        //Id가 입력되었는지 확인하기
        if (!checkExistData(id, "아이디를"))
            return false;
  
        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해 주셔야 합니다!");
            form.userId.value = "";
            form.userId.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
  
    function checkPassword(id, password1, password2) {
        //비밀번호가 입력되었는지 확인하기
        if (!checkExistData(password1, "비밀번호를"))
            return false;
        //비밀번호 확인이 입력되었는지 확인하기
        if (!checkExistData(password2, "비밀번호 확인을"))
            return false;
  
        var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
        if (!password1RegExp.test(password1)) {
            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            form.password1.value = "";
            form.password1.focus();
            return false;
        }
        //비밀번호와 비밀번호 확인이 맞지 않다면..
        if (password1 != password2) {
            alert("두 비밀번호가 맞지 않습니다.");
            form.password1.value = "";
            form.password2.value = "";
            form.password2.focus();
            return false;
        }
  
        //아이디와 비밀번호가 같을 때..
        if (id == password1) {
            alert("아이디와 비밀번호는 같을 수 없습니다!");
            form.password1.value = "";
            form.password2.value = "";
            form.password2.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
  
    function checkMail(mail) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(mail, "이메일을"))
            return false;
  
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(mail)) {
            alert("이메일 형식이 올바르지 않습니다!");
            form.mail.value = "";
            form.mail.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
  
    function checkName(name) {
        if (!checkExistData(name, "이름을"))
            return false;
  
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(name)) {
            alert("이름이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    }
  
    
</script>

<!-- JAVASCRIPTS -->

<script src="${pageContext.request.contextPath}\js\Sign\jquery.backtotop.js"></script>
<script src="${pageContext.request.contextPath}\js\Sign\mobilemenu.js"></script>

<script>
$(function(){
	let msg='${msg}';
	if(msg.length>0){
		alert(msg);
	}
})
</script>

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
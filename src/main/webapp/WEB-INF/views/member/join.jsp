<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet" href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="resources/css/vertical-layout-light/style.css">
<link rel="shortcut icon" href="resources/images/favicon.png" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$("#emailCheck").on("click", function() {
			if(emailReg.exec($("#email").val())){
				$.ajax({
					type: "POST",
					url: "memberEmailCheck",
					data: {
						"email": $("#email").val()
						},
					success: function(res) {
						if(res == "true"){
							alert("사용 가능한 이메일 입니다!")
							$("#emailCheckValue").val("1");
						}else{
							alert("이미 사용중인 이메일 입니다!")
							$("#emailCheckValue").val("0");
						};
					}
				})
			}else{
				alert("이메일 형식을 확인해주세요!")
			}
		})

		$("#nameCheck").on("click", function() {
			if(emailReg.exec($("#name").val())){
				$.ajax({
					type: "POST",
					url: "memberNameCheck",
					data: {
						"name": $("#name").val()
						},
					success: function(res) {
						if(res == "true"){
							alert("사용 가능한 닉네임 입니다!")
							$("#nameCheckValue").val("1");
						}else{
							alert("이미 사용중인 닉네임 입니다!")
							$("#nameCheckValue").val("0");
						};
					}
				})
			}else{
				alert("닉네임 형식을 확인해주세요!")
			}
		})
		
		// 이메일 규칙
		let emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		$("#email").on("change", function() {
			if(!emailReg.exec($("#email").val())){
				$("#emailResult").html("이메일 형식을 확인해주세요! ex) XXX@email.com").css("color", "red");
			}else{
				$("#emailResult").html("사용 가능한 이메일 형식 입니다!").css("color", "blue");
			}
		})
		
		//비밀번호 규칙 (숫자, 영어 대소문자, 특수문자 (!, @, #, $, %) 4~16자리 사용 가능)
		let passwdReg = /^[a-zA-Z0-9!@#$%]{8,16}$/
		$("#password").on("change", function() {
			if(!passwdReg.exec($("#password").val())){
				$("#passwd1Result").html("비밀번호 형식을 확인해주세요. 영어, 숫자, 특수문자 (!, @, #, $, %) 8~16자리를 입력 가능").css("color", "red");
			}else{
				$("#passwd1Result").html("사용 가능한 비밀번호 형식 입니다!").css("color", "blue");
			}
		})
		
		// 비밀번호가 일치하는 지 확인
		$("#password2").on("change", function() {
			if(!passwdReg.exec($("#password2").val())){
				$("#passwd2Result").html("비밀번호 형식을 확인해주세요. 영어, 숫자, 특수문자 (!, @, #, $, %) 8~16자리를 입력 가능").css("color", "red");
			}else{
				if($("#password").val() != $("#password2").val()){
					$("#passwd2Result").html("비밀번호가 일치하지 않습니다!").css("color", "red");
				}else{
					$("#passwd2Result").html("비밀번호가 일치합니다!").css("color", "blue");
				}
			}
		})
		
		//닉네임 규칙
		let nameReg = /^[가-힣a-zA-Z0-9]{2,5}$/;
		$("#name").on("change", function() {
			if(!nameReg.exec($("#name").val())){
				$("#nameResult").html("닉네임 형식을 확인해주세요! 영어,한글,숫자 포함 2~5자 입력 가능!").css("color", "red");
			}else{
				$("#nameResult").html("사용 가능한 닉네임 형식 입니다!").css("color", "blue");
			}
		})
		
	});
	// 2023-04-27 김동욱 - 회원가입 정규표현식이 submit이 실행될 때 규칙이 맞는 지 한번 더 확인함
	function checkForm() {
		
		let emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if(!emailReg.exec($("#email").val())){
			alert("이메일을 확인해주세요!");
			return false;
		}
		
		let passwdReg = /^[a-zA-Z0-9!@#$%]{8,16}$/
		if(!passwdReg.exec($("#password").val())){
			alert("비밀번호 형식을 확인해주세요!");
			return false;
		}
		
		if($("#password").val() != $("#password2").val()){
			alert("비밀번호가 일치하는 지 확인해주세요!")
			return false;
		}
		
		let nameReg = /^[가-힣a-zA-Z0-9]{2,5}$/;
		if(!nameReg.exec($("#name").val())){
			alert("닉네임을 확인해주세요!")
			return false;
		}
		

		if($("#emailCheckValue").val() == ''){
			alert("이메일 중복체크 필수!")
			return false;
		}
		if($("#nameCheckValue").val() == ''){
			alert("닉네임 중복체크 필수!")
			return false;
		}
		if($("#emailCheckValue").val() == '0'){
			alert("이미 사용중인 이메일 입니다. 이메일 중복체크를 다시 실행해주세요!")
			return false;
		}
		if($("nameCheckValue").val() == '0'){
			alert("이미 사용중인 닉네임 입니다. 닉네임 중복체크를 다시 실행해주세요!")
		}
	}
	
</script>

</head>
<body>
	<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="resources/images/logo.svg" alt="logo">
              </div>
              <h4>환영합니다</h4>
              <h6 class="font-weight-light">사이트소개</h6>
              
              <form action='joinPro' class="pt-3" method="Post" onsubmit="return checkForm();">
              닉네임
                <div class="form-group" >
                  <br>
                  <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="닉네임" >
                  <br>
                  <button id="nameCheck" type="button" class="btn btn-primary btn-rounded btn-fw" >중복확인</button>
                  <div id="nameResult"></div>
                </div>
                이메일
                <div class="form-group">
				  <br>
                  <input type="email"  class="form-control form-control-lg" id="email" name="email" placeholder="example@google.com">
                  <br>
                  <button id="emailCheck" type="button" class="btn btn-primary btn-rounded btn-fw" >중복확인</button>
                </div>
                <div id="emailResult"></div>
                비밀번호
                <div class="form-group">
                	<br>
                  <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="영어, 숫자, 특수문자 (!, @, #, $, %) 8~16자리를 입력 가능">
                  <div id="passwd1Result"></div>
                </div>
                비밀번호 확인
               <div class="form-group">
               	 <br>
                 <input type="password" class="form-control form-control-lg" id="password2" placeholder="비밀번호 확인">
                 <div id="passwd2Result"></div>
               </div>
                <div class="mt-3">
                	<input type="hidden" value="" id="emailCheckValue">
                	<input type="hidden" value="" id="nameCheckValue">
                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="회원가입">
                </div>
                <div class="text-center mt-4 font-weight-light">
                  이미 회원이신가요? <a href="login" class="text-primary">로그인</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../resources/vendors/feather/feather.css">
<link rel="stylesheet" href="../resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="../resources/css/vertical-layout-light/style.css">
<link rel="shortcut icon" href="../resources/images/favicon.png" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function() {
	//비밀번호 규칙 (숫자, 영어 대소문자, 특수문자 (!, @, #, $, %) 4~16자리 사용 가능)
	let passwdReg = /^[a-zA-Z0-9!@#$%]{8,16}$/
	$("#new_password").on("change", function() {
		if(!passwdReg.exec($("#new_password").val())){
			$("#passwd1Result").html("비밀번호 형식을 확인해주세요. 영어, 숫자, 특수문자 (!, @, #, $, %) 8~16자리를 입력 가능").css("color", "red");
		}else{
			$("#passwd1Result").html("사용 가능한 비밀번호 형식 입니다!").css("color", "blue");
		}
	})
	
	// 비밀번호가 일치하는 지 확인
	$("#new_password_check").on("change", function() {
		if(!passwdReg.exec($("#new_password_check").val())){
			$("#passwd2Result").html("비밀번호 형식을 확인해주세요. 영어, 숫자, 특수문자 (!, @, #, $, %) 8~16자리를 입력 가능").css("color", "red");
		}else{
			if($("#new_password_check").val() != $("#new_password").val()){
				$("#passwd2Result").html("비밀번호가 일치하지 않습니다!").css("color", "red");
			}else{
				$("#passwd2Result").html("비밀번호가 일치합니다!").css("color", "blue");
			}
		}
	})
	
});
function checkForm(){
	let passwdReg = /^[a-zA-Z0-9!@#$%]{8,16}$/
		if(!passwdReg.exec($("#new_password").val())){
			alert("비밀번호 형식을 확인해주세요!");
			return false;
		}
		
		if($("#new_password_check").val() != $("#new_password").val()){
			alert("비밀번호가 일치하는 지 확인해주세요!")
			return false;
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
            <div class="auth-form-light text-left py-5 px-4 px-sm-6">
              <div class="brand-logo">
                <img src="../resources/images/logo.svg" alt="logo">
              </div>
              <h4>변경하실 비밀번호를 입력해주세요.</h4>
              
              <form action='password-changesPro' class="pt-3" method="Post" onsubmit="return checkForm();">
                <div class="form-group">
                	현재 비밀번호
                	<br><br>
                  <input type="password" class="form-control form-control-lg" id="password" name="password" >
                </div>
                <div class="form-group">
                	신규 비밀번호
                	<br><br>
                  <input type="password" class="form-control form-control-lg" id="new_password" name="new_password" placeholder="영어, 숫자, 특수문자 (!, @, #, $, %) 8~16자리를 입력 가능">
                  <div id="passwd1Result"></div>
                </div>
                
                <div class="form-group">
                	신규 비밀번호 확인
                	<br><br>
                  <input type="password" class="form-control form-control-lg" id="new_password_check" name="new_password_check" >
                   <div id="passwd2Result"></div>
                </div>
                <div class="mt-3">
                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="비밀번호 번경">
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
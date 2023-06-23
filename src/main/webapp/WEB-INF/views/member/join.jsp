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
              
              <form action='joinPro' class="pt-3" method="Post">
                <div class="form-group">
                	이름
                	<br><br>
                  <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="홍길동">
                </div>
                <div class="form-group">
                	이메일
                	<br><br>
                  <input type="email" class="form-control form-control-lg" id="email" name="email" placeholder="example@google.com">
                </div>
                <div class="form-group">
                	비밀번호
                	<br><br>
                  <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="최소 6자 이상(알파벳, 숫자 필수)">
                </div>
<!--                <div class="form-group"> -->
<!--                	비밀번호 확인 -->
<!--                	<br><br> -->
<!--                  <input type="password" class="form-control form-control-lg" id="password2" placeholder="비밀번호 확인"> -->
<!--                </div> -->
                <div class="mt-3">
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
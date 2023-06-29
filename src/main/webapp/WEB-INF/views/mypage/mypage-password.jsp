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
              
              <form action='password-changesPro' class="pt-3" method="Post">
                <div class="form-group">
                	현재 비밀번호
                	<br><br>
                  <input type="password" class="form-control form-control-lg" id="password" name="password" >
                </div>
                <div class="form-group">
                	신규 비밀번호
                	<br><br>
                  <input type="password" class="form-control form-control-lg" id="new_password" name="new_password" placeholder="최소 6자 이상(알파벳, 숫자 필수)">
                </div>
                <div class="form-group">
                	신규 비밀번호 확인
                	<br><br>
                  <input type="password" class="form-control form-control-lg" id="new_password_check" name="new_password_check" >
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
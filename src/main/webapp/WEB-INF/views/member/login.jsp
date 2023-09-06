<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인</title>
<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet" href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="resources/css/vertical-layout-light/style.css">
</head>
<body>
	<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="${pageContext.request.contextPath }/resources/images/logo.PNG" alt="logo">
              </div>
              <h4>환영합니다!</h4>
              <h6 class="font-weight-light">이메일로 로그인</h6>
              <form action="loginPro" method="Post" class="pt-3">
                <div class="form-group">
                	이메일
                  <input type="email" class="form-control form-control-lg" id="email" name="email" >
                </div>
                <div class="form-group">
                	비밀번호
                  <input type="password" class="form-control form-control-lg" id="password" name="password">
                </div>
                <div class="mt-3">
                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="로그인">
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" >
                      아이디 기억하기
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">계정찾기</a>
                </div>
                
                <div class="text-center mt-4 font-weight-light">
                  아직 회원이 아니신가요? <a href="join" class="text-primary">회원가입</a>
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
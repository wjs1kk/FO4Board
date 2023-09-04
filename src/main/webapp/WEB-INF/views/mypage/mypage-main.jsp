<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/vendors/feather/feather.css">
<link rel="stylesheet" href="../resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="../resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="../resources/css/vertical-layout-light/style.css">
<script type="text/javascript">
	function withDrawal() {
		result = window.confirm("정말로 탈퇴하시겠습니까?");
		if(result){
			let f = document.createElement('form');
			f.setAttribute('method', 'post');	
			f.setAttribute('action', 'withDrawal');
			document.body.appendChild(f);
			f.submit();
		}
	}
</script>
<!-- <script type="text/javascript"> -->
// $(function() {
// 	$("#emailCheck").on("click", function() {
// 		if(emailReg.exec($("#email").val())){
// 			$.ajax({
// 				type: "POST",
// 				url: "memberEmailCheck",
// 				data: {
// 					"email": $("#email").val()
// 					},
// 				success: function(res) {
// 					if(res == "true"){
// 						alert("사용 가능한 이메일 입니다!")
// 						$("#emailCheckValue").val("1");
// 					}else{
// 						alert("이미 사용중인 이메일 입니다!")
// 						$("#emailCheckValue").val("0");
// 					};
// 				}
// 			})
// 		}else{
// 			alert("이메일 형식을 확인해주세요!")
// 		}
// 	})

// 	$("#nameCheck").on("click", function() {
// 		if(emailReg.exec($("#name").val())){
// 			$.ajax({
// 				type: "POST",
// 				url: "memberNameCheck",
// 				data: {
// 					"name": $("#name").val()
// 					},
// 				success: function(res) {
// 					if(res == "true"){
// 						alert("사용 가능한 닉네임 입니다!")
// 						$("#nameCheckValue").val("1");
// 					}else{
// 						alert("이미 사용중인 닉네임 입니다!")
// 						$("#nameCheckValue").val("0");
// 					};
// 				}
// 			})
// 		}else{
// 			alert("닉네임 형식을 확인해주세요!")
// 		}
// 	})
<!-- </script> -->
</head>
<body>
	<div class="container-scroller">
    <!-- partial:../resources/partials/_navbar.html -->
    <!-- partial -->
    <jsp:include page="../inc/top.jsp" />
      <!-- partial -->
      <!-- partial:../resources/partials/_sidebar.html -->
      <jsp:include page="../inc/mypage-left-side.jsp" />
      <!-- partial -->
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">회원정보</h4>
                  <form action="updatePro" method="post" class="forms-sample">
                    <div class="form-group">
                      <label >이름</label>
                      <input id="name" name="name" type="text" class="form-control" id="exampleInputName1" placeholder="Name" value="${member.name }">
                    </div>
                    <div class="form-group">
                      <label >이메일</label>
                      <input id="email" name="email" type="email" class="form-control" id="exampleInputEmail3" placeholder="Email" value="${member.email }">
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">저장</button>
                    <button onclick="location.href='password-changes'" type="button" class="btn btn-danger btn-rounded btn-fw">비밀번호 변경</button>
                    <button onclick="withDrawal()" type="button" class="btn btn-outline-danger btn-fw float-right">회원 탈퇴</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../resources/partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <script src="../resources/vendors/js/vendor.bundle.base.js"></script>
  <script src="../resources/vendors/typeahead.js/typeahead.bundle.min.js"></script>
  <script src="../resources/js/hoverable-collapse.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/typeahead.js"></script>
  

</body>
</html>
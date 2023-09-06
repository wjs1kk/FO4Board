<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>
<link rel="stylesheet" href="../resources/vendors/feather/feather.css">
<link rel="stylesheet" href="../resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="../resources/css/vertical-layout-light/style.css">
<link rel="shortcut icon" href="../resources/images/favicon.png" />
<script type="text/javascript">
	function notice_delete(num) {
		result = window.confirm("게시물을 삭제 하시겠습니까?");
		if(result){
			let f = document.createElement('form');
			f.setAttribute('method', 'post');	
			f.setAttribute('action', 'deleteNoticePro?num='+num);
			document.body.appendChild(f);
			f.submit();
		}
	}
</script>
</head>
<body>
	<div class="container-scroller">
    <!-- partial:../resources/partials/_navbar.html -->
    <jsp:include page="../inc/top.jsp" />
      <!-- partial -->
      <!-- partial:../resources/partials/_sidebar.html -->
      <jsp:include page="../inc/left-side.jsp" />
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h2 >${noticeDetail.title }</h2> 
                    
                    <p class="card-description">
                      관리자 &#183; 
                      <fmt:parseDate value="${ noticeDetail.regdate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					  <fmt:formatDate pattern="MM.dd" value="${ parsedDateTime }" /> 
					  <c:if test="${noticeDetail.update_regdate ne null}">
					  	&#183; (수정됨)
					  </c:if>
                    </p>
                    <p>
                      ${noticeDetail.content }
                    </p>
                    <br>
                    <br>
<!--                     좋아요 기능 -->
					<c:if test="${sessionScope.member_idx=='0' }">
                    	<button onclick="notice_delete(${param.num})" type="button" class="btn btn-outline-dark btn-sm updatebtn">삭제</button>
	                    <button onclick="location.href='update?num=${param.num}'" type="button" class="btn btn-outline-dark btn-sm updatebtn">수정</button>
                    </c:if>
                   
                  </div>
                </div>
              </div>
             </div>

        <!-- content-wrapper ends -->
        <!-- partial:../resources/partials/_footer.html -->
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <script src="../resources/vendors/js/vendor.bundle.base.js"></script>
  <script src="../resources/js/off-canvas.js"></script>
  <script src="../resources/js/hoverable-collapse.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/settings.js"></script>
  <script src="../resources/js/todolist.js"></script>
</body>
</html>
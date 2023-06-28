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
<style type="text/css">
	#replybtn{
		 float: right;
		 margin-top: 10px;
	}
</style>
<style type="text/css">
	.updatebtn{
		 float: right;
		 margin-top: 10px;
	}
</style>
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
                    <h2 >${boardDetail.title }</h2>
                    <p class="card-description">
                      ${boardDetail.name } &#183; 
                      <fmt:parseDate value="${ boardDetail.regdate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					  <fmt:formatDate pattern="MM.dd" value="${ parsedDateTime }" /> &#183; ${boardDetail.viewcnt } 
					  <c:if test="${boardDetail.regdate != boardDetail.update_regdate }">
					  	&#183; (수정됨)
					  </c:if>
                    </p>
                    <p>
                      ${boardDetail.content }
                    </p>
                    <br>
                    <br>
                    <c:if test="${sessionScope.member_idx==boardDetail.member_idx }">
                    	<form action="deleteBoardPro?num=${param.num}" method="post">
                    		<button type="submit" class="btn btn-outline-dark btn-sm updatebtn">삭제</button>
                    	</form>
	                    <button onclick="location.href='update?num=${param.num}'" type="button" class="btn btn-outline-dark btn-sm updatebtn">수정</button>
                    </c:if>
                  </div>
                </div>
                
              </div>
              
              <div class="col-md-12 grid-margin stretch-card">
              <hr>
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">댓글 작성</h4>
                  <c:choose>
                  	<c:when test="${empty sessionScope.member_idx }">
	                  	<div class="form-group">
		                    <div class="form-control form-control-lg">댓글을 쓰려면 <a href="${pageContext.request.contextPath}/login">로그인</a>이 필요합니다.</div>
		                    <button id="replybtn" type="button" class="btn btn-primary btn-rounded btn-fw">작성하기</button>
		                </div>
                  	</c:when>
                  	<c:otherwise>
	                  	<form action="detail/replyPro?num=${param.num }" method="post">
	                  		<div class="form-group">
			                    <label>${member.name }님</label>
			                    <textarea id="re_content" name="re_content" class="form-control form-control-lg" placeholder="댓글 작성 하기" ></textarea>
			                    <button  id="replybtn" type="submit" class="btn btn-primary btn-rounded btn-fw">작성하기</button>
			                </div>
			            </form>
                  	</c:otherwise>
                  </c:choose>
                  <br>
<!--                   댓글 목록 -->
<!-- 				나중에 css 수정하기 -->
				  <c:forEach items="${replyList }" var="replyList">	
                  <hr>
                  <div class="card-body">
	                  <h4 class="card-title">${replyList.name }</h4>
	                  <p class="card-description">
	                    <fmt:parseDate value="${ replyList.re_regdate }" pattern="yyyy-MM-dd'T'HH:mm" var="re_parsedDateTime" type="both" />
					  	<fmt:formatDate pattern="YY년MM월dd일" value="${re_parsedDateTime }" />
	                  </p>
	                  <p class="lead">
	                      ${replyList.re_content }
	                  </p>
                  </div>
                  </c:forEach>
<!--                   댓글 목록 끝 -->
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
  <script src="../resources/js/off-canvas.js"></script>
  <script src="../resources/js/hoverable-collapse.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/settings.js"></script>
  <script src="../resources/js/todolist.js"></script>
</body>
</html>
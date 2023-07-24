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
<script type="text/javascript">
	function board_delete(num) {
		result = window.confirm("게시물을 삭제 하시겠습니까?");
		if(result){
			let f = document.createElement('form');
			f.setAttribute('method', 'post');	
			f.setAttribute('action', 'deleteBoardPro?num='+num);
			document.body.appendChild(f);
			f.submit();
		}
	}
</script>
<script type="text/javascript">

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
                    <h2 >${boardDetail.title }</h2> 
                    <p class="card-description">
                      ${boardDetail.name } &#183; 
                      <fmt:parseDate value="${ boardDetail.regdate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					  <fmt:formatDate pattern="MM.dd" value="${ parsedDateTime }" /> &#183; ${boardDetail.viewcnt } 
					  <c:if test="${boardDetail.update_regdate ne null}">
					  	&#183; (수정됨)
					  </c:if>
                    </p>
                    <p>
                      ${boardDetail.content }
                    </p>
                    <br>
                    <br>
<!--                     좋아요 기능 -->
					<c:choose>
						<c:when test="${not empty sessionScope.member_idx }">
							<c:choose>
								<c:when test="${heart eq null }">
									<a href='#'>
										<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-heart float-right" viewBox="0 0 16 16">
										  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
										</svg>
									</a>
								</c:when>
								<c:otherwise>
									<a href='#'>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
										</svg>
									</a>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
                    <c:if test="${sessionScope.member_idx==boardDetail.member_idx }">
                    	<button onclick='board_delete(${param.num})' type="button" class="btn btn-outline-dark btn-sm updatebtn">삭제</button>
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
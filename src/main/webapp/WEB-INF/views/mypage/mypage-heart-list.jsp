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
</head>
<body>
<div class="container-scroller">
    <!-- partial:../resources/partials/_navbar.html -->
    <jsp:include page="../inc/top.jsp" />
      <!-- partial -->
      <!-- partial:../resources/partials/_sidebar.html -->
      <jsp:include page="../inc/mypage-left-side.jsp" />
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">좋아요한 게시글</h4>

                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>작성일</th>
                          <th>댓글수</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${selectHeartList }" var="selectHeartList">
                        <tr>
                          <td>
                            <a href="detail?num=${selectHeartList.board_idx }">${selectHeartList.title }</a>
                          </td>
                          <td>
                            ${selectHeartList.name }
                          </td>
                          <td>
                          	<fmt:parseDate value="${ selectHeartList.regdate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
						  	<fmt:formatDate pattern="yy.MM.dd" value="${ parsedDateTime }" />
                          </td>
                          <td>
                           ${selectHeartList.re_count }
                          </td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="heart?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="heart?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="heart?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
                </div>
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
  <!-- container-scroller -->
  <script src="../resources/vendors/js/vendor.bundle.base.js"></script>
  <script src="../resources/js/off-canvas.js"></script>
  <script src="../resources/js/hoverable-collapse.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/settings.js"></script>
  <script src="../resources/js/todolist.js"></script>
</body>
</html>
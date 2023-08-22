<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지사항</title>
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
      <jsp:include page="../inc/left-side.jsp" />
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">공지사항</h4>
                  
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>작성일</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${noticeList }" var="noticeList">
                        <tr>
                          <td>
                            <a href="detail?num=${noticeList.notice_idx }">${noticeList.title }</a>
                          </td>
                          <td>
                             관리자
                          </td>
                          <td>
                          	<fmt:parseDate value="${ noticeList.regdate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
						  	<fmt:formatDate pattern="yy.MM.dd" value="${ parsedDateTime }" />
                          </td>
                          
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
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
  <!-- container-scroller -->
  <script src="../resources/vendors/js/vendor.bundle.base.js"></script>
  <script src="../resources/js/off-canvas.js"></script>
  <script src="../resources/js/hoverable-collapse.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/settings.js"></script>
  <script src="../resources/js/todolist.js"></script>
</body>
</html>
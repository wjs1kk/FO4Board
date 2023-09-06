<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="../resources/admin-css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
    <jsp:include page="top.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="side.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">${user.name }의 게시물</h1>
                    <ol class="breadcrumb mb-4">
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>작성자</th>
                                        <th>제목</th>
                                        <th>수정여부</th>
                                        <th>좋아요</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${memberWriteList }" var="memberWriteList">
                                	<tr>
                                        <td>${memberWriteList.board_idx }</td>
                                        <td>${user.name }</td>
                                        <td><a href="${pageContext.request.contextPath }/board/detail?num=${memberWriteList.board_idx}">${memberWriteList.title }</a></td>
                                        <c:if test="${memberWriteList.update_regdate ne null}">
										  	<td>O</td>
										</c:if>
										<c:if test="${memberWriteList.update_regdate eq null}">
										  	<td>x</td>
										</c:if>
                                        <td>${memberWriteList.heartcnt }</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../resources/admin-js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../resources/admin-assets/demo/chart-area-demo.js"></script>
    <script src="../resources/admin-assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="../resources/admin-js/datatables-simple-demo.js"></script>
</body>
</html>
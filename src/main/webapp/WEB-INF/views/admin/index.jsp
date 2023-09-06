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
<script type="text/javascript">
	function memberDelete(num) {
		result = window.confirm("정말로 삭제하시겠습니까?");
		if(result){
			let f = document.createElement('form');
			f.setAttribute('method', 'post');	
			f.setAttribute('action', 'memberDeletePro?num='+num);
			document.body.appendChild(f);
			f.submit();
		}
	}
</script>
</head>
<body class="sb-nav-fixed">
    <jsp:include page="top.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="side.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">회원목록</h1>
                    <ol class="breadcrumb mb-4">
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>이메일</th>
                                        <th>가입일</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${user }" var="user">
                                	<tr>
                                        <td>${user.member_idx }</td>
                                        <td><a href="userwrite?num=${user.member_idx }">${user.name }</a></td>
                                        <td>${user.email }</td>
                                        <td>${user.registration_date }</td>
                                        <td>
	                                        <button onclick="location.href='memberUpdate?num=${user.member_idx}'" type="button" class="btn btn-success">수정</button>
	                                        <button type="button" class="btn btn-danger" onclick="memberDelete(${user.member_idx})">삭제</button>
                                        </td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메인</title>
<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet" href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" type="text/css" href="resources/js/select.dataTables.min.css">
<link rel="stylesheet" href="resources/css/vertical-layout-light/style.css">
<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>

<!-- todolist 비동기식 추가 -->
<script type="text/javascript">
$(function() {
	$('#addTodo').click(function(){
		$.ajax({
			type : "post",
			url : "insertTodo",
			data : {
				title: $("#title").val()
			},
			success : function(data) {
				if (data.result == "ok") {
					// 리스트 업데이트하는 getTodoList()를 실행시킨다.
					getTodoList();
				}
			},
			error : function(){
	               alert("로그인이 필요한 기능입니다.");
	               location.reload();
	           }
		});
	});	
});

function getTodoList(){
	var formData = new FormData();
	$.ajax({
		type : "get",
		url : "./",
			dataType : "text",
			data : formData, 
			contentType: false, 
			processData: false, 
			cache : false,
			success : function(data) {
//            		 받아온 데이터로 새로 뿌려주기
				var html = jQuery('<div>').html(data);
				var todo = html.find("div#todoList").html();
// 				입력창 비우기
				$('#title').val('');
				$("#todoList").html(todo);
				
			},
			error : function(){
                alert("통신실패");
            }
		});
	}
</script>

<script type="text/javascript">
	function deletTodo(todo_idx) {
	  var ans = confirm("삭제하시겠습니까?")
	  if(ans){
		  var query = {"todo_idx" : todo_idx};
		  $.ajax({
			 url: "deleteTodo",
			 type : "post",
			 data : query,
			 success : function(data){
				 location.reload();
			 }
		  });
	  }
	}
</script>
<script type="text/javascript">
	function checkTodo(todo_idx) {
	  var query = {"todo_idx" : todo_idx};
	  $.ajax({
		 url: "checkTodo",
		 type : "get",
		 data : query,
		 success : function(data){
			 location.reload();
		 }
	  });
	}
	function uncheckedTodo(todo_idx) {
		  var query = {"todo_idx" : todo_idx};
		  $.ajax({
			 url: "uncheckedTodo",
			 type : "get",
			 data : query,
			 success : function(data){
				 location.reload();
			 }
		  });
		}
</script>
<!--todoList x 아이콘 css -->
<style type="text/css">
	#deleteTodo{
	    cursor: pointer;
	    font-size: .7rem;
	    font-weight: 600;
	    width: 1.25rem;
	    height: 1.25rem;
	    line-height: 1.25rem;
	    text-align: center;
	    color: #a3a4a5 !important;
	    margin-left: auto !important;
	}
</style>
</head>
<body>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <jsp:include page="inc/top.jsp" />
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <jsp:include page="inc/left-side.jsp" />
      <!-- partial -->
      <div  class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <h3 class="font-weight-bold ">Welcome Aamir</h3>
                  <h6 class="font-weight-normal mb-0">All systems are running smoothly! You have <span class="text-primary">3 unread alerts!</span></h6>
                </div>
                <div class="col-12 col-xl-4">
                 <div class="justify-content-end d-flex">
                  <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                    <span class=" btn-sm btn-light bg-white "  id="dropdownMenuDate2">
                     <i class="mdi mdi-calendar"></i> Today ${today }(${dayOfWeek })
                    </span>
                  </div>
                 </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title mb-0">주간 Best</p>
                  <div class="table-responsive">
                    <table class="table table-striped table-borderless">
                      <thead>
                        <tr>
                          <th>제목</th>
                          <th>글쓴이</th>
                          <th>Date</th>
                          
                        </tr>  
                      </thead>
                      <tbody>
                        <tr>
                          <td>Search Engine Marketing</td>
                          <td class="font-weight-bold">$362</td>
                          <td>21 Sep 2018</td>
                        </tr>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p onclick="location.href='board/main'" class="card-title mb-0 " style="cursor: pointer;">커뮤니티</p>
                  <div class="table-responsive">
                    <table class="table table-striped table-borderless">
                      <thead>
                        <tr>
                          <th>제목</th>
                          <th>글쓴이</th>
                          <th>작성일</th>
                          
                        </tr>  
                      </thead>
                      <tbody>
                      <c:forEach items="${boardList }" var="boardList">
                      	<tr>
                          <td><a href='board/detail?num=${boardList.board_idx }'>${boardList.title }</a></td>
                          <td class="font-weight-bold">${boardList.name }</td>
                          <td>
							<fmt:parseDate value="${ boardList.regdate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
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
<!--           todolist -->
         <div id="todoListcard" class="card">
			<div class="card-body">
				<h4 class="card-title">To Do Lists</h4>
				<div id="todoList" class="list-wrapper pt-2">
					<ul class="d-flex flex-column-reverse todo-list todo-list-custom">
						<c:forEach items="${todoList }" var="todoList">
							
								<c:if test="${todoList.completed eq '0' }">
									<li>
										<div class="form-check form-check-flat" >
											<label class="form-check-label">
												<input class="checkbox" type="checkbox" onclick="checkTodo(${todoList.todo_idx })">
												${todoList.title }
											<i class="input-helper"></i></label>
										</div>
										<span id="deleteTodo" onclick="deletTodo(${todoList.todo_idx})" class="ti-close" ></span>
									</li>
								</c:if>
								<c:if test="${todoList.completed eq '1' }">
									<li class="completed">
										<div class="form-check form-check-flat" > 
											<label class="form-check-label">
												<input class="checkbox" type="checkbox" checked="checked" onclick="uncheckedTodo(${todoList.todo_idx })">
												${todoList.title }
											<i class="input-helper"></i></label>
										</div>
										<span id="deleteTodo" onclick="deletTodo(${todoList.todo_idx})" class="ti-close" ></span>
									</li>
								</c:if>
								
						</c:forEach>						
					</ul>
                  </div>
                 <div class="add-items d-flex mb-0 mt-2">
				<input id="title" type="text"  placeholder="Add new task">
				<button id="addTodo" class="add btn btn-icon text-primary todo-list-add-btn bg-transparent"><i class="icon-circle-plus"></i></button>
			  </div>
			</div>
		</div>
 
                  <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright Â© 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed by <a href="https://www.themewagon.com/" target="_blank">Themewagon</a></span> 
          </div>
        </footer> 
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>   
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="resources/vendors/js/vendor.bundle.base.js"></script>
  <script src="resources/vendors/chart.js/Chart.min.js"></script>
  <script src="resources/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="resources/js/dataTables.select.min.js"></script>
  <script src="resources/js/off-canvas.js"></script>
  <script src="resources/js/hoverable-collapse.js"></script>
  <script src="resources/js/template.js"></script>
  <script src="resources/js/settings.js"></script>
  <script src="resources/js/todolist.js"></script>
  <script src="resources/js/dashboard.js"></script>
  <script src="resources/js/Chart.roundedBarCharts.js"></script>
</body>
</html>
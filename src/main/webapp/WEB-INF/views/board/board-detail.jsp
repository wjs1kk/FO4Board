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
	function addHeart(board_idx) {
		let member_idx = '<%=(Integer)session.getAttribute("member_idx")%>';
		if(member_idx == "null"){
			alert("로그인이 필요한 기능입니다.");
			location.href='${pageContext.request.contextPath}/login';
		}
		else{
			var form={
					member_idx:member_idx,
					board_idx:board_idx
			};
			$.ajax({
                type : "POST",
                url : "addHeart",
                cache : false,
                contentType : 'application/json; charset=utf-8',
                data : JSON.stringify(form),
                success : function(result) {
//                 	alert("찜하기러기 끼룩끼룩~");
                	location.reload();                	
                },
                error : function(e) {
                    console.log(e);
                    alert('찜할 수 없지렁이 꿈틀꿈틀~');
                    location.reload(); 
                }
            })
		}
			
	}
</script>
<script type="text/javascript">
function cancelHeart(board_idx) {
	let member_idx = '<%=(Integer)session.getAttribute("member_idx")%>';
	var form = {
			board_idx:board_idx,
			member_idx:member_idx
	};
	$.ajax({
        type : 'post', 
        url : "cancelHeart", 
        cache : false, 
        processData: false, 
        contentType : 'application/json; charset=utf-8', 
        data: JSON.stringify(form), 
        success: function(result) {
        	location.reload();
//             alert('해당 상품을 찜 취소 하셨습니다.');
        },
        error : function(e) {
            alert('찜 취소 할 수 없습니다.');
            location.reload(); // 실패시 새로고침하기
        }
    });
	
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
                    <h2 >${boardDetail.title }</h2> 
                    <c:choose>
						<c:when test="${not empty sessionScope.member_idx }">
							<c:choose>
								<c:when test="${heart eq null }">
									<a onclick='addHeart(${param.num})'>
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart float-right" viewBox="0 0 16 16" style="cursor : pointer;">
										  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
										</svg>
									</a>
								</c:when>
								<c:otherwise>
									<a onclick='cancelHeart(${param.num})'>
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart-fill float-right" viewBox="0 0 16 16" style=" cursor : pointer;">
										  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
										</svg>
									</a>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
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
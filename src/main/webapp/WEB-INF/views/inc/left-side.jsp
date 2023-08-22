<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function mypage() {
		location.href="${pageContext.request.contextPath }/mypage/main";
	}
</script>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath }/">
        <i class="icon-grid menu-icon"></i>
        <span class="menu-title">메인</span>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath }/board/main">
        <i class="icon-grid menu-icon"></i>
        <span class="menu-title">커뮤니티</span>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath }/notice/main">
        <i class="icon-grid menu-icon"></i>
        <span class="menu-title">공지사항</span>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" onclick="mypage()">
        <i class="icon-grid menu-icon"></i>
        <span class="menu-title">마이페이지</span>
      </a>
    </li>          
  </ul>
</nav>
<!-- partial -->

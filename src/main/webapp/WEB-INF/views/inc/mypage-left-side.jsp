<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#title{
		font-size: x-large;
		margin-bottom: 30px;
		font-weight: bolder;
	}
</style>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li id="title" class="nav-item">
      내 계정
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath }/mypage/main">
        <i class="icon-head menu-icon"></i>
        <span class="menu-title">회원정보</span>
      </a>
    </li>
  </ul>
</nav>
<!-- partial -->
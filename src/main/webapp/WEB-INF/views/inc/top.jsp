<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
   <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
     <a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath }/resources/images/logo.PNG" class="mr-2" alt="logo"/></a>
     <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath }/resources/images/logo-mini.svg" alt="logo"/></a>
   </div>
   <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
     <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
       <span class="icon-menu"></span>
     </button>
     
     
<!--         로그인 유무에따른 화면 -->
     <c:choose>
     	<c:when test="${empty sessionScope.member_idx }">
     		<div class="navbar-nav navbar-nav-right">
         <a href="${pageContext.request.contextPath}/login" class="nav-item text-dark">로그인</a>
         <a href="${pageContext.request.contextPath}/join" class="nav-item text-dark">회원가입</a>
       </div>
     	</c:when>
     	<c:when test="${sessionScope.member_idx == 0 }">
	     	<div class="navbar-nav navbar-nav-right">
	         <a href="${pageContext.request.contextPath}/admin/main" class="nav-item text-dark">관리자페이지</a>  
	         <a href="${pageContext.request.contextPath}/logout" class="nav-item text-dark">로그아웃</a>
	        </div>
     	</c:when>
     	<c:otherwise>
	     	<div class="navbar-nav navbar-nav-right">
	     	 <a href="${pageContext.request.contextPath}/mypage/main" class="nav-item text-dark">${sessionScope.member_name }님 환영합니다</a>  
	         <a href="${pageContext.request.contextPath}/logout" class="nav-item text-dark">로그아웃</a>
	        </div>
     	</c:otherwise>
      </c:choose>
      
      
     <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
       <span class="icon-menu"></span>
     </button>
   </div>
 </nav>
 <!-- partial -->
 <div class="container-fluid page-body-wrapper">
   <!-- partial:partials/_settings-panel.html -->
   <div class="theme-setting-wrapper">
     <div id="settings-trigger"><i class="ti-settings"></i></div>
     <div id="theme-settings" class="settings-panel">
       <i class="settings-close ti-close"></i>
       <p class="settings-heading">SIDEBAR SKINS</p>
       <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
       <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
       <p class="settings-heading mt-2">HEADER SKINS</p>
       <div class="color-tiles mx-0 px-4">
         <div class="tiles success"></div>
         <div class="tiles warning"></div>
         <div class="tiles danger"></div>
         <div class="tiles info"></div>
         <div class="tiles dark"></div>
         <div class="tiles default"></div>
       </div>
     </div>
   </div>
   <div id="right-sidebar" class="settings-panel">
     <i class="settings-close ti-close"></i>
     <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
       <li class="nav-item">
         <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
       </li>
       
     </ul>
     <div class="tab-content" id="setting-content">
       <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
         <div class="add-items d-flex px-3 mb-0">
           <form class="form w-100">
             <div class="form-group d-flex">
               <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
               <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
             </div>
           </form>
         </div>
         <div class="list-wrapper px-3">
           <ul class="d-flex flex-column-reverse todo-list">
             <li>
               <div class="form-check">
                 <label class="form-check-label">
                   <input class="checkbox" type="checkbox">
                   Team review meeting at 3.00 PM
                 </label>
               </div>
               <i class="remove ti-close"></i>
             </li>
             <li>
               <div class="form-check">
                 <label class="form-check-label">
                   <input class="checkbox" type="checkbox">
                   Prepare for presentation
                 </label>
               </div>
               <i class="remove ti-close"></i>
             </li>
             <li>
               <div class="form-check">
                 <label class="form-check-label">
                   <input class="checkbox" type="checkbox">
                   Resolve all the low priority tickets due today
                 </label>
               </div>
               <i class="remove ti-close"></i>
             </li>
             <li class="completed">
               <div class="form-check">
                 <label class="form-check-label">
                   <input class="checkbox" type="checkbox" checked>
                   Schedule meeting for next week
                 </label>
               </div>
               <i class="remove ti-close"></i>
             </li>
             <li class="completed">
               <div class="form-check">
                 <label class="form-check-label">
                   <input class="checkbox" type="checkbox" checked>
                   Project review
                 </label>
               </div>
               <i class="remove ti-close"></i>
             </li>
           </ul>
         </div>
         <h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
         <div class="events pt-4 px-3">
           <div class="wrapper d-flex mb-2">
             <i class="ti-control-record text-primary mr-2"></i>
             <span>Feb 11 2018</span>
           </div>
           <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
           <p class="text-gray mb-0">The total number of sessions</p>
         </div>
         <div class="events pt-4 px-3">
           <div class="wrapper d-flex mb-2">
             <i class="ti-control-record text-primary mr-2"></i>
             <span>Feb 7 2018</span>
           </div>
           <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
           <p class="text-gray mb-0 ">Call Sarah Graves</p>
         </div>
       </div>
       <!-- To do section tab ends -->
       
       <!-- chat tab ends -->
     </div>
   </div>


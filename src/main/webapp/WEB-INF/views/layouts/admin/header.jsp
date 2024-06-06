<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<!-- Sidebar -->
	<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
    <div class="position-sticky">
        <div class="list-group list-group-flush mx-3 mt-4">
            <a href="#" id="dashboardLink"
                class="list-group-item list-group-item-action py-2 ${pageContext.request.servletPath == '/' ? 'active' : ''}"
                data-mdb-ripple-init aria-current="true">
                <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Bảng tin</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/post" id="postLink"
                class="list-group-item list-group-item-action py-2  ${pageContext.request.servletPath == '/admin/post' ? 'active' : ''}"
                data-mdb-ripple-init>
                <i class="fas fa-chart-area fa-fw me-3"></i><span>Bài viết</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/category" id="categoryLink"
                class="list-group-item list-group-item-action py-2 ${pageContext.request.servletPath == '/admin/category' ? 'active' : ''}"
                data-mdb-ripple-init>
                <i class="fas fa-lock fa-fw me-3"></i><span>Chuyên mục</span>
            </a>
            <a href="#" id="feedbackLink"
                class="list-group-item list-group-item-action py-2 ${pageContext.request.servletPath == '/feedback' ? 'active' : ''}"
                data-mdb-ripple-init>
                <i class="fas fa-calendar fa-fw me-3"></i><span>Phản hồi</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/user" id="usersLink"
                class="list-group-item list-group-item-action py-2 ${pageContext.request.servletPath == '/admin/user' ? 'active' : ''}"
                data-mdb-ripple-init>
                <i class="fas fa-users fa-fw me-3"></i><span>Tác giả</span>
            </a>
        </div>
    </div>
</nav>
	<!-- Sidebar -->

	<!-- Navbar -->
	<nav id="main-navbar"
		class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button" data-mdb-collapse-init
				data-mdb-target="#sidebarMenu" aria-controls="sidebarMenu"
				aria-expanded="false" aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Brand -->
			<a class="navbar-brand me-2 mb-1 d-flex align-items-center"
				href="${pageContext.request.contextPath}/admin"> <img
				src="${pageContext.request.contextPath}/resources/img/ptsharing-removebg-preview.png"
				height="30" alt="MDB Logo" loading="lazy" style="margin-top: 2px;" />
			</a>
			<!-- Search form -->
			<form class="d-none d-md-flex input-group w-auto my-auto">
				<input autocomplete="off" type="search" class="form-control rounded"
					placeholder='Search (ctrl + "/" to focus)' style="min-width: 225px" />
				<span class="input-group-text border-0"><i
					class="fas fa-search"></i></span>
			</form>

			<!-- Right links -->
			<ul class="navbar-nav ms-auto d-flex flex-row">
				<!-- Notification dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow" href="#"
					id="navbarDropdownMenuLink" role="button" data-mdb-dropdown-init
					aria-expanded="false"> <i class="fas fa-bell"></i> <span
						class="badge rounded-pill badge-notification bg-danger">1</span>
				</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">Some news</a></li>
						<li><a class="dropdown-item" href="#">Another news</a></li>
						<li><a class="dropdown-item" href="#">Something else</a></li>
					</ul></li>



				<!-- Avatar -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center"
					href="#" id="navbarDropdownMenuLink" role="button"
					data-mdb-dropdown-init aria-expanded="false"> <img
						src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
						class="rounded-circle" height="22" alt="" loading="lazy" />
				</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">My profile</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Logout</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- Container wrapper -->
	</nav>
</header>
<!--Main Navigation-->

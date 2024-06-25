<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- Start your project here-->
<header>
	<!-- Navbar-->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-body-tertiary fixed-top">
		<div class="container-fluid justify-content-between">
			<!-- Left elements -->
			<div class="d-flex">
				<!-- Brand -->
				<a class="navbar-brand me-2 mb-1 d-flex align-items-center"
					href="${pageContext.request.contextPath}/home"> <img
					src="${pageContext.request.contextPath}/resources/avatar/icont.png"
					height="30" alt="MDB Logo" loading="lazy" style="margin-top: 2px;" />
				</a>


			</div>
			<!-- Left elements -->
			<!-- Center elements -->
			<ul class="navbar-nav flex-row d-none d-md-flex">
				<!-- Search form -->
				<c:if test="${empty pageContext.request.userPrincipal}">
					<div class="d-flex align-items-center">
						<button id="loginButton" data-mdb-ripple-init type="button"
							class="btn btn-link px-3 me-2"
							onclick="window.location.href='${pageContext.request.contextPath}/login'">Đăng
							nhập</button>
						<button id="registerButton" data-mdb-ripple-init type="button"
							class="btn btn-primary me-3"
							onclick="window.location.href='${pageContext.request.contextPath}/register'">Đăng
							ký</button>
					</div>
				</c:if>
				<c:if test="${not empty pageContext.request.userPrincipal}">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<div>
							<a href="<c:url value="/admin/post"/>"
								class="d-flex align-items-center">
								<button id="adminButton" data-mdb-ripple-init type="button"
									class="btn btn-link px-3 me-2">ADMIN PAGE</button>
							</a>
						</div>
					</sec:authorize>
					<li class="nav-item me-3 me-lg-1"><a class="nav-link"
						href="uploadImage"> <span><i
								class="fas fa-plus-circle fa-lg"></i></span>
					</a></li>
					<li class="nav-item dropdown me-3 me-lg-1"><a
						data-mdb-dropdown-init
						class="nav-link dropdown-toggle hidden-arrow" href="#"
						id="navbarDropdownMenuLink" role="button" aria-expanded="false">
							<i class="fas fa-comments fa-lg"></i> <span
							class="badge rounded-pill badge-notification bg-danger">6</span>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="#">Some news</a></li>
							<li><a class="dropdown-item" href="#">Another news</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item dropdown me-3 me-lg-1"><a
						data-mdb-dropdown-init
						class="nav-link dropdown-toggle hidden-arrow" href="#"
						id="navbarDropdownMenuLink" role="button" aria-expanded="false">
							<i class="fas fa-bell fa-lg"></i> <span
							class="badge rounded-pill badge-notification bg-danger">12</span>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="#">Some news</a></li>
							<li><a class="dropdown-item" href="#">Another news</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item dropdown me-3 me-lg-1"><a
						data-mdb-dropdown-init
						class="nav-link dropdown-toggle hidden-arrow" href="#"
						id="navbarDropdownMenuLink" role="button" aria-expanded="false">
							<i class="fas fa-chevron-circle-down fa-lg"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuLink">
							<li class="nav-item me-3 me-lg-1"><a
								class="nav-link d-sm-flex align-items-sm-center" href="#"> <img
									src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
									class="rounded-circle" height="22"
									alt="Black and White Portrait of a Man" loading="lazy" /> <strong
									class="d-none d-sm-block ms-1">${pageContext.request.userPrincipal.name}</strong>
							</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/editprofile">Thông
									tin</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/repass">Đổi mật
									khẩu</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
						</ul></li>
				</c:if>
			</ul>

			<!-- Right elements -->
		</div>
	</nav>


	<!-- Navbar -->
	<script type="text/javascript"
		src="<c:url value="/resources/js/mdb.umd.min.js" /> " /></script>
</header>
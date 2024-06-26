<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header>

	<!-- Sidebar -->
	<nav id="sidebarMenu"
		class="collapse d-lg-block sidebar collapse bg-white">
		<div class="position-sticky">
			<div class="list-group list-group-flush mx-3 mt-4">
				<a href="#" id="dashboardLink"
					class="list-group-item list-group-item-action py-2 ${pageContext.request.servletPath == '/' ? 'active' : ''}"
					data-mdb-ripple-init aria-current="true"> <i
					class="fas fa-tachometer-alt fa-fw me-3"></i><span><spring:message code="bt"/></span>
				</a> <a href="${pageContext.request.contextPath}/admin/post"
					id="postLink"
					class="list-group-item list-group-item-action py-2  ${pageContext.request.servletPath == '/admin/post' ? 'active' : ''}"
					data-mdb-ripple-init> <i class="fas fa-chart-area fa-fw me-3"></i><span><spring:message code="bv"/></span>
				</a> <a href="${pageContext.request.contextPath}/admin/cate"
					id="categoryLink"
					class="list-group-item list-group-item-action py-2 ${pageContext.request.servletPath == '/admin/cate' ? 'active' : ''}"
					data-mdb-ripple-init> <i class="fas fa-lock fa-fw me-3"></i><span><spring:message code="cm"/></span>
				</a> <a href="${pageContext.request.contextPath}/admin/feedback"
					id="feedbackLink"
					class="list-group-item list-group-item-action py-2 ${pageContext.request.servletPath == '/admin/feedback' ? 'active' : ''}"
					data-mdb-ripple-init> <i class="fas fa-calendar fa-fw me-3"></i><span><spring:message code="ph"/></span>
				</a> <a href="${pageContext.request.contextPath}/admin/user"
					id="usersLink"
					class="list-group-item list-group-item-action py-2 ${pageContext.request.servletPath == '/admin/user' ? 'active' : ''}"
					data-mdb-ripple-init> <i class="fas fa-users fa-fw me-3"></i><span><spring:message code="td"/></span>
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
				href="${pageContext.request.contextPath}/admin/post"> <img
				src="${pageContext.request.contextPath}/resources/avatar/icont.png"
				height="30" alt="MDB Logo" loading="lazy" style="margin-top: 2px;" />
			</a>
			<h3><spring:message code="tqt"/></h3>
			<!-- Right links -->
			<ul class="navbar-nav flex-row d-none d-md-flex">
				<!-- Search form -->
				<c:if test="${not empty pageContext.request.userPrincipal}">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<div>
							<a href="<c:url value="/home"/>"
								class="d-flex align-items-center">
								<button id="adminButton" data-mdb-ripple-init type="button"
									class="btn btn-link px-3 me-2">USER PAGE</button>
							</a>
						</div>
					</sec:authorize>
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
									src="${pageContext.request.contextPath}/${user.avatar}"
									class="rounded-circle" height="22"
									alt="Black and White Portrait of a Man" loading="lazy" /> <strong
									class="d-none d-sm-block ms-1">${user.username}</strong>
							</a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/editprofile"><spring:message code="myprofile"/></a></li>
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/logout"><spring:message code="logout"/></a></li>
						</ul></li>
				</c:if>
			</ul>
		</div>
		<!-- Container wrapper -->
	</nav>
</header>
<!--Main Navigation-->

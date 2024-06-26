<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<base href="http://localhost:8080/PhotoSharingWeb/" />

<!-- Start your project here -->
<header>
	<!-- Navbar -->
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
				<button id="registerButton" data-mdb-ripple-init type="button"
							class="btn btn-primary me-3"
							onclick="window.location.href='${pageContext.request.contextPath}/searchquery'">Tìm kiếm nhanh</button>
			</div>
			<!-- Left elements -->

			<!-- Center elements -->
			<ul class="navbar-nav flex-row d-none d-md-flex">
				<!-- Thêm vào phần Search form -->
				<form id="searchForm"
					action="${pageContext.request.contextPath}/searchResults"
					method="GET" class="position-relative">
					<div class="input-group rounded">
						<input type="search" id="search_name" name="query"
							class="form-control rounded" placeholder="Search"
							aria-label="Search" aria-describedby="search-addon" /> <span
							class="input-group-text border-0" id="search-addon">
							<button type="submit" id="searchIcon"
								class="input-group-text border-0">
								<i class="fas fa-search"></i>
							</button>
						</span>
					</div>
					<ul id="output_search" class="list-group position-absolute"></ul>
				</form>

			</ul>
			<!-- Center elements -->

			<!-- Right elements -->
			<ul class="navbar-nav flex-row">
				<!-- Button trigger modal -->
				
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
							<i class="fas fa-chevron-circle-down fa-lg"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuLink">
							<li class="nav-item me-3 me-lg-1"><a
								class="nav-link d-sm-flex align-items-sm-center"
								href="${pageContext.request.contextPath}/profile?id=${user.id}">
									<img src="${pageContext.request.contextPath}/${user.avatar}"
									class="rounded-circle" height="22"
									alt="Black and White Portrait of a Man" loading="lazy" /> <strong
									class="d-none d-sm-block ms-1">${user.username}</strong>
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
				<!-- Updated Language Switcher with ?fromitem= -->
				<li class="nav-item dropdown me-3 me-lg-1"><a
					data-mdb-dropdown-init
					class="nav-link dropdown-toggle hidden-arrow" href="#"
					id="languageDropdown" role="button" aria-expanded="false"> <i
						class="fas fa-globe"></i>
				</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="languageDropdown">
						<li><a class="dropdown-item"
							href="?fromitem=${param.fromitem != null ? param.fromitem : 1}&id=${param.id != null ? param.id : 1}&lang=vi">
								<spring:message code="language.vietnamese" />
						</a></li>
						<li><a class="dropdown-item"
							href="?fromitem=${param.fromitem != null ? param.fromitem : 1}&id=${param.id != null ? param.id : 1}&lang=en">
								<spring:message code="language.english" />
						</a></li>
					</ul></li>


			</ul>
			<!-- Right elements -->
		</div>
	</nav>
	<!-- Navbar -->
	<script type="text/javascript"
		src="<c:url value="/resources/js/mdb.umd.min.js" /> "></script>
	<!-- Thêm script để xử lý sự kiện tìm kiếm -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// Handling keyup event for live search
							$('#search_name').on('keyup', function() {
								let query = $(this).val().trim();
								if (query.length > 0) {
									$.ajax({
										url : '/PhotoSharingWeb/liveSearch',
										method : 'GET',
										data : {
											query : query
										},
										success : function(response) {
											$('#output_search').html(response);
											$('#output_search').show();
										},
										error : function(xhr, status, error) {
											console.error('Error:', error);
										}
									});
								} else {
									$('#output_search').empty();
									$('#output_search').hide();
								}
							});

							// Handling click event for search icon
							$('#searchIcon')
									.on(
											'click',
											function() {
												var query = $('#search_name')
														.val();
												if (query.length > 0) {
													window.location.href = '/PhotoSharingWeb/searchResults?query='
															+ query;
												}
											});

							// Hide search results on click outside the search form
							$(document)
									.click(
											function(e) {
												if (!$(e.target).closest(
														'#searchForm').length) {
													$('#output_search').hide();
												}
											});
						});
	</script>

	<script>
		//script.js
		// dảm bảo đoạn mã chỉ dc thực thi sau khi toàn bộ html  chạy xong
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const fromItemValue = 123; // Thay thế với giá trị thực của bạn
							const contextPath = getContextPath(); // Hàm lấy context path, phụ thuộc vào cách bạn triển khai

							const url = `${contextPath}/yourEndpoint?fromitem=${fromItemValue}`;

							const xhr = new XMLHttpRequest();
							xhr.open('GET', url, true);
							xhr.onreadystatechange = function() {
								if (xhr.readyState === 4 && xhr.status === 200) {
									// Xử lý dữ liệu trả về từ máy chủ (nếu cần)
									console.log(xhr.responseText);
								}
							};
							xhr.send();
						});

		function getContextPath() {
			return window.location.pathname.substring(0,
					window.location.pathname.indexOf("/", 2));
		}
	</script>

</header>

<style>
#output_search {
	z-index: 1000;
	width: 100%;
	max-height: 300px;
	overflow-y: auto;
	background-color: white;
	border: 1px solid #ccc;
	display: none; /* Ban đầu ẩn kết quả tìm kiếm */
	position: absolute; /* Đảm bảo vị trí overlay */
}

.list-group-item {
	display: flex;
	align-items: center;
}

.list-group-item img {
	margin-right: 10px;
}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<!-- Sidebar -->
	<nav id="sidebarMenu"
		class="collapse d-lg-block sidebar collapse bg-white">
		<div class="position-sticky">
			<div class="list-group list-group-flush mx-3 mt-4">
				<a href="#" id="dashboardLink"
					class="list-group-item list-group-item-action py-2"
					data-mdb-ripple-init aria-current="true"> <i
					class="fas fa-tachometer-alt fa-fw me-3"></i><span>Bảng tin</span>
				</a> <a href="${pageContext.request.contextPath}/admin/post"
					id="postLink"
					class="list-group-item list-group-item-action py-2 active"
					data-mdb-ripple-init> <i class="fas fa-chart-area fa-fw me-3"></i><span>Bài
						viết</span>
				</a> <a href="#" id="categoryLink"
					class="list-group-item list-group-item-action py-2"
					data-mdb-ripple-init> <i class="fas fa-lock fa-fw me-3"></i><span>Chuyên
						mục</span>
				</a> <a href="#" id="analysisLink"
					class="list-group-item list-group-item-action py-2"
					data-mdb-ripple-init> <i class="fas fa-chart-line fa-fw me-3"></i><span>Phân
						tích</span>
				</a> <a href="#" id="feedbackLink"
					class="list-group-item list-group-item-action py-2"
					data-mdb-ripple-init> <i class="fas fa-calendar fa-fw me-3"></i><span>Phản
						hồi</span>
				</a> <a href="${pageContext.request.contextPath}/admin/user"
					id="usersLink" class="list-group-item list-group-item-action py-2"
					data-mdb-ripple-init> <i class="fas fa-users fa-fw me-3"></i><span>Users</span>
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
			<a class="navbar-brand" href="#"> <img
				src="<c:url value='resources/img/ptsharing-removebg-preview.png' />"
				height="25" alt="" loading="lazy" />
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

				<!-- Icon -->
				<li class="nav-item"><a class="nav-link me-3 me-lg-0" href="#">
						<i class="fas fa-fill-drip"></i>
				</a></li>
				<!-- Icon -->
				<li class="nav-item me-3 me-lg-0"><a class="nav-link" href="#">
						<i class="fab fa-github"></i>
				</a></li>

				<!-- Icon dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow" href="#"
					id="navbarDropdown" role="button" data-mdb-dropdown-init
					aria-expanded="false"> <i class="united kingdom flag m-0"></i>
				</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#"><i
								class="united kingdom flag"></i>English <i
								class="fa fa-check text-success ms-2"></i></a></li>
						<li>
							<hr class="dropdown-divider" />
						</li>
						<li><a class="dropdown-item" href="#"><i
								class="poland flag"></i>Polski</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="china flag"></i>中文</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="japan flag"></i>日本語</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="germany flag"></i>Deutsch</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="france flag"></i>Français</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="spain flag"></i>Español</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="russia flag"></i>Русский</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="portugal flag"></i>Português</a></li>
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
	<script>
document.addEventListener("DOMContentLoaded", function() {
    const menuItems = document.querySelectorAll('.list-group-item');
    
    // Kiểm tra xem có trạng thái "active" nào được lưu không
    const activeItem = sessionStorage.getItem('activeMenuItem');
    if (activeItem) {
        // Loại bỏ lớp 'active' từ tất cả các phần tử menu
        menuItems.forEach(item => {
            item.classList.remove('active');
        });
        // Áp dụng lớp 'active' cho mục đã được lưu trước đó
        document.getElementById(activeItem).classList.add('active');
    }

    // Lặp qua từng phần tử và thêm sự kiện click
    menuItems.forEach(item => {
        item.addEventListener('click', function () {
            // Lưu trạng thái "active" vào sessionStorage
            const itemId = this.getAttribute('id');
            sessionStorage.setItem('activeMenuItem', itemId);

            // Loại bỏ lớp 'active' từ tất cả các phần tử menu
            menuItems.forEach(item => {
                item.classList.remove('active');
            });
            // Thêm lớp 'active' vào phần tử được click
            this.classList.add('active');
        });
    });
});
</script>
</header>
<!--Main Navigation-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Start your project here-->
<header>
	<!-- Navbar-->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-body-tertiary fixed-top">
		<div class="container-fluid justify-content-between">
			<!-- Left elements -->
			<div class="d-flex">
				<!-- Brand -->
				<a class="navbar-brand me-2 mb-1 d-flex align-items-center" href="#">
					<img src="resources/img/ptsharing-removebg-preview.png" height="35"
					alt="MDB Logo" loading="lazy" style="margin-top: 2px;" />
				</a>


			</div>
			<!-- Left elements -->
			<!-- Center elements -->
			<ul class="navbar-nav flex-row d-none d-md-flex">
				<!-- Search form -->
				<form class="input-group w-auto my-auto d-none d-sm-flex">
					<input autocomplete="off" type="search"
						class="form-control rounded" placeholder="Search"
						style="min-width: 125px;" /> <span
						class="input-group-text border-0 d-none d-lg-flex"><i
						class="fas fa-search"></i></span>
				</form>
			</ul>
			<!-- Center elements -->

			<!-- Right elements -->
			<ul class="navbar-nav flex-row">
				<!-- Button trigger modal -->
				<c:if test="${sessionScope.user == null}">
					<button type="button" class="btn btn-primary" data-mdb-ripple-init
						onclick="window.location.href='login'">Đăng
						nhập</button>
				</c:if>
				<c:if test="${sessionScope.sessio != null}">
					<li class="nav-item me-3 me-lg-1"><a
						class="nav-link d-sm-flex align-items-sm-center" href="#"> <img
							src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
							class="rounded-circle" height="22"
							alt="Black and White Portrait of a Man" loading="lazy" /> <strong
							class="d-none d-sm-block ms-1">John</strong>
					</a></li>
					<li class="nav-item me-3 me-lg-1"><a class="nav-link"
						data-mdb-ripple-init data-mdb-modal-init
						data-mdb-target="#addModal"> <span><i
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
							<li><a class="dropdown-item" href="#">Some news</a></li>
							<li><a class="dropdown-item" href="#">Another news</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</c:if>
			</ul>
			<!-- Right elements -->
		</div>
	</nav>

	<div class="modal fade" id="addModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form style="width: 26rem;">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="btn-close" data-mdb-ripple-init
							data-mdb-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<!-- Name input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<input type="text" id="form4Example1" class="form-control" /> <label
								class="form-label" for="form4Example1">Name</label>
						</div>

						<!-- upload file -->
						<div data-mdb-input-init class="form-outline mb-4">
							<label class="form-label" for="customFile">Default file
								input example</label> <input type="file" class="form-control"
								id="customFile" />
						</div>
						<!-- Message input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<textarea class="form-control" id="form4Example3" rows="4"></textarea>
							<label class="form-label" for="form4Example3">Message</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-mdb-ripple-init data-mdb-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-mdb-ripple-init>Save
							changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Navbar -->
</header>
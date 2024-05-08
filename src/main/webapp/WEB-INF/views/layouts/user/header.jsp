<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<img
					src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
					height="20" alt="MDB Logo" loading="lazy" style="margin-top: 2px;" />
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
				<button type="button" class="btn btn-primary" data-mdb-ripple-init
					data-mdb-modal-init data-mdb-target="#loginModal">Đăng
					nhập</button>

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
						<li><a class="dropdown-item" href="#">Something else here</a>
						</li>
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
						<li><a class="dropdown-item" href="#">Something else here</a>
						</li>
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
						<li><a class="dropdown-item" href="#">Something else here</a>
						</li>
					</ul></li>
			</ul>
			<!-- Right elements -->
		</div>
	</nav>
	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-mdb-ripple-init
						data-mdb-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Pills navs -->
					<ul class="nav nav-pills nav-justified mb-3" id="ex1"
						role="tablist">
						<li class="nav-item" role="presentation"><a
							class="nav-link active" id="tab-login" data-mdb-pill-init
							href="#pills-login" role="tab" aria-controls="pills-login"
							aria-selected="true">Login</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link"
							id="tab-register" data-mdb-pill-init href="#pills-register"
							role="tab" aria-controls="pills-register" aria-selected="false">Register</a>
						</li>
					</ul>
					<!-- Pills navs -->

					<!-- Pills content -->
					<div class="tab-content">
						<div class="tab-pane fade show active" id="pills-login"
							role="tabpanel" aria-labelledby="tab-login">
							<form>
								<div class="text-center mb-3">
									<p>Sign in with:</p>
									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-facebook-f"></i>
									</button>

									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-google"></i>
									</button>

									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-twitter"></i>
									</button>

									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-github"></i>
									</button>
								</div>

								<p class="text-center">or:</p>

								<!-- Email input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="email" id="loginName" class="form-control" /> <label
										class="form-label" for="loginName">Email or username</label>
								</div>

								<!-- Password input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="password" id="loginPassword" class="form-control" />
									<label class="form-label" for="loginPassword">Password</label>
								</div>

								<!-- 2 column grid layout -->
								<div class="row mb-4">
									<div class="col-md-6 d-flex justify-content-center">
										<!-- Checkbox -->
										<div class="form-check mb-3 mb-md-0">
											<input class="form-check-input" type="checkbox" value=""
												id="loginCheck" checked /> <label class="form-check-label"
												for="loginCheck"> Remember me </label>
										</div>
									</div>

									<div class="col-md-6 d-flex justify-content-center">
										<!-- Simple link -->
										<a href="#!">Forgot password?</a>
									</div>
								</div>

								<!-- Submit button -->
								<button type="submit" data-mdb-button-init data-mdb-ripple-init
									class="btn btn-primary btn-block mb-4">Sign in</button>

								<!-- Register buttons -->
								<div class="text-center">
									<p>
										Not a member? <a href="#!">Register</a>
									</p>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="pills-register" role="tabpanel"
							aria-labelledby="tab-register">
							<form>
								<div class="text-center mb-3">
									<p>Sign up with:</p>
									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-facebook-f"></i>
									</button>

									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-google"></i>
									</button>

									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-twitter"></i>
									</button>

									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-github"></i>
									</button>
								</div>

								<p class="text-center">or:</p>

								<!-- Name input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="text" id="registerName" class="form-control" /> <label
										class="form-label" for="registerName">Name</label>
								</div>

								<!-- Username input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="text" id="registerUsername" class="form-control" />
									<label class="form-label" for="registerUsername">Username</label>
								</div>

								<!-- Email input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="email" id="registerEmail" class="form-control" />
									<label class="form-label" for="registerEmail">Email</label>
								</div>

								<!-- Password input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="password" id="registerPassword"
										class="form-control" /> <label class="form-label"
										for="registerPassword">Password</label>
								</div>

								<!-- Repeat Password input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="password" id="registerRepeatPassword"
										class="form-control" /> <label class="form-label"
										for="registerRepeatPassword">Repeat password</label>
								</div>

								<!-- Checkbox -->
								<div class="form-check d-flex justify-content-center mb-4">
									<input class="form-check-input me-2" type="checkbox" value=""
										id="registerCheck" checked
										aria-describedby="registerCheckHelpText" /> <label
										class="form-check-label" for="registerCheck"> I have
										read and agree to the terms </label>
								</div>

								<!-- Submit button -->
								<button type="submit" data-mdb-button-init data-mdb-ripple-init
									class="btn btn-primary btn-block mb-3">Sign in</button>
							</form>
						</div>
					</div>
					<!-- Pills content -->
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
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
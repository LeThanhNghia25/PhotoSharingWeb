<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng nhập</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css'/>">
<style>
#error-message {
	color: #721c24;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<!-- Section: Design Block -->
		<section class="text-center">
			<!-- Background image -->
			<div class="p-5 bg-image"
				style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
			<!-- Background image -->

			<div class="card mx-4 mx-md-5 shadow-5-strong bg-body-tertiary"
				style="margin-top: -100px; backdrop-filter: blur(30px);">
				<div class="card-body py-5 px-md-5">

					<div class="row d-flex justify-content-center">
						<div class="col-lg-8">
							<h2 class="fw-bold mb-5">Đăng nhập</h2>

							<form id="loginForm" name="loginForm" 
								action="<c:url value='/spring_security_login' />" method="post">
								<!-- Email input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="text" id="email" name="email" class="form-control"
										required="true" /> <label for="email" class="form-label">Email
										của bạn</label>
								</div>

								<!-- Password input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="password" id="password" name="password"
										class="form-control" required="true" /> <label
										class="form-label" for="password">Mật khẩu</label>
								</div>

								<!-- Submit button -->
								<button type="submit" class="btn btn-primary btn-block mb-4">Đăng
									nhập</button>
								<!-- Register buttons -->
								<div class="text-center">
									<p>
										Chưa có tài khoản? <a href="<c:url value='/register'/>">Đăng
											ký</a>
									</p>
									<p>Hoặc đăng nhập bằng:</p>
									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-facebook-f"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<section class="text-center">
		<div class="p-5 bg-image"
			style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
		<div class="card mx-4 mx-md-5 shadow-5-strong bg-body-tertiary"
			style="margin-top: -100px; backdrop-filter: blur(30px);">
			<div class="card-body py-5 px-md-5">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h2 class="fw-bold mb-5">Đăng ký ngay</h2>
						<div id="alert-success"></div>
						<form:form id="registerForm" modelAttribute="user"
							action="registerForm" method="post">
							<!-- Username input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<form:input path="username" id="username"
									cssClass="form-control" required="true" />
								<label for="username" class="form-label">Tên của bạn</label>

							</div>
							<!-- Date input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<form:input path="birthday" id="birthday"
									cssClass="form-control" type="date" required="true" />
								<label for="birthday" class="form-label">Ngày sinh</label>
							</div>
							<!-- Email input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<form:input path="email" id="email" cssClass="form-control"
									type="email" required="true" />
								<label for="email" class="form-label">Email của bạn</label>
								<!-- Error message -->
								<div id="email-error" class="error-message" style="color: red;"></div>

							</div>
							<!-- Password input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<form:password path="password" id="password"
									cssClass="form-control" required="true" />
								<label class="form-label" for="password">Mật khẩu</label>

								<form:input path="status" id="status" value="active"
									cssClass="form-control" type="hidden" />
								<!-- Error message -->
								<div id="error-message" class="error-message"
									style="color: red;"></div>
							</div>

							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4">Đăng
								ký</button>

						</form:form>

					</div>
				</div>
			</div>
		</div>
	</section>

</div>

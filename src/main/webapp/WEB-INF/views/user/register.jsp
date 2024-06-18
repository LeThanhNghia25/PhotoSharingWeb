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
						<form:form id="registerForm" modelAttribute="user"
							action="${pageContext.request.contextPath}/register"
							method="post">
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
								<div id="email-error" class="error-message"></div>
							</div>
							<!-- Password input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<form:password path="password" id="password"
									cssClass="form-control" required="true" />
								<label class="form-label" for="password">Mật khẩu</label>

								<form:input path="enabled" id="enabled" value="true"
									cssClass="form-control" type="hidden" />
								<!-- Error message -->
								<div id="error-message" class="error-message"></div>
							</div>

							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4">Đăng
								ký</button>
							<c:if test="${param.errMsg != null }">
								<div class="alert alert-danger">${errMsg}</div>
							</c:if>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<style>
.error-message {
	color: #721c24; /* Màu chữ đỏ đậm */
	padding: 10px;
} /* Khoảng cách giữa nội dung và viền */
</style>
</div>

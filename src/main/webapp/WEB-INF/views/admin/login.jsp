<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#loginAdForm")
								.submit(
										function(e) {
											e.preventDefault(); // prevent form submission and page reload
											var formData = $(this).serialize(); // serialize form data
											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/loginAdForm",
														data : formData,
														success : function(
																response) {
															if (response === "success") {
																window.location.href = '${pageContext.request.contextPath}/admin/post';
															} else if (response === "erroremailofpass") {
																$(
																		"#error-message")
																		.html(
																				'<div class="alert alert-danger alert-dismissible fade show" role="alert">'
																						+ 'Sai email hoặc mật khẩu'
																						+ '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
																						+ '</div>');
															}
														},
														error : function() {
															$("#error-message")
																	.html(
																			"Lỗi không xác định.");
														}
													});
										});
					});
</script>

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
						<h2 class="fw-bold mb-5">Đăng nhập vào trang quản trị</h2>
						<form:form id="loginAdForm" modelAttribute="admin"
							action="loginAdForm" method="post">
							<!-- Email input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<form:input path="username" id="username" cssClass="form-control"
									required="true" />
								<label for="email" class="form-label">Tên đăng nhập</label>
							</div>

							<!-- Password input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<form:password path="password" id="password"
									cssClass="form-control" required="true" />
								<label class="form-label" for="password">Mật khẩu</label>
							</div>
							<!-- Error message -->
							<div id="error-message"></div>
							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4">Đăng
								nhập</button>
						</form:form>


					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Section: Design Block -->

</div>

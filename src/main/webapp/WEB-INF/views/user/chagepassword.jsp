<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#repassword").submit(function(e) {
			e.preventDefault();

			var formData = new FormData(this);

			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/repassword",
				data: formData,
				contentType: false,
				processData: false,
				success: function(response) {
					if (response === "success") {
						$("#alert-success").html(
							'<div class="alert alert-success alert-dismissible fade show" role="alert">' +
							'Mật khẩu đã được cập nhật.' +
							'<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
							'</div>'
						);
						$(".alert-success").fadeIn().delay(2000).fadeOut();
						setTimeout(function() {
							window.location.href = '${pageContext.request.contextPath}/editprofile'; // Chuyển hướng sau 2 giây
						}, 2000); // 2000 milliseconds = 2 seconds
					} else if (response === "errorpass") {
						$("#erorpassword").html("Mật khẩu không giống nhau");
					} else if (response === "error-message") { // Chỉnh sửa dòng này
						$("#error-message").html("Mật khẩu cũ không đúng"); // Và dòng này
					}
				},
				error: function() {
					$("#error-mess").html("Lỗi không xác định.");
				}
			});
		});
	});
</script>

<!DOCTYPE html>
<div class="container">
	<section class="text-center">
		<div class="p-5 bg-image"
			style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
		<div class="card mx-4 mx-md-5 shadow-5-strong bg-body-tertiary"
			style="margin-top: -100px; backdrop-filter: blur(30px);">
			<div class="card-body py-5 px-md-5">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">

						<h2 class="fw-bold mb-5">Đổi mật khẩu</h2>
						<form:form id="repassword" modelAttribute="user"
							action="repassword" method="post">
							<!-- thong bao -->
							<div id="alert-success"></div>
							<!-- Current Password input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<form:password path="password" id="password"
									cssClass="form-control" required="true" />
								<label class="form-label" for="password">Nhập mật khẩu
									cũ</label>
							</div>
							<!-- Error message -->
							<div id="error-message" class="error-message"></div>
							
						
							<div data-mdb-input-init class="form-outline mb-4">
								<input type="password" id="passwordnew" name="passwordnew"
									class="form-control" required="true" /> <label
									class="form-label" for="passwordnew">Nhập mật khẩu mới</label>
							</div>
							<!-- Error message -->
							<div id="erorpassword" class="error-message" role="alert"></div>
							<!-- New Password input -->
							<!-- Confirm New Password input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<input type="password" id="repasswordnew" name="repasswordnew"
									class="form-control" required="true" /> <label
									class="form-label" for="repasswordnew">Nhập lại mật
									khẩu</label>
							</div>

							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4">Đổi
								mật khẩu</button>

						</form:form>
		<!-- Error message -->
							<div id="#error-mess" class="error-message"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
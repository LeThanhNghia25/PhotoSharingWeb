<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<script>
	function previewImage(input) {
		var file = input.files[0];
		if (file) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#avatar').attr('src', e.target.result);
			}
			reader.readAsDataURL(file);
		}
	}
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#updateavatar")
								.submit(
										function(e) {
											e.preventDefault(); // Ngăn chặn hành động mặc định của form

											var formData = new FormData(this);

											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/updateavatar",
														data : formData,
														contentType : false,
														processData : false,
														success : function(
																response) {
															if (response === "success") {
																$(
																		"#alert-success")
																		.html(
																				'<div class="alert alert-success alert-dismissible fade show" role="alert">'
																						+ '<strong>Success!</strong> Cập nhật ảnh đại diện thành công.'
																						+ '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
																						+ '</div>');
																$(
																		".alert-success")
																		.fadeIn()
																		.delay(
																				4000)
																		.fadeOut();

																// Cập nhật ảnh đại diện ngay trên trang web mà không cần tải lại
																var avatarUrl = "${pageContext.request.contextPath}/resources/avatar/"
																		+ formData
																				.get('avatar').name;
																$('#avatar')
																		.attr(
																				'src',
																				avatarUrl);
															}
														},
														error : function() {
															$("#erroravatar")
																	.html(
																			"Bạn chưa thêm ảnh.");
														}
													});
										});
					});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#updatepro")
								.submit(
										function(e) {
											e.preventDefault(); // Ngăn chặn hành động mặc định của form

											var formData = new FormData(this);

											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/updatepro",
														data : formData,
														contentType : false,
														processData : false,
														success : function(
																response) {
															if (response === "success") {
																$(
																		"#alert-tt-success")
																		.html(
																				'<div class="alert alert-success alert-dismissible fade show" role="alert">'
																						+ '<strong>Success!</strong> Cập nhật thông tin thành công.'
																						+ '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
																						+ '</div>');
																$(
																		".alert-success")
																		.fadeIn()
																		.delay(
																				2000)
																		.fadeOut();
															}
														}

													});
										});
					});
</script>
<section style="background-color: #eee;">
	<div class="container py-5">
		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<img id="avatar" src="${user.avatar}" alt="avatar"
							class="rounded-circle img-fluid" style="width: 150px;">
						<h5 class="my-3">${user.username}</h5>
						<form id="updateavatar" action="updateavatar" method="post"
							enctype="multipart/form-data">
							<div class="form-group mb-4">
								<input type="hidden" name="id" id="id" value="${user.id}"
									class="form-control" /> <label for="file" class="form-label"><spring:message code="choseimg"/></label> <input name="avatar" type="file" id="avatarupload"
									class="form-control" onchange="previewImage(this)" /> <br>
								<button type="submit" class="btn btn-secondary"
									data-mdb-ripple-init><spring:message code="update"/></button>
							</div>
						</form>
						<div id="alert-success"></div>
						<div id="erroravatar" style="color: red;"></div>
						<p class="text-muted mb-1">${user.description}</p>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card mb-4">
					<div class="card-body">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"><spring:message code="myprofile"/></h5>
						</div>
						<div id="alert-tt-success"></div>
						<div class="modal-body">
							<form id="updatepro" action="updatepro" method="post">
								<div class="form-group mb-4">
									<label for="username" class="form-label"><spring:message code="myname"/></label> <input
										type="text" name="username" id="username"
										value="${user.username}" class="form-control"
										aria-label="Username" required />
								</div>
								<div class="form-group mb-4">
									<label for="email" class="form-label">Email</label> <input
										type="email" name="email" id="email" value="${user.email}"
										class="form-control" aria-label="Email" readonly />
								</div>
								<div class="form-group mb-4">
									<label for="description" class="form-label"><spring:message code="content"/></label>
									<textarea name="description" class="form-control"
										id="description" rows="4" aria-label="Description" required>${user.description}</textarea>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-secondary"
										data-mdb-ripple-init><spring:message code="update"/></button>
								</div>
							</form>




						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
</section>

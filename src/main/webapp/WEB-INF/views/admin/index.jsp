<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Form Example</title>
<!-- MDB -->
<link rel="stylesheet" href="css/mdb.umd.min.css">
</head>
<body>
	<!--Main Navigation-->
	<!--Main layout-->
	<main style="margin-top: 58px">
		<div class="container pt-4">
			<!-- Section: Main chart -->
			<section class="mb-4">
				<div class="card">
					<div class="card-header py-3">
						<h5 class="mb-0 text-center">
							<strong>Tất cả bài viết</strong>
						</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table align-middle mb-0 bg-white">
								<thead class="bg-light">
									<tr>
										<th>Tiêu đề</th>
										<th>Tác giả</th>
										<th>Trạng thái</th>
										<th>Chuyên mục</th>
										<th>Thời gian</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="img" items="${imgs}">
										<tr>
											<td>
												<div class="d-flex align-items-center">
													<div class="ms-3">
														<a href="#"><p class="fw-bold mb-1">${img.title}</p></a>
														<button type="button"
															class="btn btn-link btn-sm btn-rounded"
															onclick="showForm(this)">Xem</button>
														<button type="button"
															class="btn btn-link btn-sm btn-rounded"
															onclick="showForm(this)">Sửa</button>
														<form action="${pageContext.request.contextPath}/admin/deleteimg" method="get">
															<input type="hidden" name="fromid" value="${img.id}" />
															<button type="submit"
																class="btn btn-link btn-sm btn-rounded">Xóa</button>
														</form>
													</div>
												</div>
											</td>
											<td>
												<p class="text-muted mb-0">${img.creator.username}</p>
											</td>
											<td><span
												class="badge badge-success rounded-pill d-inline">${img.status}</span></td>
											<td><p class="text-muted mb-0">${img.category.title}</p></td>
											<td>
												<p class="fw-bold mb-1">${img.createdTime}</p>
											</td>
										</tr>
										<tr class="edit-form" style="display: none;">
											<td colspan="5">
												<form action="updateformimg" method="post">
													<!-- 2 column grid layout with text inputs for the first and last names -->
													<div class="row mb-4">
														<div class="col">
															<div data-mdb-input-init class="form-outline">
																<input type="hidden" name="fromid" value="${img.id}" />
																<input type="text" id="title" name="title"
																	class="form-control" value="${img.title}" /> <label
																	class="form-label" for="title">Tiêu đề</label>
															</div>
														</div>
													</div>

													<!-- Message input -->
													<div data-mdb-input-init class="form-outline mb-4">
														<textarea class="form-control" id="content" name="content"
															rows="4">${img.content}</textarea>
														<label class="form-label" for="content">Nội dung</label>
													</div>
													<!-- Ảnh -->
													<div class="row mb-4">
														<div class="col">
															<div data-mdb-input-init class="form-outline">
																<input type="text" id="title" name="urlimg"
																	class="form-control" value="${img.img}" /> <label
																	class="form-label" for="title">Ảnh</label>
															</div>
														</div>
													</div>
													<!-- Chuyên mục -->
													<label class="label" for="category">Chuyên mục</label> <select
														id="category" name="category" class="form-select mb-4"
														aria-label="Default select example">
														<option value="1">Ảnh tĩnh</option>
														<option value="2">Ảnh động</option>
													</select>
													<!-- Tác giả -->
													<div data-mdb-input-init class="form-outline mb-4">
														<input type="text" id="author" name="author"
															class="form-control" value="${img.creator.username}" />
														<label class="form-label" for="author">Tác giả</label>
													</div>

													<!-- Trang thái -->
													<label class="label" for="status">Trạng thái</label> <select
														id="status" name="status" class="form-select mb-4"
														aria-label="Default select example">
														<option value="1">ok</option>
														<option value="2">off</option>
													</select>

													<!-- Text input -->
													<div data-mdb-input-init class="form-outline mb-4">
														<input type="text" id="createdTime" name="createdTime"
															class="form-control" value="${img.createdTime}" /> <label
															class="form-label" for="createdTime">Thời gian</label>
													</div>
													<!-- Submit button -->
													<button data-mdb-ripple-init type="submit"
														class="btn btn-primary btn-block mb-4">Cập nhật</button>
												</form>

											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<nav aria-label="...">
							<ul class="pagination">
								<li class="page-item disabled"><a class="page-link">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active" aria-current="page"><a
									class="page-link" href="#">2 <span class="visually-hidden">(current)</span></a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</section>
			<!-- Section: Main chart -->
		</div>
	</main>
	<!--Main layout-->
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.umd.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript" src="js/admin.js"></script>
	<script>
		function showForm(button) {
			// Find the closest row
			var row = button.closest('tr');
			// Find the next row which contains the form
			var formRow = row.nextElementSibling;
			// Toggle the display of the form
			if (formRow.style.display === 'none'
					|| formRow.style.display === '') {
				formRow.style.display = 'table-row';
			} else {
				formRow.style.display = 'none';
			}
		}
	</script>
</body>
</html>

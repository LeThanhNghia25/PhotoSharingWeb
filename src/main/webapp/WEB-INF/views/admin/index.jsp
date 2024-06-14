<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
														onclick="window.location.href='${pageContext.request.contextPath}/detail?fromitem=${img.id}'">Xem</button>
													<button type="button"
														class="btn btn-link btn-sm btn-rounded"
														onclick="showForm(this)">Sửa</button>
													<form:form
														action="${pageContext.request.contextPath}/admin/deleteimg"
														method="get" modelAttribute="img">
														<form:hidden path="id" value="${img.id}" />
														<button type="submit"
															class="btn btn-link btn-sm btn-rounded">Xóa</button>
													</form:form>
												</div>
											</div>
										</td>
										<td>
											<p class="text-muted mb-0">${img.creator.email}</p>
										</td>
										<td><span
											class="badge badge-success rounded-pill d-inline">${img.enabled}</span></td>
										<td><p class="text-muted mb-0"></p>${img.cata.catalogname}</td>
										<td>
											<p class="fw-bold mb-1">${img.createdTime}</p>
										</td>
									</tr>
									<tr class="edit-form" style="display: none;">
										<td colspan="5"><form:form
												action="${pageContext.request.contextPath}/admin/updateformimg"
												method="post" modelAttribute="img">
												<!-- 2 column grid layout with text inputs for the first and last names -->
												<div class="row mb-4">
													<div class="col">
														<div data-mdb-input-init class="form-outline">
															<form:hidden path="id" value="${img.id}" />
															<form:input path="title" id="title"
																cssClass="form-control" value="${img.title}" />
															<label class="form-label" for="title">Tên</label>
														</div>
													</div>
												</div>

												<!-- Message input -->
												<div data-mdb-input-init class="form-outline mb-4">
													<label class="form-label" for="content">Nội dung</label>
													<textarea name="content" id="content" class="form-control"
														rows="4">${img.content}</textarea>
												</div>


												<!-- Ảnh -->
												<div class="row mb-4">
													<div class="col">
														<div data-mdb-input-init class="form-outline">
															<form:input path="img" id="urlimg"
																cssClass="form-control" value="${img.img}" />
															<label class="form-label" for="urlimg">Ảnh</label>
														</div>
													</div>
												</div>

												<!-- Trạng thái -->
												<label class="label" for="enabled">Trạng thái</label>
												<form:select path="enabled" id="enabled"
													cssClass="form-select mb-4"
													aria-label="Default select example">
													<form:option value="true" label="Enabled" />
													<form:option value="false" label="Disabled" />

												</form:select>

												<!-- Text input -->
												<div data-mdb-input-init class="form-outline mb-4">
													<form:input path="createdTime" id="createdTime"
														cssClass="form-control" value="${img.createdTime}" />
													<label class="form-label" for="createdTime">Thời
														gian</label>
												</div>

												<!-- Submit button -->
												<button data-mdb-ripple-init type="submit"
													class="btn btn-primary btn-block mb-4">Cập nhật</button>
											</form:form></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<nav aria-label="...">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item " aria-current="page"><a
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
		if (formRow.style.display === 'none' || formRow.style.display === '') {
			formRow.style.display = 'table-row';
		} else {
			formRow.style.display = 'none';
		}
	}
</script>

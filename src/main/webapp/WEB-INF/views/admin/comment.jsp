<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<main style="margin-top: 58px">
	<div class="container pt-4">
		<!-- Section: Main chart -->
		<section class="mb-4">
			<div class="card">
				<div class="card-header py-3">
					<h5 class="mb-0 text-center">
						<strong>Tất cả phẩn hồi</strong>
					</h5>
				</div>

				<div class="table-responsive">
					<table class="table align-middle mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th>Bài viết</th>
								<th>Nội dung</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<tr><td><a href="#"><p class="fw-bold mb-1">ssssssss</p></a></td>
							<td><a href="#"><p class="fw-bold mb-1">Noi dung</p></a></td>
								<td>
								<button type="button"
														class="btn btn-link btn-sm btn-rounded"
														onclick="window.location.href='${pageContext.request.contextPath}/detai?fromitem=${img.id}'">Xem</button>
									<button type="submit" class="btn btn-link btn-sm btn-rounded">Xóa</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active" aria-current="page"><a class="page-link" href="#">2 <span class="visually-hidden">(current)</span></a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>
		</section>
	</div>
</main>

<!-- Custom CSS -->
<style>
	.launch-button {
		position: absolute;
		top: 10px;
		left: 10px;
		width: auto;
	}
</style>


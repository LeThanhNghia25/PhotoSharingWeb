<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<main style="margin-top: 58px">
	<div class="container pt-4">
		<!-- Section: Main chart -->
		<section class="mb-4">
			<div class="card">
				<div class="card-header py-3">
					<h5 class="mb-0 text-center">
						<strong><spring:message code="alluser"/></strong>
					</h5>
				</div>
				<div class="table-responsive">
					<table class="table align-middle mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th><spring:message code="name"/></th>
								<th><spring:message code="row"/></th>
								<th><spring:message code="status"/></th>
								<th><spring:message code="action"/></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td>
										<div class="d-flex align-items-center">
											<img src="${pageContext.request.contextPath}/${user.avatar}"
												alt="" style="width: 45px; height: 45px"
												class="rounded-circle" />
											<div class="ms-3">
												<p class="fw-bold mb-1">${user.username}</p>
												<p class="text-muted mb-0">${user.email}</p>
											</div>
										</div>
									</td>
									<td>
										<p class="fw-normal mb-1"><spring:message code="user"/></p>

									</td>
									<td><span
										class="badge rounded-pill d-inline 
            <c:choose>
                <c:when test="${user.status == 'active'}">
                    badge-success
                </c:when>
                <c:otherwise>
                    badge-danger
                </c:otherwise>
            </c:choose>">
											${user.status} </span></td>
									<td>
										<button type="button" class="btn btn-link btn-sm btn-rounded"
											onclick="showForm(this)"><spring:message code="edit"/></button> <form:form
											action="${pageContext.request.contextPath}/admin/deleteuser"
											method="get" modelAttribute="user">
											<form:hidden path="id" value="${user.id}" />
											<button type="submit" class="btn btn-link btn-sm btn-rounded"><spring:message code="delete"/></button>
										</form:form>
									</td>
								</tr>
								<tr class="edit-form" style="display: none;">
									<td colspan="3"><form:form
											action="${pageContext.request.contextPath}/admin/updateuser"
											method="post" modelAttribute="user">
											<!-- 2 column grid layout with text inputs for the first and last names -->
											<div class="row mb-4">
												<div class="col">
													<div class="form-outline">

														<div class="form-group row align-items-center">
															<div class="col-md-6">
																<form:hidden path="id" id="id" class="form-control"
																	value="${user.id}" />
																<form:input path="username" id="username"
																	class="form-control" value="${user.username}" />
																<label class="form-label" for="username"><spring:message code="name"/></label>
															</div>
															<div class="col-md-6">
																<label class="form-label" for="status"><spring:message code="status"/></label>
																<form:select path="status" id="status"
																	class="form-select mb-4"
																	aria-label="Default select example">
																	<form:option value="active" label="active" />
																	<form:option value="block" label="block" />
																</form:select>
															</div>
														</div>
													</div>
												</div>
											</div>


											<!-- Submit button -->
											<button data-mdb-ripple-init type="submit"
												class="btn btn-primary btn-block mb-4">Cập nhật</button>
										</form:form>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link">Previous</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active" aria-current="page"><a
							class="page-link" href="#">2 <span class="visually-hidden">(current)</span></a>
						</li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>
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
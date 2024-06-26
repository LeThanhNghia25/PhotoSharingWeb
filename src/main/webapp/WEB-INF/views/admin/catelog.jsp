<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
    $(document).ready(function() {
        $("#addcatelog").submit(function(e) {
            e.preventDefault();

            var formData = new FormData(this);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/addcatelog",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    if (response === "success") {
                        $("#alert-success").html(
                            '<div class="alert alert-success alert-dismissible fade show" role="alert">' +
                            '<strong>Success!</strong> Thêm chuyên mục thành công.' +
                            '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
                            '</div>'
                        ).fadeIn().delay(2000).fadeOut();
                        setTimeout(function() {
                            window.location.href = '${pageContext.request.contextPath}/admin/cate'; // Chuyển hướng sau 2 giây
                        }, 2000); // 2000 milliseconds = 2 seconds
                        // Optionally close the modal
                        $("#exampleModal").modal('hide');
                        
                        // Clear the form
                        $("#addcatelog")[0].reset();

                      
                    } else if (response === "catenotnull") {
                        $("#emtycate").html("Tên chuyên mục không để trống").show();
                    } else {
                        $("#error-message").html(response).show();
                    }
                },
                error: function() {
                    $("#error-message").html("Lỗi không xác định.").show();
                }
            });
        });
    });


</script>
<script type="text/javascript">
$(document).ready(function() {
    $(document).on('submit', '#deletecatelog', function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/deletecatelog",
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                if (response === "success") {
                    $("#alert-success").html(
                        '<div class="alert alert-success alert-dismissible fade show" role="alert">' +
                        '<strong>Success!</strong> Xóa thành công.' +
                        '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
                        '</div>'
                    ).fadeIn().delay(2000).fadeOut();
                    setTimeout(function() {
                        window.location.href = '${pageContext.request.contextPath}/admin/cate'; // Chuyển hướng sau 2 giây
                    }, 2000); // 2000 milliseconds = 2 seconds
                    // Fetch the updated catalog list and update the DOM
                    fetchUpdatedCatalogList();
                } else {
                    $("#error-message").html(response).show();
                }
            },
            error: function() {
                $("#error-message").html("Lỗi không xác định.").show();
            }
        });
    });
});
</script>

<main style="margin-top: 58px">
	<div class="container pt-4">
		<!-- Section: Main chart -->
		<section class="mb-4">
			<div class="card">
				<div class="card-header py-3">
					<h5 class="mb-0 text-center">
						<strong>Tất cả chuyên mục</strong>
					</h5>
				</div>

				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-sm launch-button"
					data-mdb-ripple-init data-mdb-modal-init
					data-mdb-target="#exampleModal">Thêm chuyên mục</button>
				<div id="alert-success"></div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Thêm chuyên
									mục</h5>
								<button type="button" class="btn-close" data-mdb-ripple-init
									data-mdb-dismiss="modal" aria-label="Close"></button>
							</div>
							<form:form id="addcatelog"
								action="${pageContext.request.contextPath}/admin/addcatelog"
								method="post" modelAttribute="catelog">
								<div class="modal-body">
									<form:input path="catalogname" id="catalogname"
										class="form-control" />
								</div>
								<div class="modal-footer">
									<div id="emtycate" class="error-message" role="alert"></div>
									<button type="button" class="btn btn-secondary"
										data-mdb-ripple-init data-mdb-dismiss="modal">Đóng</button>
									<button type="submit" class="btn btn-primary"
										data-mdb-ripple-init>Lưu</button>
									<div id="error-message" class="error-message" role="alert"></div>
								</div>
							</form:form>
						</div>
					</div>
				</div>

				<div class="table-responsive">
					<table class="table align-middle mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th>Chuyên mục</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cate" items="${cates}">
								<tr>
									<td><label class="form-label" for="catalogname">${cate.catalogname}</label></td>
									<td><form:form id="deletecatelog"
											action="${pageContext.request.contextPath}/admin/deletecatelog"
											method="post" modelAttribute="catelog">
											<form:input path="id" id="id" value="${cate.id}"
												class="form-control" type="hidden" />
											<button type="submit" class="btn btn-link btn-sm btn-rounded">Xóa</button>
										</form:form></td>
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

<!-- MDB -->
<!-- Custom scripts -->

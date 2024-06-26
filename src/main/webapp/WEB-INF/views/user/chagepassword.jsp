<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
                        $("#error-password").html("Mật khẩu không giống nhau");
                    } else if (response === "error-message") {
                        $("#error-message").html("Mật khẩu cũ không đúng");
                    }
                },
                error: function() {
                    $("#error-message").html("Lỗi không xác định.");
                }
            });
        });
    });
</script>

<div class="container">
    <section class="text-center">
        <div class="p-5 bg-image"
            style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
        <div class="card mx-4 mx-md-5 shadow-5-strong bg-body-tertiary"
            style="margin-top: -100px; backdrop-filter: blur(30px);">
            <div class="card-body py-5 px-md-5">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="fw-bold mb-5"><spring:message code="chagepass"/></h2>
                        <form:form id="repassword" modelAttribute="user" action="repassword" method="post">
                            <!-- Thông báo thành công -->
                            <div id="alert-success"></div>
                            <!-- Input mật khẩu cũ -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <form:password path="password" id="password" cssClass="form-control" required="true" />
                                <label class="form-label" for="password"><spring:message code="repassword"/></label>
                            </div>
                            <!-- Thông báo lỗi -->
                            <div id="error-message" class="error-message"></div>
                            <!-- Input mật khẩu mới -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="password" id="passwordnew" name="passwordnew" class="form-control" required="true" />
                                <label class="form-label" for="passwordnew"><spring:message code="renewpass"/></label>
                            </div>
                            <!-- Thông báo lỗi -->
                            <div id="error-password" class="error-message" role="alert"></div>
                            <!-- Nhập lại mật khẩu mới -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="password" id="repasswordnew" name="repasswordnew" class="form-control" required="true" />
                                <label class="form-label" for="repasswordnew"><spring:message code="renewpassword"/></label>
                            </div>
                            <!-- Nút submit -->
                            <button type="submit" class="btn btn-primary btn-block mb-4"><spring:message code="chagepass"/></button>
                        </form:form>
                        <!-- Thông báo lỗi -->
                        <div id="error-message" class="error-message"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

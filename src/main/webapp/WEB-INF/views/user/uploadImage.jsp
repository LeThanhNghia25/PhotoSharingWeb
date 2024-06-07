<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="row d-flex justify-content-center">
    <div class="col-md-12 col-lg-10 col-xl-8">
        <div class="card">
            <div class="card-body row">
                <div class="col-md-6">
                    <div class="bg-image hover-zoom">
                        <img id="imagePreview" src="#" alt="Ảnh được chọn"
                            style="display: none; max-width: 100%; height: auto;" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="d-flex flex-start align-items-center">
                        <form:form action="uploadImg" method="post" modelAttribute="img"
                            enctype="multipart/form-data">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Tải ảnh lên</h5>
                            </div>
                            <div class="modal-body">
                                <div class="form-group mb-4">
                                    <label for="title" class="form-label">Tiêu đề</label>
                                    <form:input path="title" id="title" class="form-control" />
                                </div>
                                <div class="form-group mb-4">
                                    <label for="file" class="form-label">Chọn ảnh</label>
                                    <input name="url" type="file" id="imageUpload"
                                        class="form-control" onchange="previewImage(this)" />
                                </div>
                                <div class="form-group mb-4">
                                    <label for="content" class="form-label">Nội dung</label>
                                    <form:textarea path="content" class="form-control" id="content"
                                        rows="4"></form:textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-secondary"
                                    data-mdb-ripple-init>Đăng bài</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function previewImage(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#imagePreview').attr('src', e.target.result);
                        $('#imagePreview').show();
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </div>
</div>

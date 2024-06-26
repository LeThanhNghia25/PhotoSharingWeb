<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
$(document).ready(function() {
    $("#uploadImg").submit(function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/uploadImg",
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                if (response === "success") {
                	$("#alert-success").html('<div class="alert alert-success alert-dismissible fade show" role="alert">' +
                		    '<strong>Success!</strong> Đăng bài thành công.' +
                		    '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
                		    '</div>');
                    $(".alert-success").fadeIn().delay(2000).fadeOut();
                    setTimeout(function() {
                        window.location.href = '${pageContext.request.contextPath}/home'; // Chuyển hướng sau 2 giây
                    }, 2000); // 2000 milliseconds = 2 seconds
                } else if (response === "fileemty") {
                    $("#emtyimg").html("Ảnh không được để trống");
                } else {
                    $("#error-message").html(response);
                }
            },
            error: function() {
                $("#error-message").html("Lỗi không xác định.");
            }
        });
    });
});

</script>
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
					<div id="alert-success"></div>
					<div class="d-flex flex-start align-items-center">
						<form:form id="uploadImg" action="uploadImg" method="post"
							modelAttribute="img" enctype="multipart/form-data">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Tải ảnh lên</h5>
							</div>
							<div class="modal-body">
								<div class="form-group mb-4">
									<label for="title" class="form-label">Tiêu đề</label>
									<form:input path="title" id="title" class="form-control" />
								</div>
								<!-- Error message -->
								<div id="error-message" class="error-message" role="alert"></div>
								<div class="form-group mb-4">
								<input type="hidden" name="checkvalueimg" id="checkvalueimg">
									<label for="file" class="form-label">Chọn ảnh</label> <input
										name="url" type="file" id="imageUpload" class="form-control"
										onchange="previewImage(this)" />
								</div>
								<div id="noffi-probability">Kiểm tra...</div>
								<!-- Error message -->
								<div id="emtyimg" class="error-message" role="alert"></div>
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
						<!-- Error message -->
						<div id="error-message" class="error-message"></div>
					</div>
				</div>
			</div>
		</div>
    

<script>
async function moderationImg(file) {
    try {
        const formData = new FormData();
        formData.append('media', file);
        formData.append('models', 'nudity-2.1,weapon,gore-2.0');
        formData.append('api_user', '1046694070');
        formData.append('api_secret', '5njUn86MUDjfxrus8B5VvcLiB2G8kpbX');

        const response = await fetch('https://api.sightengine.com/1.0/check.json', {
            method: 'POST',
            body: formData
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        const firearmProbability = data.weapon.classes.firearm;
        const goreProbability = data.gore.prob;
        const nudityProbability = data.nudity.sexual_activity;

        const adjustedFirearmProbability = firearmProbability * 100;
        const adjustedGoreProbability = goreProbability * 100;
        const adjustedNudityProbability = nudityProbability * 100;

        // Construct the combined message
        let combinedMessage = "";

     // Check firearm probability
        if (adjustedFirearmProbability < 50) {
            combinedMessage += '<span style="color: green;">Không có nội dung súng đạn, bạo lực</span><br>';
        } else {
            combinedMessage += '<span style="color: red;">Phát hiện ảnh có chứa súng đạn, bạo lực (' + adjustedFirearmProbability + '%) bạn vẫn muốn đăng?</span><br>';
        }

        // Check gore probability
        if (adjustedGoreProbability < 50) {
            combinedMessage += '<span style="color: green;">Không có nội dung máu me kinh hoàng</span><br>';
        } else {
            combinedMessage += '<span style="color: red;">Phát hiện ảnh có chứa nội dung máu me kinh hoàng (' + adjustedGoreProbability + '%) bạn vẫn muốn đăng?</span><br>';
        }

        // Check nudity probability
        if (adjustedNudityProbability < 50) {
            combinedMessage += '<span style="color: green;">Không có nội dung khiêu dâm</span>';
        } else {
            combinedMessage += '<span style="color: red;">Phát hiện ảnh có chứa nội dung khiêu dâm (' + adjustedNudityProbability + '%) bạn vẫn muốn đăng?</span>';
        }

        // Update the div content with the combined message
        document.getElementById("noffi-probability").innerHTML = combinedMessage;

        // Set hidden input value for firearm probability
        document.getElementById("checkvalueimg").value = adjustedFirearmProbability;
    } catch (error) {
        console.error('Error fetching data:', error);
        document.getElementById("firearm-probability").innerText = 'Lỗi vui lòng thử lại';
    }
}

// Handle when the user selects a new image file
document.getElementById('imageUpload').addEventListener('change', function(event) {
    const file = event.target.files[0];
    moderationImg(file);
});
</script>

		

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

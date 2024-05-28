<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="container">
	<!-- Section: Design Block -->
	<section class="text-center">
		<!-- Background image -->
		<div class="p-5 bg-image"
			style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
		<!-- Background image -->

		<div class="card mx-4 mx-md-5 shadow-5-strong bg-body-tertiary"
			style="margin-top: -100px; backdrop-filter: blur(30px);">
			<div class="card-body py-5 px-md-5">

				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h2 class="fw-bold mb-5">Login</h2>
						<form id="loginForm">
							<!-- Email input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<input type="email" id="email" name="email" class="form-control" />
								<label for="email" class="form-label">Email address</label>
							</div>

							<!-- Password input -->
							<div data-mdb-input-init class="form-outline mb-4">
								<input type="password" id="password" name="password" class="form-control" />
								<label class="form-label" for="password">Password</label>
							</div>
							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>
							<!-- Error message -->
							<div id="error-message" class="alert alert-danger" style="display:none;"></div>
							<!-- Register buttons -->
							<div class="text-center">
								<p>Not a member? <a href="<%=request.getContextPath()%>/register">Register</a></p>
								<p>or sign up with:</p>
								<button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
									<i class="fab fa-facebook-f"></i>
								</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Section: Design Block -->
</div>

<script>
$(document).ready(function(){
    $("#loginForm").submit(function(event){
        event.preventDefault(); // Prevent the default form submission

        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/ajaxLogin",
            data: {
                email: $("#email").val(),
                password: $("#password").val()
            },
            success: function(response) {
                if(response.status === "success") {
                    window.location.href = "<%=request.getContextPath()%>/";
                } else {
                    $("#error-message").text(response.message).show();
                }
            },
            error: function() {
                $("#error-message").text("An error occurred during login. Please try again.").show();
            }
        });
    });
});
</script>

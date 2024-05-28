<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<div class="container">
		<section class="text-center">
			<div class="p-5 bg-image"
				style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg'); height: 300px;"></div>
			<div class="card mx-4 mx-md-5 shadow-5-strong bg-body-tertiary"
				style="margin-top: -100px; backdrop-filter: blur(30px);">
				<div class="card-body py-5 px-md-5">
					<div class="row d-flex justify-content-center">
						<div class="col-lg-8">
							<h2 class="fw-bold mb-5">Sign up now</h2>
							<form id="registerForm"
								action="<%=request.getContextPath()%>/register" method="post">
								<!-- User Name input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="text" id="username" name="username"
										class="form-control" required /> <label class="form-label"
										for="username">User Name</label>
									<div id="usernameError" class="error text-danger"></div>
								</div>

								<!-- Birth Date input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="date" id="birthday" name="birthday"
										class="form-control" required /> <label class="form-label"
										for="birthday">Birth Date</label>
									<div id="birthdateError" class="error text-danger"></div>
								</div>

								<!-- Email input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="email" id="email" name="email"
										class="form-control" required /> <label class="form-label" for="email">Email
										address</label>
									<div id="emailError" class="error text-danger"></div>
								</div>

								<!-- Password input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="password" id="password" name="password"
										class="form-control" required /> <label class="form-label"
										for="password">Password</label>
									<div id="passwordError" class="error text-danger"></div>
								</div>

								<!-- Display error message -->
								<div id="errorMessage" class="text-danger mb-4"
									style="display: none;"></div>

								<!-- Submit button -->
								<button type="submit" id="registerButton"
									class="btn btn-primary btn-block mb-4">Sign up</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>

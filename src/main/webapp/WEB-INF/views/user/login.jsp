<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<title><spring:message code="login"/></title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css'/>">
<style>
#error-message {
	color: #721c24;
	padding: 10px;
}
</style>
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
							<h2 class="fw-bold mb-5"><spring:message code="login"/></h2>

							<form id="loginForm" name="loginForm" 
								action="<c:url value='/spring_security_login' />" method="post">
								<!-- Email input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="text" id="email" name="email" class="form-control"
										required="true" /> <label for="email" class="form-label"><spring:message code="emailofyou"/></label>
								</div>

								<!-- Password input -->
								<div data-mdb-input-init class="form-outline mb-4">
									<input type="password" id="password" name="password"
										class="form-control" required="true" /> <label
										class="form-label" for="password"><spring:message code="password"/></label>
								</div>

								<!-- Submit button -->
								<button type="submit" class="btn btn-primary btn-block mb-4"><spring:message code="login"/></button>
								<!-- Register buttons -->
								<div class="text-center">
									<p>
										<spring:message code="notaccount"/> <a href="<c:url value='/register'/>"><spring:message code="register"/>
									</a>
									</p>
									<p>	<spring:message code="logineuqal"/></p>
									<button type="button" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-link btn-floating mx-1">
										<i class="fab fa-facebook-f"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
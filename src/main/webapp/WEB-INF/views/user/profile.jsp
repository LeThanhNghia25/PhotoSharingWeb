<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<section class="h-100 gradient-custom-2">
	<div class="container-fluid">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-lg-9 col-xl-7">
				<div class="card">
					<div class="rounded-top text-white d-flex flex-row"
						style="background-color: #000; height: 200px;">
						<div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
							<img src="${user.avatar}" alt="Generic placeholder image"
								class="img-fluid img-thumbnail mt-4 mb-2"
								style="width: 150px; z-index: 1">
							
								<button type="button" class="btn btn-outline-dark"
									data-mdb-ripple-color="dark" style="z-index: 1;"
									onclick="window.location.href='${pageContext.request.contextPath}/editprofile'">
									<spring:message code="edit"/></button>
						
						</div>
						<div class="ms-3" style="margin-top: 130px;">
							<h5>${user.username}</h5>
							<p>${user.email}</p>
						</div>
					</div>

					<div class="p-4 text-black" style="background-color: #f8f9fa;">

						<div class="d-flex justify-content-end text-center py-1">

							<div>
								<p class="mb-1 h5">253</p>
								<p class="small text-muted mb-0"><spring:message code="photo"/></p>
							</div>
							<div class="px-3">
								<p class="mb-1 h5">1026</p>
								<p class="small text-muted mb-0"><spring:message code="folow"/></p>
							</div>
							<div>
								<p class="mb-1 h5">478</p>
								<p class="small text-muted mb-0">Following</p>
							</div>

						</div>
						
					</div>
					<div class="d-flex pt-1">
							<button type="button" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-outline-primary me-1 flex-grow-1">Chat</button>
							<button type="button" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-primary flex-grow-1">Follow</button>
						</div>
					<div class="card-body p-4 text-black">
						<div class="mb-5">
							<p class="lead fw-normal mb-1"><spring:message code="abme"/></p>
							<div class="p-4" style="background-color: #f8f9fa;">
								<p class="font-italic mb-1">${user.description}</p>

							</div>
						</div>
						<div
							class="d-flex justify-content-between align-items-center mb-4">
							<p class="lead fw-normal mb-0"><spring:message code="myab"/></p>
							<p class="mb-0">
								<a href="#!" class="text-muted"><spring:message code="all"/></a>
							</p>
						</div>
						<!--boar index -->
						<!--boar index -->
						<div class="container py-2 topboar">

							<div class="row" data-masonry='{"percentPosition": true }'>
								<c:forEach var="img" items="${imgs}">
									<div class="col-6 col-md-4 col-xl-3 py-3">
										<div class="bg-image hover-overlay shadow-1-strong rounded"
											data-mdb-ripple-init data-mdb-ripple-color="light">
											<img src="${img.img}" class="w-100 rounded-15px" alt="" /> <a
												href="detai?fromitem=${img.id}">
												<div class="mask"
													style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
											</a>
										</div>
									</div>
								</c:forEach>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
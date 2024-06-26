<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Add Font Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Liên kết file CSS riêng -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/details.css">

<div class="container">
	<div class="row">
		<div class="col-md-12 content-wrapper">
			<div class="row">
				<div class="col-md-8">
					<!-- Display Image -->
					<img src="${img.img}" class="img-fluid" alt="${img.title}">
				</div>
				<div class="col-md-4">
					<h3>${img.title}</h3>
					<p>${img.content}</p>
					<!-- Hiển thị avatar và tên người đăng hình -->
					<div class="media mt-3 d-flex align-items-center">
						<a href="profile?id=${img.userid}"> <img
							src="${img.creator.avatar}" class="mr-3 rounded-circle"
							alt="User Avatar" style="width: 50px;">
						</a>
						<div class="media-body">
							<h6 class="mt-0">
								<a href="profile?id=${img.userid}">${img.creator.username}</a>
							</h6>
							<p class="mt-0">${img.creator.email}</p>
						</div>
					</div>

					<br>
					<!-- Like and Share Buttons -->
					<div class="mt-3">
						<button class="btn btn-outline-primary" onclick="likeImage()">Thích</button>
						<button class="btn btn-outline-secondary" onclick="shareImage()">Chia
							sẻ</button>
					</div>
					<!-- Comments Section -->
					<div id="comments" class="mt-3">
						<h5>Bình luận</h5>
						<div class="comment-frame">
							<c:forEach var="comment" items="${comments}">
								<div class="media mb-3 media-comment">
									<img src="${comment.creator.avatar}"
										class="mr-3 rounded-circle" alt="User Avatar"
										style="width: 50px;">
									<div class="media-body">
										<h6 class="mt-0">${comment.creator.username}</h6>
										<p>${comment.content}</p>
										<p style="font-size: smaller;">${comment.createdTime}</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<!-- Comment Form -->
					<c:if test="${not empty pageContext.request.userPrincipal}">
						<div class="comment-form-wrapper">
							<form:form modelAttribute="comment" action="submitComment?fromitem=${img.id}"
								method="post">
								<div class="input-group">
								  <form:hidden path="idpost" value="${img.id}" />
									<form:textarea path="content" class="form-control" rows="3"
										placeholder="Thêm bình luận" />
									<div class="input-group-append">
										<button type="submit" class="btn btn-primary">
											<i class="fas fa-paper-plane"></i>
										</button>
									</div>
								</div>
							</form:form>

						</div>
					</c:if>
					<c:if test="${empty pageContext.request.userPrincipal}">
						<p>Bạn cần đăng nhập để có thể bình luận</p>
						<button id="loginButton" data-mdb-ripple-init type="button"
							class="btn btn-link px-3 me-2"
							onclick="window.location.href='${pageContext.request.contextPath}/login'">Đăng
							nhập</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

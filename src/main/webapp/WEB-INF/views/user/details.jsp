<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Add Font Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Liên kết file CSS riêng -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/details.css">

<div class="container">
	<div class="row">
		<div class="col-md-12 content-wrapper">
			<div class="row">
				<div class="col-md-8">
					<c:if test="${not empty img.img}">
						<img src="${img.img}" class="img-fluid img-rounded"
							alt="${img.title}">
					</c:if>
					<c:if test="${empty img.img}">
						<p>Image not found.</p>
					</c:if>
				</div>
				<div class="col-md-4">
					<h3>${img.title}</h3>
					<p>${img.content}</p>
					<!-- Hiển thị avatar và tên người đăng hình -->
					<div class="media mt-3 d-flex align-items-center">
						<img src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
							class="mr-3 rounded-circle" alt="User Avatar"
							style="width: 50px;">
						<div class="media-body">
							<h6 class="mt-0">User Name</h6>
						</div>
					</div>
					<br>
					<!-- Comments Section -->
					<div id="comments" class="mt-3">
						<h5>Comments</h5>
						<div class="comment-frame">
							<c:forEach var="comment" items="${img.commnet}">
								<div class="media mb-3 media-comment">
									<img src="path/to/avatar.jpg" class="mr-3 rounded-circle"
										alt="User Avatar" style="width: 50px;">
									<div class="media-body">
										<h6 class="mt-0">${comment.user.username}</h6>
										<p>${comment.content}</p>
									</div>
								</div>
							</c:forEach>
							<c:if test="${empty img.commnet}">
								<p>No comments yet. Be the first to comment.</p>
							</c:if>
						</div>
					</div>

					<!-- Comment Form -->
					<div class="comment-form-wrapper">
						<form id="commentForm">
							<div class="input-group">
								<textarea id="commentText" class="form-control" rows="3"
									placeholder="Add a comment"></textarea>
								<div class="input-group-append">
									<button type="button" class="btn btn-primary"
										onclick="submitComment(${img.id})">
										<i class="fas fa-paper-plane"></i>
									</button>
								</div>
							</div>
						</form>
					</div>

					<!-- Like and Share Buttons -->
					<div class="mt-3">
						<button class="btn btn-outline-primary"
							onclick="likeImage(${img.id})">Like</button>
						<button class="btn btn-outline-secondary"
							onclick="shareImage(${img.id})">Share</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

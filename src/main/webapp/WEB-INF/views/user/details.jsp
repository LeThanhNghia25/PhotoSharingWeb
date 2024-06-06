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
				</div>
				<div class="col-md-4">
					<h3>title</h3>
					<p>conten</p>
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
							
								<div class="media mb-3 media-comment">
									<img src="path/to/avatar.jpg" class="mr-3 rounded-circle"
										alt="User Avatar" style="width: 50px;">
									<div class="media-body">
										<h6 class="mt-0">username</h6>
										<p>content</p>
									</div>
								</div>

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
										onclick="submitComment()">
										<i class="fas fa-paper-plane"></i>
									</button>
								</div>
							</div>
						</form>
					</div>

					<!-- Like and Share Buttons -->
					<div class="mt-3">
						<button class="btn btn-outline-primary"
							onclick="likeImage()">Like</button>
						<button class="btn btn-outline-secondary"
							onclick="shareImage()">Share</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

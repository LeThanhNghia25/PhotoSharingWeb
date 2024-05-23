<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--boar index -->
<c:forEach var="user" items="${users}">
	<h1>${user.username}</h1>
	<h1>${user.password}</h1>
</c:forEach>
<div class="container py-2 topboar">
	<div class="row" data-masonry='{"percentPosition": true }'>
		<div class="col-6 col-md-4 col-xl-3 py-3">
			<div class="bg-image hover-overlay shadow-1-strong rounded"
				data-mdb-ripple-init data-mdb-ripple-color="light">
				<img src="resources/img/1.jpg" class="w-100 rounded-15px" alt="" />
				<a href="details.html">
					<div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
				</a>
			</div>
		</div>

		<div class="col-6 col-md-4 col-xl-3 py-3">
			<div class="bg-image hover-overlay shadow-1-strong rounded"
				data-mdb-ripple-init data-mdb-ripple-color="light">
				<img src="resources/img/2.webp" class="w-100 rounded-15px" alt="" />
				<a href="details.html">
					<div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
				</a>
			</div>
		</div>

		<div class="col-6 col-md-4 col-xl-3 py-3">
			<div class="bg-image hover-overlay shadow-1-strong rounded"
				data-mdb-ripple-init data-mdb-ripple-color="light">
				<img src="resources/img/3.webp" class="w-100 rounded-15px" alt="" />
				<a href="details.html">
					<div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
				</a>
			</div>
		</div>

		<div class="col-6 col-md-4 col-xl-3 py-3">
			<div class="bg-image hover-overlay shadow-1-strong rounded"
				data-mdb-ripple-init data-mdb-ripple-color="light">
				<img src="resources/img/4.png" class="w-100 rounded-15px" alt="" />
				<a href="details.html">
					<div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
				</a>
			</div>
		</div>

		<div class="col-6 col-md-4 col-xl-3 py-3">
			<div class="bg-image hover-overlay shadow-1-strong rounded"
				data-mdb-ripple-init data-mdb-ripple-color="light">
				<img src="resources/img/5.jpg" class="w-100 rounded-15px" alt="" />
				<a href="details.html">
					<div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
				</a>
			</div>
		</div>

		<div class="col-6 col-md-4 col-xl-3 py-3">
			<div class="bg-image hover-overlay shadow-1-strong rounded"
				data-mdb-ripple-init data-mdb-ripple-color="light">
				<img src="resources/img/6.png" class="w-100 rounded-15px" alt="" />
				<a href="details.html">
					<div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
				</a>
			</div>
		</div>

		<div class="col-6 col-md-4 col-xl-3 py-3">
			<div class="bg-image hover-overlay shadow-1-strong rounded"
				data-mdb-ripple-init data-mdb-ripple-color="light">
				<img src="resources/img/7.jpg" class="w-100 rounded-15px" alt="" />
				<a href="details.html">
					<div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
				</a>
			</div>
		</div>
	</div>
</div>

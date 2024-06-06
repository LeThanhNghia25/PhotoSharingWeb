<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--boar index -->
<div class="container py-2 topboar">

	<div class="row" data-masonry='{"percentPosition": true }'>
		<c:forEach var="img" items="${imgs}">
			<div class="col-6 col-md-4 col-xl-3 py-3">
				<div class="bg-image hover-overlay shadow-1-strong rounded"
					data-mdb-ripple-init data-mdb-ripple-color="light">
					<img src="${img.img}" class="w-100 rounded-15px" alt="" /> <a
						href="detail">
						<div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>

</div>

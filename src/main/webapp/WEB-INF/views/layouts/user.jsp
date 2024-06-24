<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title><decorator:title default="PhotoSharing" /></title>
<!-- MDB icon -->

<link rel="icon" href=" <c:url value="resources/avatar/logo.png" />"
	type="image/png">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
<!-- MDB -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/mdb.min.css" /> " />
<!-- masonry -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js"></script>
<!-- BT5 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="<c:url value="/resources/css/user.css" />" />
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/layouts/user/header.jsp"%>
	<!--boar index -->
	<decorator:body />

	<section class="">
		<%@ include file="/WEB-INF/views/layouts/user/footer.jsp"%>
	</section>
	<!--boar index -->
	<!-- End your project here-->
	<!-- MDB -->
	<script type="text/javascript"
		src="<c:url value="/resources/js/mdb.umd.min.js" /> " /></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	type="image/png" />
<title><decorator:title default="PhotoSharing-Admin" /></title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.0.0/css/all.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
<!-- MDB -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/mdb.min.css" />" />
<!-- Custom styles -->
<link rel="stylesheet" href="<c:url value="/resources/css/admin.css" />" />

</head>
<body>
	<%@ include file="/WEB-INF/views/layouts/admin/header.jsp"%>
	<!--boar index -->
	<decorator:body />
	<section class="">
		<%@ include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
	</section>
	<!--boar index -->
	<!-- End your project here-->
	<!-- MDB -->
	<script type="text/javascript"
		src="<c:url value="/resources/js/mdb.umd.min.js" /> " /></script>
	<!--Main layout-->
	<!-- Custom scripts -->
	<script type="text/javascript" src="/resources/js/admin.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    /* CSS cho trang searchResults.jsp */
    body {
        padding-top: 20px; /* Khoảng cách từ đỉnh trang đến phần nội dung */
    }

    @media (max-width: 991.98px) {
        body {
            padding-top: 56px; /* Điều chỉnh cho responsive khi màn hình nhỏ hơn */
        }
    }

    .container {
        margin-top: 10px; /* Đảm bảo khoảng cách từ header xuống nội dung */
    }
    
    /* Thiết lập cấu trúc grid */
    .row {
        display: flex;
        flex-wrap: wrap;
        margin: 0 -15px; /* Để xử lý khoảng cách giữa các cột */
    }

    .col-6 {
        flex: 0 0 50%; /* 50% width cho màn hình lớn (xl) trở xuống */
        max-width: 50%;
        padding: 0 15px; /* Để tạo khoảng cách giữa các cột */
    }

    @media (min-width: 768px) {
        .col-md-4 {
            flex: 0 0 33.3333%; /* 33.3333% width cho màn hình trung bình (md) trở lên */
            max-width: 33.3333%;
        }
    }

    @media (min-width: 992px) {
        .col-xl-3 {
            flex: 0 0 25%; /* 25% width cho màn hình lớn (xl) */
            max-width: 25%;
        }
    }
</style>

<div class="container py-2 topboar">
    <div class="row">
        <h2>Kết quả tìm kiếm cho từ khóa "${search_name}" :</h2>
        <c:choose>
            <c:when test="${not empty imgs}">
                <c:forEach var="img" items="${imgs}">
                    <div class="col-6 col-md-4 col-xl-3 py-3">
                        <div class="bg-image hover-overlay shadow-1-strong rounded"
                             data-mdb-ripple-init data-mdb-ripple-color="light">
                            <img src="${img.img}" class="w-100 rounded-15px" alt="" />
                            <a href="detail?fromitem=${img.id}">
                                <div class="mask" style="background-color: hsla(0, 0%, 98%, 0.2)"></div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <h3>Không tìm thấy hình ảnh</h3>
            </c:otherwise>
        </c:choose>
    </div>
</div>

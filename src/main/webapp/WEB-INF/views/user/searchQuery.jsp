<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.custom-container {
	max-width: 1000px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

h3 {
	text-align: center;
}

.search-box {
	display: flex;
	margin-bottom: 20px;
}
#show-more-button {
	padding: 8px 12px; /* Giảm kích thước nút */
	font-size: 14px; /* Giảm kích thước chữ */
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
}
#search-input {
	flex: 1;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px 0 0 5px;
}

#search-button {
	padding: 8px 12px; /* Giảm kích thước nút */
	font-size: 14px; /* Giảm kích thước chữ */
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
}

.search-results {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	grid-gap: 20px;
}

.bg-image {
	position: relative;
	overflow: hidden;
}

.bg-image img {
	display: block;
	width: 100%;
	height: auto;
}

.mask {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	transition: opacity 0.3s ease;
	background-color: rgba(255, 255, 255, 0.5);
}

.bg-image:hover .mask {
	opacity: 1;
}

.shadow-1-strong {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.rounded-15px {
	border-radius: 15px;
}

@media ( max-width : 768px) {
	.col-6, .col-md-4, .col-xl-3 {
		width: calc(50% - 20px);
	}
}

@media ( max-width : 576px) {
	.col-6, .col-md-4, .col-xl-3 {
		width: 100%;
	}
}
</style>
<br>
<div class="custom-container">
	<h3><spring:message code="searchspeed"/></h3>
	<div class="search-box">
		<input type="text" id="search-input" placeholder="Nhập từ khóa...">
		<button id="search-button"><spring:message code="search"/></button>
	</div>
	<div class="search-results"></div>
	<button id="show-more-button" style="display: none;"><spring:message code="more"/></button>
</div>
<script>
        const accessKey = "6WT3YJ05_Xl2CtqBFv2SFCxFzHKh9sOiSFgN_waXjBQ";
        const searchInput = document.getElementById("search-input");
        const searchButton = document.getElementById("search-button");
        const searchResults = document.querySelector(".search-results");
        const showMoreButton = document.getElementById("show-more-button");

        let inputData = "";
        let page = 1;

        const fetchData = async (reset = false) => {
            if (reset) {
                page = 1;
                searchResults.innerHTML = "";
            }

            if (!inputData.trim()) {
                alert("Vui lòng nhập từ khóa tìm kiếm.");
                return;
            }

            const url = `https://api.unsplash.com/search/photos?page=${page}&query=${inputData}&client_id=${accessKey}`;

            try {
                const response = await fetch(url);
                if (!response.ok) throw new Error("Lỗi khi tải dữ liệu");
                const data = await response.json();

                if (data.results.length === 0) {
                    alert("Không tìm thấy kết quả.");
                    return;
                }

                data.results.forEach((result) => {
                    const colDiv = document.createElement("div");
                    colDiv.className = "bg-image hover-overlay shadow-1-strong rounded";

                    const image = document.createElement("img");
                    image.src = result.urls.regular;
                    image.className = "w-100 rounded-15px";
                    image.alt = result.alt_description || "";

                    const link = document.createElement("a");
                    link.href = result.urls.full;
                    link.target = "_blank";

                    const maskDiv = document.createElement("div");
                    maskDiv.className = "mask";
                    maskDiv.style.backgroundColor = "hsla(0, 0%, 98%, 0.2)";

                    link.appendChild(maskDiv);
                    colDiv.appendChild(image);
                    colDiv.appendChild(link);
                    searchResults.appendChild(colDiv);
                });

                if (data.total_pages === page) {
                    showMoreButton.style.display = "none";
                } else {
                    showMoreButton.style.display = "block";
                }

                page++;
            } catch (error) {
                console.error(error);
                alert("Đã xảy ra lỗi khi tải dữ liệu.");
            }
        };

        searchButton.addEventListener("click", () => {
            inputData = searchInput.value;
            fetchData(true);
        });

        showMoreButton.addEventListener("click", () => {
            fetchData();
        });
    </script>

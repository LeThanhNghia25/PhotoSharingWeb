<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Unsplash Image Search</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      flex-direction: column;
    }

    .container {
      text-align: center;
      width: 100%;
    }

    h1 {
      margin-bottom: 20px;
    }

    .search-container {
      margin-bottom: 20px;
    }

    #search-input {
      width: 300px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    #search-button {
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      background-color: #007bff;
      color: #fff;
      cursor: pointer;
    }

    #search-button:hover {
      background-color: #0056b3;
    }

    .search-results {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
      margin-top: 20px;
    }

    .search-results img {
      max-width: 200px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s;
    }

    .search-results img:hover {
      transform: scale(1.05);
    }

    #show-more-button {
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      background-color: #28a745;
      color: #fff;
      cursor: pointer;
      margin-top: 20px;
      margin: 20px auto 0;
      display: block;
    }

    #show-more-button:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Unsplash Image Search</h1>
    <div class="search-container">
      <input type="text" id="search-input" placeholder="Search for images...">
      <button id="search-button">Search</button>
    </div>
    <div class="search-results"></div>
    <button id="show-more-button" style="display: none;">Show More</button>
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
        alert("Please enter a search term.");
        return;
      }

      const url = `https://api.unsplash.com/search/photos?page=${page}&query=${inputData}&client_id=${accessKey}`;

      try {
        const response = await fetch(url);
        if (!response.ok) throw new Error("Failed to fetch data");
        const data = await response.json();

        if (data.results.length === 0) {
          alert("No results found.");
          return;
        }

        data.results.forEach((result) => {
          const image = document.createElement("img");
          image.src = result.urls.regular;
          image.alt = result.alt_description;

          const link = document.createElement("a");
          link.href = result.urls.full;
          link.target = "_blank";

          link.appendChild(image);
          searchResults.appendChild(link);
        });

        if (data.total_pages === page) {
          showMoreButton.style.display = "none";
        } else {
          showMoreButton.style.display = "block";
        }

        page++;
      } catch (error) {
        console.error(error);
        alert("An error occurred while fetching the data.");
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
</body>
</html>

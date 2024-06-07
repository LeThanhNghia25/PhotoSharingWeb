 document.getElementById('checkImage').addEventListener('click', () => {
            const fileInput = document.getElementById('imageUpload');
            const file = fileInput.files[0];
            if (!file) {
                alert('Vui lòng chọn một tệp hình ảnh trước.');
                return;
            }

            // Tạo một đối tượng FormData
            const formData = new FormData();
            formData.append('media', file);
            formData.append('models', 'nudity-2.0,weapon,celebrities,gore,qr-content');
            formData.append('api_user', '1046694070');
            formData.append('api_secret', '5njUn86MUDjfxrus8B5VvcLiB2G8kpbX');

            // Định nghĩa API endpoint
            const apiUrl = 'https://api.sightengine.com/1.0/check.json';

            // Sử dụng fetch để thực hiện yêu cầu POST
            fetch(apiUrl, {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Lỗi HTTP! Trạng thái: ${response.status}`);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Phản hồi API:', data);
                    document.getElementById('result').textContent = JSON.stringify(data, null, 2);
                })
                .catch(error => {
                    console.error('Lỗi khi lấy dữ liệu từ API Sightengine:', error);
                    document.getElementById('result').textContent = `Lỗi: ${error.message}`;
                });
        });
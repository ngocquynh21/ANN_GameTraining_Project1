# 1. Chọn hệ điều hành có sẵn Python 3.9
FROM python:3.9-slim

# 2. Cài đặt các thư viện hệ thống cần cho đồ họa game (pygame)
RUN apt-get update && apt-get install -y \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Tạo thư mục làm việc chính trong Docker
WORKDIR /app

# 4. Chép file danh sách thư viện vào và cài đặt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. HỐT TRỌN Ổ: Chép tất cả file dự án (Main.py, Lander.py,...) vào Docker
COPY . .

# 6. Lệnh để chạy game khi mở Container
CMD ["python", "Main.py"]
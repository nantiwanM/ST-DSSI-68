FROM python:3.12

# ติดตั้ง Node.js และ npm
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# สร้าง working dir
WORKDIR /app

# Copy ไฟล์ทั้งหมด
COPY . .

# ติดตั้ง Python dependencies ก่อน
RUN pip install -r requirements.txt

# ติดตั้ง npm dependencies
WORKDIR /app/theme/static_src
RUN npm install

# กลับมา working directory ที่ /app
WORKDIR /app

# รันคำสั่ง migrate ก่อน แล้วตามด้วย runserver บน 0.0.0.0:8000
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]

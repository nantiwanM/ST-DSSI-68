FROM python:3.12

# ติดตั้ง Node.js และ npm และ mysqladmin
RUN apt-get update && \
    apt-get install -y curl default-mysql-client && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# ตั้ง working directory
WORKDIR /app

# ติดตั้ง Python dependencies (ใช้ cache)
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอก source code ทั้งหมด
COPY . .

# ติดตั้ง npm dependencies
WORKDIR /app/theme/static_src
RUN npm install

# กลับมา working directory หลัก
WORKDIR /app
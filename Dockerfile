FROM python:3.12

# ติดตั้ง Node.js, npm และ dockerize (ใช้รอ DB พร้อม)
RUN apt-get update && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs wget && \
    npm install -g npm@latest && \
    wget https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.6.1.tar.gz && \
    rm dockerize-linux-amd64-v0.6.1.tar.gz && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# ตั้ง working directory
WORKDIR /app

# ติดตั้ง Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอก package.json
COPY theme/static_src/package*.json /app/theme/static_src/

# ติดตั้ง npm dependencies
WORKDIR /app/theme/static_src
RUN npm install && npm run build

# คัดลอก source code ที่เหลือ
WORKDIR /app
COPY . .

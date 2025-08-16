### Stage 1: Frontend (Tailwind)
FROM node:20 AS frontend

WORKDIR /app/theme/static_src

# ติดตั้ง dependencies
COPY theme/static_src/package*.json ./
RUN npm install

COPY /theme/static_src ./
RUN npm run build

### Stage 2: Backend (Python + Django)
FROM python:3.12

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Python requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# คัดลอกไฟล์ static/dist ที่ build แล้วจาก frontend stage
COPY --from=frontend /app/theme/static/css/dist /app/theme/static/css/dist

# CN Style Shop Web Application

เว็บแอปพลิเคชันสำหรับขายเสื้อผ้าแฟชั่นออนไลน์จากประเทศจีน พัฒนาด้วย Django เป็น Framework หลักในการพัฒนา ร่วมกับฐานข้อมูล MySQL และใช้ HTML CSS JavaScript HTMX Tailwind CSS และ Daisy UI ในการออกแบบและตกแต่งหน้าเว็บ

<br>

## :gear: วิธีติดตั้งและรันโปรเจกต์


###  ตัวเลือกที่ 1: รันด้วย Docker (แนะนำ)
>ไม่ต้องติดตั้ง Python, Node.js, MySQL บนเครื่อง เพียงแค่มี Docker ก็สามารถรันโปรเจกต์นี้ได้ทันที

#### 1.1 ติดตั้ง Docker และเปิดการใช้งาน
- ดาวน์โหลด: https://docs.docker.com/desktop/setup/install/windows-install/
- ตรวจสอบเวอร์ชัน:
  ```bash
  docker --version
  ````
#### 1.2 Clone โปรเจกต์จาก GitHub

- ใช้คำสั่ง:

  ```bash
  gh repo clone nantiwanM/ST-DSSI-68
  ```

  หรือ

  ```bash
  git clone https://github.com/nantiwanM/ST-DSSI-68.git
  ```
- เข้าไปยังโฟลเดอร์โปรเจกต์

  ```bash
  cd ST-DSSI-68
  ```
  <p align="center">
    <img src="https://github.com/user-attachments/assets/b563d7ba-1cb2-4a0c-b032-d7fcf3613119" alt="clone" width="500"/>
  </p>
  
#### 1.3 ตรวจสอบพอร์ต (8000, 3307)
> ⚠️ **ตรวจสอบพอร์ตก่อนรัน**
> เปิด Command Prompt หรือ PowerShell ใช้คำสั่งตรวจสอบพอร์ต 8000 (เว็บ) และ 3306 (MySQL) ว่างหรือไม่
>
> ```bash
> netstat -aon | findstr :8000
> netstat -aon | findstr :3307
> ```
>
> **ถ้าไม่มีผลลัพธ์สามารถใช่ได้** แต่ถ้ามีผลลัพธ์แปลว่าพอร์ตกำลังถูกใช้งาน
> ให้ปิดโปรแกรมที่ใช้พอร์ตนี้ หรือ เปลี่ยนพอร์ตใน `docker-compose.yml` เช่น `8080:8000` หรือ `3306:3306`
>
> **หมายเหตุ:** หากเปลี่ยนพอร์ต MySQL ไม้ต้องแก้ไขพอร์ตใน settings.py ในโปรเจกต์


#### 1.4 รันโปรเจกต์ด้วย Docker
```bash
docker compose up -d --build
```
<p align="center">
  <img src="https://github.com/user-attachments/assets/1ee826ae-a789-4850-a311-c89858bc12df" alt="clone" width="700"/>
</p>

#### 1.5 เข้าใช้งาน
เปิดเว็บเบราว์เซอร์แล้วเข้า:: http://localhost:8000 หรือ http://localhost:8080/ ถ้าเปลี่ยนพอร์ต
>หากหน้าเว็บยังไม่ขึ้นให้รอสักครู่ และลองรีเฟรชหน้าเว็บอีกครั้ง

<br>

---

<br>

### ตัวเลือกที่ 2: ติดตั้งและรันแบบปกติ

#### 2.1 Requirements (ข้อกำหนดเบื้องต้น) :memo: 
ก่อนเริ่มติดตั้งโปรเจกต์นี้ กรุณาตรวจสอบว่าเครื่องของคุณมีเครื่องมือและซอฟต์แวร์ดังต่อไปนี้

**1. Python (เวอร์ชัน 3.8 ขึ้นไป)**
- ดาวน์โหลด: https://www.python.org/downloads/
- ตรวจสอบเวอร์ชัน:
  ```bash
  python --version
  ````

**2. Node.js**
>Tailwind CSS ใช้ Node.js และ npm สำหรับจัดการ frontend dependencies และคอมไพล์ CSS
- ดาวน์โหลด: https://nodejs.org/en/download
- ตรวจสอบเวอร์ชัน:

    ```bash
    node -v
    npm -v
    ```

**3. MySQL และ MySQL Workbench** 
>ขณะติดตั้งผ่าน MySQL Installer จะมีขั้นตอนให้ตั้งรหัสผ่านของผู้ใช้ `root` กรุณาจดหรือบันทึกรหัสผ่านนี้ไว้ เนื่องจากจำเป็นต้องใช้ในการเชื่อมต่อฐานข้อมูล
- ดาวน์โหลด MySQL Community Server (แนะนำเวอร์ชัน 8.0.42 ขึ้นไป): https://dev.mysql.com/downloads/mysql/
- ดาวน์โหลด MySQL Workbench: https://dev.mysql.com/downloads/workbench/

<br>

#### 2.2 ขั้นตอนติดตั้ง :gear: 

**1. Clone โปรเจกต์จาก GitHub**

- ใช้คำสั่ง:

  ```bash
  gh repo clone nantiwanM/ST-DSSI-68
  ```

  หรือ

  ```bash
  git clone https://github.com/nantiwanM/ST-DSSI-68.git
  ```
- เข้าไปยังโฟลเดอร์โปรเจกต์

  ```bash
  cd ST-DSSI-68
  ```
<p align="center">
  <img src="https://github.com/user-attachments/assets/b563d7ba-1cb2-4a0c-b032-d7fcf3613119" alt="clone" width="500"/>
</p>

**2. สร้าง virtual environment และเปิดใช้งาน (สำหรับ Windows)**

  ```bash
  python -m venv venv
  venv\Scripts\activate
  ```
<p align="center">
  <img src="https://github.com/user-attachments/assets/408d3121-8647-4646-ba86-2d90d97322d2" alt="environment" width="500"/>
</p>

**3. ติดตั้ง Python dependencies**

  ```bash
  pip install -r requirements.txt
  ```
<p align="center">
  <img src="https://github.com/user-attachments/assets/c0d8f157-66de-499d-b30c-7e18196f1e25" alt="install requirements" width="500"/>
</p>

**4. ติดตั้ง npm dependencies สำหรับ Tailwind CSS**

- เข้าไปยังโฟลเดอร์ที่เก็บไฟล์ frontend

  ```bash
  cd theme/static_src
  ```
- ติดตั้ง npm packages

  ```bash
  npm install
  ```
- กลับไปยังโฟลเดอร์โปรเจกต์หลัก
  ```bash
  cd ../../
  ```
  <p align="center">
    <img src="https://github.com/user-attachments/assets/94413427-2c21-4e83-80ed-4af74ae10e21" alt="npm" width="500"/>
  </p>
  
  >จากนั้นเปิดโปรเจกต์ด้วยโปรแกรมแก้ไขโค้ดที่คุณสะดวก (เช่น VS Code, PyCharm ฯลฯ) หากใช้ VS Code สามารถใช้คำสั่ง: `code .`

**5. ตั้งค่า Database**

5.1 สร้าง Schema ชื่อ `cnstyleshop` ใน MySQL Workbench
>เปิด MySQL Workbench
>คลิกที่ Connection ที่ชื่อว่า Local instance MySQL (หรือชื่ออื่นที่คุณเคยตั้งไว้)
>ใส่รหัสผ่าน MySQL (ตั้งไว้ตอนติดตั้ง MySQL) เพื่อเข้าสู่หน้าหลัก

<p align="center">
    <img src="https://github.com/user-attachments/assets/6728de63-048e-41d3-b302-124e3d963b5d" alt="MySQL1" width="700"/>
</p>

>ที่แถบด้านซ้ายกดไอคอน Create a new Schema
>ตรงช่อง Name: ตั้งชื่อว่า **cnstyleshop** แล้วกด Apply
>จะมีหน้าต่าง SQL Preview ขึ้นมา กด Apply อีกครั้ง เมื่อเห็นข้อความ Success กด Finish

<p align="center">
  <img src="https://github.com/user-attachments/assets/f9d4e47f-43cc-47f8-94e8-df91f3e3287b" alt="MySQL1" width="700"/>
</p>

5.2 แก้ไขการเชื่อมต่อฐานข้อมูลใน Django
>ไปที่โปรเจกต์ Django (โฟลเดอร์ CNStyleShop) เปิดไฟล์ settings.py ไปที่ส่วน DATABASES (บรรทัดที่ 96–112) และทำการแก้ไข HOST ให้เป็น `root` และ PASSWORD ให้ตรงกับที่ตั้งไว้ตอนติดตั้ง MySQL

<p align="center">
  <img src="https://github.com/user-attachments/assets/4b35fd8a-5db5-42b6-a858-3541b11aa8cf" alt="MySQL1" width="700"/>
</p>

รันคำสั่ง migrate เพื่อสร้างตารางในฐานข้อมูล

  ```bash
  python manage.py migrate
  ```

<p align="center">
  <img src="https://github.com/user-attachments/assets/45223bff-aa7a-416a-a1f4-b7c9fdf933c0" alt="migrate" width="700"/>
</p>

>  :warning: **ถ้าไม่มี MySQL ติดตั้งไว้**<br>
> สามารถใช้ SQLite แทนได้ง่ายๆ โดยแก้ไฟล์ `settings.py`บรรทัดที่ 113
> ```python
> DATABASES['default'] = DATABASES['sqlite3']
> ```

**6. รัน Tailwind CSS**

  ```bash
  python manage.py tailwind start
  ```
<p align="center">
  <img src="https://github.com/user-attachments/assets/a761fb5f-3b14-4009-839a-7a27c1b2e610" alt="tailwind start" width="700"/>
</p>

**7. รัน Django**
>เปิดอีกหน้าต่างหนึ่งของ PowerShell หรือ Command Prompt แล้วรันคำสั่ง

  ```bash
  python manage.py runserver
  ```
<p align="center">
  <img src="https://github.com/user-attachments/assets/079f40f1-808f-4a90-8374-64d8c6676dbd" alt="runserver" width="700"/>
</p>

---
<br>
เพิ่มเติม

**👤 สร้าง Superuser (สำหรับเข้าสู่ระบบ Django Admin)**
```bash
python manage.py createsuperuser
```

> ตัวอย่างข้อมูล: Username: `admin`, Email: `admin@gmail.com`, Password: `1234`

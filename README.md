# CN Style Shop Web Application

เว็บแอปพลิเคชันสำหรับขายเสื้อผ้าแฟชั่นออนไลน์จากประเทศจีน พัฒนาด้วย Django เป็น Framework หลักในการพัฒนา ร่วมกับฐานข้อมูล MySQL และใช้ HTML CSS JavaScript HTMX Tailwind CSS และ Daisy UI ในการออกแบบและตกแต่งหน้าเว็บ

---

### Requirements (ข้อกำหนดเบื้องต้น)
ก่อนเริ่มติดตั้งโปรเจกต์นี้ กรุณาตรวจสอบว่าเครื่องของคุณมีเครื่องมือและซอฟต์แวร์ดังต่อไปนี้

#### 1. Python (เลือกดาวน์โหลดเวอร์ชัน 3.8 ขึ้นไป)
- ดาวน์โหลด: https://www.python.org/downloads/
- ตรวจสอบเวอร์ชัน:
  ```bash
  python --version
  ````

#### 2. Node.js
>Tailwind CSS ใช้ Node.js และ npm สำหรับจัดการ frontend dependencies และคอมไพล์ CSS
- ดาวน์โหลด: https://nodejs.org/en/download
- ตรวจสอบเวอร์ชัน:

    ```bash
    node -v
    npm -v
    ```

#### 3. MySQL และ MySQL Workbench 
>ขณะติดตั้งผ่าน MySQL Installer จะมีขั้นตอนให้ตั้งรหัสผ่านของผู้ใช้ `root` กรุณาจดหรือบันทึกรหัสผ่านนี้ไว้ เนื่องจากจำเป็นต้องใช้ในการเชื่อมต่อฐานข้อมูล
- ดาวน์โหลด MySQL Community Server (แนะนำเวอร์ชัน 8.0.42 ขึ้นไป):: https://dev.mysql.com/downloads/mysql/
- ดาวน์โหลด MySQL Workbench: https://dev.mysql.com/downloads/workbench/

---

### ขั้นตอนติดตั้ง

#### 1. Clone โปรเจกต์จาก GitHub

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

#### 2. สร้าง virtual environment และเปิดใช้งาน (สำหรับ Windows ใน cmd)

- สร้าง venv

  ```bash
  python -m venv venv
  ```
- เปิดใช้งาน

  ```bash
  venv\Scripts\activate
  ```

#### 3. ติดตั้ง Python dependencies

- รันคำสั่ง

  ```bash
  pip install -r requirements.txt
  ```

#### 4. ติดตั้ง npm dependencies สำหรับ Tailwind CSS

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
  
#### 6. ตั้งค่า Database

- สร้าง Schema ชื่อ **cnstyleshop** ใน MySQL Workbench
- แก้ไขข้อมูลผู้ใช้ (username) และรหัสผ่านของ MySQL ในไฟล์ `settings.py`
  ที่ส่วน `DATABASES` (บรรทัดที่ 96)
- รันคำสั่ง migrate เพื่อสร้างตารางในฐานข้อมูล

  ```bash
  python manage.py migrate
  ```

> หากไม่ใช้ MySQL หรือไม่มี MySQL ติดตั้งไว้
> สามารถเปลี่ยนไปใช้ SQLite ได้โดยแก้ไข `DATABASES` ในไฟล์ `settings.py` (บรรทัดที่ 113)
> ให้เปลี่ยนเป็น
>
> ```python
> DATABASES['default'] = DATABASES['sqlite3']
> ```

#### 7. เริ่มต้น Tailwind CSS

  ```bash
  python manage.py tailwind start
  ```

#### 8. รัน Django development server

  ```bash
  python manage.py runserver
  ```

---

==เพิ่มเติม==

**11. คำสั่งที่ใช้สร้าง Super Admin เพื่อเข้าจัดการข้อมูล Django**
- python manage.py createsuperuser
- ชื่อผู้ใช้: admin
- email: admin@gmail.com
- รหัส: 1234

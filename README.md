# CN Style Shop Web Application

เว็บแอปพลิเคชันสำหรับขายเสื้อผ้าแฟชั่นออนไลน์จากประเทศจีน พัฒนาด้วย Django เป็น Framework หลักในการพัฒนา ร่วมกับฐานข้อมูล MySQL และใช้ HTML CSS JavaScript HTMX Tailwind CSS และ Daisy UI ในการออกแบบและตกแต่งหน้าเว็บ

---

### Prerequisites (สิ่งที่ต้องเตรียมก่อนเริ่มต้น)
ก่อนเริ่มติดตั้งโปรเจกต์นี้ กรุณาตรวจสอบว่าเครื่องของคุณมีเครื่องมือและซอฟต์แวร์ดังต่อไปนี้

#### 1. Python 3.8 ขึ้นไป
- ดาวน์โหลดจาก: https://www.python.org/downloads/
- ตรวจสอบเวอร์ชัน:
    
  ```bash
  python --version
  ``` 

**1. Clone โปรเจคจาก GitHub**
- gh repo clone nantiwanM/ST-DSSI-68 หรือ git clone https://github.com/nantiwanM/ST-DSSI-68.git
- cd ST-DSSI-68

**2. สร้าง virtual environment สำหรับ Windows ใน cmd**  
- python -m venv venv
- venv\Scripts\activate

**3. ติดตั้ง Python Dependencies**
- pip install -r requirements.txt

**4. เข้าไปในโฟลเดอร์ theme และ static_src และติดตั้ง npm dependencies**   
- cd theme/static_src
- npm install

**5. กลับมาที่โฟลเดอร์หลักของโปรเจค** 
- cd ../../

**6. ส่วน database**

  เปิด MySQL Workbench และเชื่อมต่อกับเซิร์ฟเวอร์ MySQL สร้าง Schema ใหม่โดยใช้ชื่อ **cnstyleshop** และหากไม่มี MySQL หรือไม่ต้องการใช้ MySQL ไปที่โปรเจกต์ Django (โฟลเดอร์ CNStyleShop) เปิดไฟล์ settings.py ตรงบรรทัดที่ 113 (หรือส่วนที่กำหนดค่า DATABASES) แก้ไขการตั้งค่า DATABASES เพื่อใช้ SQLite แทน MySQL โดยเปลี่ยนเป็น
- DATABASES['default'] = DATABASES['sqlite3']
  
**7. ถ้าใช้ database sqlite3**

  ให้ไปทำข้อที่ 9 ได้เลย
  
**8. ถ้าใช้ database MySql**

- ใน MySQL Workbench ต้องมี Schema ชื่อ **cnstyleshop**
- และทำการแก้ไขให้ชื่อผู้ใช้งาน MySQL และ รหัสผ่านของผู้ใช้งานตรงในไฟล์ settings.py ส่วน DATABASES ที่บรรทัดที่ 96

  ทำการ migrate database
  -  python manage.py migrate

**9. เริ่มต้น Tailwind CSS**
- python manage.py tailwind start

**10. รัน Django Server**
- python manage.py runserver



==เพิ่มเติม==

**11. คำสั่งที่ใช้สร้าง Super Admin เพื่อเข้าจัดการข้อมูล Django**
- python manage.py createsuperuser
- ชื่อผู้ใช้: admin
- email: admin@gmail.com
- รหัส: 1234

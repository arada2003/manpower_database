CREATE TABLE Departments (
    department_ID CHAR(1) PRIMARY KEY NOT NULL,
    department_Name VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Jobs (
    job_ID VARCHAR(25) PRIMARY KEY NOT NULL,  
    job_Name VARCHAR(255),
    department_ID CHAR(1) NOT NULL,
    FOREIGN KEY (department_ID) REFERENCES Departments(department_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Employees (
    emp_ID char(4) PRIMARY KEY NOT NULL,
    emp_Firstname VARCHAR(255) DEFAULT NULL,
    emp_Lastname VARCHAR(255) DEFAULT NULL,
    emp_Gender VARCHAR(255) DEFAULT NULL,
    emp_BirthDate DATE DEFAULT NULL,
    emp_Phone CHAR(10) DEFAULT NULL,
    hire_date date,
    department_ID CHAR(1),  
    job_ID varchar(25),         
    emp_Salary INT,
    
    FOREIGN KEY (department_ID) REFERENCES Departments(department_ID), 
    FOREIGN KEY (job_ID) REFERENCES Jobs(job_ID)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE job_history (
    emp_ID CHAR(5) PRIMARY KEY NOT NULL,
    startDate DATE,
    endDate DATE DEFAULT NULL,
    job_ID varchar(25) NOT NULL,
    department_ID char(1) NOT NULL,
    FOREIGN KEY (emp_ID) REFERENCES Employees(emp_ID),
    FOREIGN KEY (job_ID) REFERENCES Jobs(job_ID),
    FOREIGN KEY (department_ID) REFERENCES Departments(department_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

create table Requests(
Request_ID varchar(25) not null,
Emp_ID char(4) not null,
Request_Date date,
Department_ID char(1),
job_ID VARCHAR(25),
Education_Level VARCHAR(255),
Employment_Type VARCHAR(255),
Desired_Date date,
Total_num_req int,
Num_Vacancies int,
primary key(Request_ID),
foreign key(Emp_ID) references Employees(Emp_ID),
foreign key(Department_ID) references Departments(Department_ID),
foreign key(job_ID) references Jobs(job_ID)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE AuthorizedUsers (
emp_ID char(4) PRIMARY KEY NOT NULL,
department_ID CHAR(1),
job_ID varchar(25),      
access VARCHAR(255),           
FOREIGN KEY (emp_ID) REFERENCES Employees(emp_ID),
foreign key(Department_ID) references Departments(Department_ID),
foreign key(job_ID) references Jobs(job_ID)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Notifications (
    notification_id char(4) primary key not null, 
    Request_ID varchar(25) not null,                               
    emp_ID char(4) NOT NULL,                       
    notification_date DATE,                         
    notification_status varchar(255) NULL,
    FOREIGN KEY (emp_ID) REFERENCES Employees(emp_id),
    FOREIGN KEY (Request_ID) REFERENCES Requests(Request_ID)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

create table Approves(
Request_ID varchar(25) not null,
Emp_ID char(4) not null,
primary key	(Request_ID,Emp_ID),
foreign key(Request_ID) references Requests(Request_ID),
foreign key(Emp_ID) references Employees(Emp_ID)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

create table Manpower (
 plan_ID char(4)  primary key not null ,
 Emp_ID char(4)  default null ,
 plan_StartDate  date default null ,
 plan_EndDate  date default null,
 FOREIGN KEY (emp_ID) REFERENCES Employees(emp_ID)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

create table Reports(
Report_ID char(5) primary key not null,
dates date) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

create table views (
Emp_ID char(4) not null,
Report_ID char(5) not null,
primary key	(Emp_ID,Report_ID),
FOREIGN KEY (emp_ID) REFERENCES Employees(emp_ID),
foreign key (Report_ID) references Reports(Report_ID)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SET NAMES 'utf8mb4';

INSERT INTO `Departments`(`department_ID`, `department_Name`) VALUES 
('1', 'ฝ่ายบริหาร'),
('2', 'ฝ่ายทรัพยากรบุคคล'),  
('3', 'ฝ่ายการเงินและบัญชี'),         
('4', 'ฝ่ายการตลาด'),          
('5', 'ฝ่ายไอที'),             
('6', 'ฝ่ายปฏิบัติการ'),             
('7', 'ฝ่ายขาย'),
('8', 'ฝ่ายผลิตภัณฑ์');

INSERT INTO `Jobs`(`job_ID`, `job_Name`, `department_ID`) VALUES 
('CEO', 'ประธานเจ้าหน้าที่บริหาร', '1'),
('VP', 'รองประธาน', '1'),
('BOD_MEMBER', 'กรรมการบริษัท', '1'),
('EA', 'ผู้ช่วยผู้บริหาร', '1'),
('FI_MGR', 'ผู้จัดการฝ่ายการเงิน', '3'),
('AC_MGR', 'ผู้จัดการฝ่ายบัญชี', '3'),
('ACCT', 'นักบัญชี', '3'),
('AUD', 'ผู้ตรวจสอบบัญชี', '3'),
('MK_MGR', 'ผู้จัดการฝ่ายการตลาด', '4'),
('MK_REP', 'ตัวแทนฝ่ายการตลาด', '4'),
('HR_MGR', 'ผู้จัดการฝ่ายทรัพยากรบุคคล', '2'),
('HR_REP', 'ตัวแทนฝ่ายทรัพยากรบุคคล', '2'),
('IT_MGR', 'ผู้จัดการฝ่ายเทคโนโลยีสารสนเทศ', '5'),
('PROG', 'โปรแกรมเมอร์', '5'),
('IT_SPEC', 'ผู้เชี่ยวชาญสนับสนุนด้าน IT', '5'),
('SALES_MGR', 'ผู้จัดการฝ่ายขาย', '7'),
('SALES_REP', 'ตัวแทนฝ่ายขาย', '7'),
('ACC_MGR', 'ผู้จัดการลูกค้า', '7'),
('OPS_MGR', 'ผู้จัดการฝ่ายปฏิบัติการ', '6'),
('STOCK_MGR', 'ผู้จัดการฝ่ายคลังสินค้า', '6'),
('PURCH_MGR', 'ผู้จัดการฝ่ายจัดซื้อ', '6'),
('LOG_COORD', 'ผู้ประสานงานด้านโลจิสติกส์', '6'),
('PD_MGR', 'ผู้จัดการผลิตภัณฑ์', '8'),
('QA_SPEC', 'ผู้เชี่ยวชาญด้านประกันคุณภาพ', '8');


INSERT INTO `Employees`(`emp_ID`, `emp_Firstname`, `emp_Lastname`, `emp_Gender`, `emp_BirthDate`, `emp_Phone`, `hire_date`, `department_ID`, `job_ID`, `emp_Salary`) VALUES
('E001', 'ณัฐวุฒิ', 'ศรีสกุล', 'ชาย', '1985-06-15', '0812345678', '2010-02-01', '3', 'FI_MGR', 50000),
('E002', 'วราภรณ์', 'นาคสุข', 'หญิง', '1980-12-21', '0812345679', '2005-08-15', '1', 'CEO', 90000),
('E003', 'พิมพ์ลดา', 'ธนากร', 'หญิง', '1992-04-05', '0812345680', '2015-10-30', '7', 'SALES_REP', 35000),
('E004', 'สมชาย', 'สุวรรณ', 'ชาย', '1987-09-10', '0812345681', '2012-04-18', '4', 'MK_MGR', 60000),
('E005', 'กิตติ', 'ปรางแก้ว', 'ชาย', '1975-11-30', '0812345682', '2000-01-05', '5', 'IT_MGR', 70000),
('E006', 'จิราพร', 'ใจดี', 'หญิง', '1990-07-15', '0812345683', '2013-07-01', '2', 'HR_REP', 40000),
('E007', 'พรทิพย์', 'สายสุนทร', 'หญิง', '1985-03-25', '0812345684', '2010-09-01', '8', 'QA_SPEC', 50000),
('E008', 'อนุชา', 'ปรีชา', 'ชาย', '1993-10-12', '0812345685', '2016-11-15', '6', 'PURCH_MGR', 45000),
('E009', 'ชญาภา', 'บุญทวี', 'หญิง', '1983-01-07', '0812345686', '2008-06-01', '3', 'AUD', 48000),
('E010', 'นรากร', 'อัครเดช', 'ชาย', '1978-08-25', '0812345687', '2002-03-10', '1', 'BOD_MEMBER', 85000),
('E011', 'ธนกฤต', 'วิเศษสกุล', 'ชาย', '1986-04-17', '0812345688', '2011-05-01', '6', 'LOG_COORD', 42000),
('E012', 'ปณิตา', 'ปริญญา', 'หญิง', '1995-12-01', '0812345689', '2018-08-20', '7', 'ACC_MGR', 55000),
('E013', 'ศุภชัย', 'ไชยวงศ์', 'ชาย', '1991-09-14', '0812345690', '2014-05-15', '4', 'MK_REP', 38000),
('E014', 'จารุวรรณ', 'ศรีสกุล', 'หญิง', '1984-11-19', '0812345691', '2009-03-20', '3', 'ACCT', 46000),
('E015', 'ปิยวรรณ', 'วัฒนา', 'หญิง', '1990-05-07', '0812345692', '2012-12-01', '5', 'IT_SPEC', 48000),
('E016', 'จิตติ', 'สกุลทอง', 'ชาย', '1987-07-12', '0812345693', '2011-01-25', '2', 'HR_MGR', 60000),
('E017', 'วรินทร', 'ปัญญา', 'หญิง', '1992-03-02', '0812345694', '2015-02-14', '8', 'QA_SPEC', 55000),
('E018', 'พิชิต', 'โชติสุวรรณ', 'ชาย', '1977-06-11', '0812345695', '2001-10-01', '6', 'OPS_MGR', 68000),
('E019', 'ณัฐพร', 'รัตนานนท์', 'หญิง', '1989-10-30', '0812345696', '2011-07-21', '5', 'PROG', 45000),
('E020', 'ศักดิ์สิทธิ์', 'ยอดมงคล', 'ชาย', '1982-12-13', '0812345697', '2007-09-01', '7', 'SALES_MGR', 62000),
('E021', 'นฤมล', 'ปานทอง', 'หญิง', '1988-01-25', '0812345698', '2010-10-10', '4', 'MK_REP', 39000),
('E022', 'วิชัย', 'วิทยาพร', 'ชาย', '1981-02-14', '0812345699', '2006-06-17', '3', 'AC_MGR', 55000),
('E023', 'ภัทราวดี', 'สิทธิโชค', 'หญิง', '1985-08-02', '0812345700', '2009-11-09', '1', 'EA', 47000),
('E024', 'ธีรศักดิ์', 'ทวีทรัพย์', 'ชาย', '1994-06-21', '0812345701', '2017-05-03', '8', 'PD_MGR', 58000),
('E025', 'ชุติมา', 'นาคปราง', 'หญิง', '1996-11-15', '0812345702', '2019-04-10', '2', 'HR_REP', 41000),
('E026', 'ณัฏฐ์', 'พงศ์สกุล', 'ชาย', '1980-05-28', '0812345703', '2004-12-01', '6', 'STOCK_MGR', 54000),
('E027', 'สุดารัตน์', 'ทิพย์วัฒนา', 'หญิง', '1993-08-30', '0812345704', '2016-07-20', '5', 'IT_SPEC', 46000),
('E028', 'ประยุทธ', 'ศิริไชย', 'ชาย', '1979-07-07', '0812345705', '2003-02-18', '7', 'SALES_MGR', 62000),
('E029', 'อรัญ', 'เศรษฐกุล', 'ชาย', '1995-05-15', '0812345706', '2018-03-22', '4', 'MK_MGR', 57000),
('E030', 'อรัญญา', 'สายบุญ', 'หญิง', '1990-02-19', '0812345707', '2012-09-01', '8', 'QA_SPEC', 51000),
('E031', 'นฤชา', 'สมหวัง', 'ชาย', '1986-10-11', '0812345708', '2011-08-20', '5', 'PROG', 47000),
('E032', 'ปกรณ์', 'วิรุณชัย', 'ชาย', '1975-03-10', '0812345709', '1999-12-01', '1', 'BOD_MEMBER', 87000),
('E033', 'อัญชลี', 'ทวีวัฒน์', 'หญิง', '1984-06-28', '0812345710', '2009-05-01', '6', 'PURCH_MGR', 51000),
('E034', 'สุภาวดี', 'สำราญ', 'หญิง', '1991-04-04', '0812345711', '2014-01-25', '3', 'AUD', 47000),
('E035', 'สุเมธ', 'อินทรี', 'ชาย', '1989-09-05', '0812345712', '2010-06-17', '7', 'ACC_MGR', 53000),
('E036', 'อภิรักษ์', 'เพชรทอง', 'ชาย', '1993-02-20', '0812345713', '2016-02-20', '2', 'HR_MGR', 55000),
('E037', 'จิราวรรณ', 'ศักดา', 'หญิง', '1980-07-09', '0812345714', '2004-03-01', '8', 'PD_MGR', 58000),
('E038', 'บุญเลิศ', 'เพิ่มพูน', 'ชาย', '1987-05-03', '0812345715', '2010-11-01', '4', 'MK_MGR', 55000),
('E039', 'วิภาวี', 'รุ่งเรือง', 'หญิง', '1985-12-22', '0812345716', '2010-03-10', '3', 'ACCT', 48000),
('E040', 'เกียรติศักดิ์', 'บัวทอง', 'ชาย', '1982-08-18', '0812345717', '2007-07-01', '7', 'SALES_REP', 45000),
('E041', 'ภัทรพล', 'เกรียงไกร', 'ชาย', '1991-12-04', '0812345718', '2014-11-15', '5', 'PROG', 46000),
('E042', 'กัลยา', 'สิงห์ทอง', 'หญิง', '1988-02-25', '0812345719', '2011-07-20', '6', 'STOCK_MGR', 49000),
('E043', 'ชลธิชา', 'กาญจนวัฒน์', 'หญิง', '1990-10-03', '0812345720', '2012-05-19', '4', 'MK_REP', 42000),
('E044', 'เกรียงไกร', 'นวลมณี', 'ชาย', '1984-01-29', '0812345721', '2009-08-10', '3', 'FI_MGR', 52000),
('E045', 'ดารณี', 'เพ็ญสกุล', 'หญิง', '1981-06-27', '0812345722', '2006-04-25', '8', 'QA_SPEC', 49000),
('E046', 'สุกัญญา', 'พัฒนชัย', 'หญิง', '1992-09-15', '0812345723', '2015-08-07', '2', 'HR_REP', 43000),
('E047', 'อนุสรณ์', 'ศรีวิชัย', 'ชาย', '1990-03-11', '0812345724', '2012-11-02', '8', 'PD_MGR', 56000),
('E048', 'อารีรัตน์', 'กิตติวัฒน์', 'หญิง', '1983-05-23', '0812345725', '2008-01-30', '7', 'SALES_MGR', 58000),
('E049', 'ไพศาล', 'ธำรงค์', 'ชาย', '1985-07-16', '0812345726', '2010-09-10', '5', 'IT_MGR', 64000),
('E050', 'ชยุต', 'ปรีดาศักดิ์', 'ชาย', '1989-11-12', '0812345727', '2011-12-15', '6', 'OPS_MGR', 53000),
('E051', 'กมล', 'ศรีทอง', 'ชาย', '1975-02-15', '0812345730', '2000-03-20', '2', 'HR_REP', 42000),
('E052', 'นภา', 'พรรณราย', 'หญิง', '1981-11-01', '0812345731', '2006-08-30', '3', 'AUD', 48000),
('E053', 'ชาญชัย', 'วีระพล', 'ชาย', '1983-04-22', '0812345732', '2008-02-18', '5', 'IT_SPEC', 45000),
('E054', 'ศรีสุดา', 'มั่นคง', 'หญิง', '1990-05-27', '0812345733', '2012-07-14', '6', 'OPS_MGR', 54000),
('E055', 'สมบัติ', 'ชัยศรี', 'ชาย', '1987-08-15', '0812345734', '2011-11-11', '4', 'MK_MGR', 50000),
('E056', 'พิมพ์ใจ', 'รัตนมงคล', 'หญิง', '1989-10-08', '0812345735', '2013-09-01', '7', 'ACC_MGR', 55000),
('E057', 'อำนวย', 'วิไลพร', 'ชาย', '1978-09-12', '0812345736', '2002-01-10', '8', 'PD_MGR', 60000),
('E058', 'สุชาติ', 'เรืองสกุล', 'ชาย', '1980-06-23', '0812345737', '2005-05-25', '1', 'VP', 75000),
('E059', 'ปิยะ', 'พงศ์สวัสดิ์', 'ชาย', '1986-03-29', '0812345738', '2010-06-18', '3', 'FI_MGR', 52000),
('E060', 'อาภรณ์', 'ศรีธรรม', 'หญิง', '1992-12-09', '0812345739', '2014-01-15', '5', 'PROG', 48000),
('E061', 'จตุพล', 'พรชัย', 'ชาย', '1984-04-16', '0812345740', '2009-05-07', '7', 'SALES_MGR', 62000),
('E062', 'ชยุต', 'ศรีสวัสดิ์', 'ชาย', '1990-09-18', '0812345741', '2013-02-01', '4', 'MK_REP', 41000),
('E063', 'ทิพย์วรรณ', 'ทองสกุล', 'หญิง', '1988-01-21', '0812345742', '2011-08-20', '6', 'PURCH_MGR', 48000),
('E064', 'ปราณี', 'อินทรา', 'หญิง', '1985-02-25', '0812345743', '2010-01-12', '8', 'QA_SPEC', 51000),
('E065', 'กิตติ', 'เพชรมณี', 'ชาย', '1987-10-19', '0812345744', '2011-10-10', '3', 'AUD', 49000),
('E066', 'จิราพร', 'ชื่นวิเศษ', 'หญิง', '1994-04-06', '0812345745', '2016-03-01', '5', 'PROG', 47000),
('E067', 'สุพจน์', 'ธรรมวัฒน์', 'ชาย', '1982-07-04', '0812345746', '2007-06-15', '4', 'MK_MGR', 52000),
('E068', 'สมศักดิ์', 'ใจดี', 'ชาย', '1980-11-11', '0812345747', '2005-11-01', '7', 'SALES_MGR', 63000),
('E069', 'วิรัช', 'รุ่งโรจน์', 'ชาย', '1990-06-02', '0812345748', '2013-06-14', '2', 'HR_MGR', 55000),
('E070', 'อรวรรณ', 'ศักดิ์เจริญ', 'หญิง', '1983-05-09', '0812345749', '2008-02-12', '6', 'LOG_COORD', 49000);

INSERT INTO `job_history`(`emp_ID`, `startDate`, `endDate`, `job_ID`, `department_ID`) VALUES
('E001', '2010-02-01', '2020-02-01', 'FI_MGR', '3'),
('E002', '2005-08-15', NULL, 'CEO', '1'),
('E003', '2015-10-30', NULL, 'SALES_REP', '7'),
('E004', '2012-04-18', NULL, 'MK_MGR', '4'),
('E005', '2000-01-05', '2010-01-05', 'IT_MGR', '5'),
('E006', '2013-07-01', NULL, 'HR_REP', '2'),
('E007', '2010-09-01', NULL, 'QA_SPEC', '8'),
('E008', '2016-11-15', '2026-11-15', 'PURCH_MGR', '6'),
('E009', '2008-06-01', NULL, 'AUD', '3'),
('E010', '2002-03-10', '2012-03-10', 'BOD_MEMBER', '1'),
('E011', '2011-05-01', NULL, 'LOG_COORD', '6'),
('E012', '2018-08-20', '2028-08-20', 'ACC_MGR', '7'),
('E013', '2014-05-15', NULL, 'MK_REP', '4'),
('E014', '2009-03-20', '2019-03-20', 'ACCT', '3'),
('E015', '2012-12-01', NULL, 'IT_SPEC', '5'),
('E016', '2011-01-25', NULL, 'HR_MGR', '2'),
('E017', '2015-02-14', NULL, 'QA_SPEC', '8'),
('E018', '2001-10-01', '2011-10-01', 'OPS_MGR', '6'),
('E019', '2011-07-21', NULL, 'PROG', '5'),
('E020', '2007-09-01', '2017-09-01', 'SALES_MGR', '7'),
('E021', '2010-10-10', NULL, 'MK_REP', '4'),
('E022', '2006-06-17', '2016-06-17', 'AC_MGR', '3'),
('E023', '2009-11-09', NULL, 'EA', '1'),
('E024', '2017-05-03', NULL, 'PD_MGR', '8'),
('E025', '2019-04-10', NULL, 'HR_REP', '2'),
('E026', '2004-12-01', NULL, 'STOCK_MGR', '6'),
('E027', '2016-07-20', NULL, 'IT_SPEC', '5'),
('E028', '2003-02-18', NULL, 'SALES_MGR', '7'),
('E029', '2018-03-22', NULL, 'MK_MGR', '4'),
('E030', '2012-09-01', NULL, 'QA_SPEC', '8'),
('E031', '2011-08-20', '2021-08-20', 'PROG', '5'),
('E032', '1999-12-01', NULL, 'BOD_MEMBER', '1'),
('E033', '2009-05-01', NULL, 'PURCH_MGR', '6'),
('E034', '2014-01-25', NULL, 'AUD', '3'),
('E035', '2010-06-17', '2020-06-17', 'ACC_MGR', '7'),
('E036', '2016-02-20', NULL, 'HR_MGR', '2'),
('E037', '2004-03-01', '2014-03-01', 'PD_MGR', '8'),
('E038', '2010-11-01', NULL, 'MK_MGR', '4'),
('E039', '2010-03-10', NULL, 'ACCT', '3'),
('E040', '2007-07-01', '2017-07-01', 'SALES_REP', '7'),
('E041', '2014-11-15', NULL, 'PROG', '5'),
('E042', '2011-07-20', NULL, 'STOCK_MGR', '6'),
('E043', '2012-05-19', '2022-05-19', 'MK_REP', '4'),
('E044', '2009-08-10', NULL, 'FI_MGR', '3'),
('E045', '2006-04-25', '2022-04-25', 'QA_SPEC', '8'),
('E046', '2015-08-07', NULL, 'HR_REP', '2'),
('E047', '2012-11-02', NULL, 'PD_MGR', '8'),
('E048', '2008-01-30', NULL, 'SALES_MGR', '7'),
('E049', '2010-09-10', '2020-09-10', 'IT_MGR', '5'),
('E050', '2011-12-15', NULL, 'OPS_MGR', '6'),
('E051', '2000-03-20', NULL, 'HR_REP', '2'),
('E052', '2006-08-30', '2016-08-30', 'AUD', '3'),
('E053', '2008-02-18', '2022-02-18', 'IT_SPEC', '5'),
('E054', '2012-07-14', NULL, 'OPS_MGR', '6'),
('E055', '2011-11-11', NULL, 'MK_MGR', '4'),
('E056', '2013-09-01', NULL, 'ACC_MGR', '7'),
('E057', '2002-01-10', NULL, 'PD_MGR', '8'),
('E058', '2005-05-25', NULL, 'VP', '1'),
('E059', '2010-06-18', NULL, 'FI_MGR', '3'),
('E060', '2014-01-15', NULL, 'PROG', '5'),
('E061', '2009-05-07', NULL, 'SALES_MGR', '7'),
('E062', '2013-02-01', NULL, 'MK_REP', '4'),
('E063', '2011-08-20', NULL, 'PURCH_MGR', '6'),
('E064', '2010-01-12', NULL, 'QA_SPEC', '8'),
('E065', '2011-10-10', NULL, 'AUD', '3'),
('E066', '2016-03-01', NULL, 'PROG', '5'),
('E067', '2007-06-15', NULL, 'MK_MGR', '4'),
('E068', '2005-11-01', '2015-11-01', 'SALES_MGR', '7'),
('E069', '2013-06-14', NULL, 'HR_MGR', '2'),
('E070', '2010-10-10', NULL, 'LOG_COORD', '6');

DELIMITER $$

CREATE TRIGGER before_insert_jobs
BEFORE INSERT ON Requests
FOR EACH ROW
BEGIN
    DECLARE new_req_id VARCHAR(25);
    DECLARE count_req INT;

    SELECT COUNT(*) INTO count_req FROM Requests;

    SET new_req_id = CONCAT('REQ', LPAD(count_req + 1, 3, '0'));
    SET NEW.Request_ID = new_req_id;
END $$

DELIMITER ; 

INSERT INTO `Requests`( `Emp_ID`, `Request_Date` , `Department_ID`, `job_ID`, `Education_Level`, `Employment_Type`, `Desired_Date`, `Total_num_req`, `Num_Vacancies`) VALUES
('E038', '2000-03-16', '3', 'FI_MGR', 'ปริญญาตรี', 'พนักงานประจำ', '2000-04-16', 7, 4),
('E004', '2001-06-23',  '4', 'MK_MGR', 'ปริญญาตรี', 'พนักงานประจำ', '2001-07-23', 8, 3);

INSERT INTO `AuthorizedUsers`(`emp_ID`, `department_ID`, `job_ID`, `access`) VALUES
('E002', '1', 'CEO', 'Full Access'),
('E010', '1', 'BOD_MEMBER', 'Full Access'),
('E014', '3', 'ACCT', 'View Only'),
('E016', '2', 'HR_MGR', 'Full Access'),
('E058', '1', 'VP', 'Full Access'),
('E059', '3', 'FI_MGR', 'View Only');

-- INSERT INTO `Notifications`(`notification_id`, `Request_ID`, `emp_ID`, `notification_date`, `notification_status`) VALUES
-- ('N001','RQ01','E002','2000-03-18','ส่งแล้ว'),
-- ('N002','RQ02','E004','2000-03-18','ส่งแล้ว');

-- INSERT INTO `Approves`(`Request_ID`, `Emp_ID`) VALUES
-- ('RQ01','E016'),
-- ('RQ02','E010');

INSERT INTO `Manpower`(`plan_ID`, `Emp_ID`, `plan_StartDate`, `plan_EndDate`) VALUES 
('P001','E036','2023-02-01','2023-06-30'), 
('P002','E036','2023-07-15','2023-10-31'),
('P003','E025','2023-11-10','2024-01-31'),
('P004','E025','2024-02-08','2024-03-31'),
('P005','E046','2024-04-08','2024-04-30'),
('P006','E046','2024-05-07','2024-05-31'),
('P007','E069','2024-06-07','2024-08-31'),
('P008','E069','2024-09-09','2024-11-30'),
('P009','E051','2024-12-09','2024-12-31'),
('P010','E051','2025-01-09','2025-03-31');

INSERT INTO `Reports`(`Report_ID`, `dates`) VALUES
('RP001', '2023-07-11'),
('RP002', '2023-11-09'),
('RP003', '2024-02-07'),
('RP004', '2024-04-06'),
('RP005', '2024-05-05'),
('RP006', '2024-06-04'),
('RP007', '2024-09-07'),
('RP008', '2024-12-08'),
('RP009', '2025-01-07');

INSERT INTO `views`(`Emp_ID`, `Report_ID`) VALUES
('E002','RP003'),
('E016','RP005'),
('E059','RP009');
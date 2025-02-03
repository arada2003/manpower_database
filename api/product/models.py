from pydantic import BaseModel
from typing import Optional
from datetime import date

class JobModel(BaseModel):
    job_ID: str  
    job_Name: str

class DepartmentModel(BaseModel):
    department_ID: str
    department_Name: str

class EmployeeModel(BaseModel):
    emp_ID: str
    emp_Firstname: Optional[str] = None
    emp_Lastname: Optional[str] = None
    emp_Gender: Optional[str] = None
    emp_BirthDate: Optional[date] = None
    emp_Phone: Optional[str] = None
    hire_date: date
    department_ID: str
    job_ID: str
    emp_Salary: int

class JobhisModel(BaseModel):
    emp_ID: str
    startDate: date
    endDate: date
    job_ID: str
    department_ID: str

class RequestModel(BaseModel):
    Emp_ID: str
    Request_Date: date
    Department_ID: str
    job_ID: str
    Education_Level: Optional[str] = None
    Employment_Type: Optional[str] = None
    Desired_Date: date
    Total_num_req: int
    Num_Vacancies: int

class AuthorModel(BaseModel):
    emp_ID: str 
    department_ID: str 
    job_ID: str   
    access: str

class NotiModel(BaseModel):
    notification_id: str
    Request_ID: str 
    emp_ID: str  
    notification_date: Optional[date] = None 
    notification_status: Optional[str] = None 


class ApproveModel(BaseModel):
    Request_ID: str 
    Emp_ID: str 

class ManpowerModel(BaseModel):
    plan_ID: str 
    Emp_ID: str
    plan_StartDate: Optional[date] = None 
    plan_EndDate: Optional[date] = None  

class ReportModel(BaseModel):
    Report_ID: str  
    dates: Optional[date] = None 

class ViewModel(BaseModel):
    Emp_ID: str  
    Report_ID: str 


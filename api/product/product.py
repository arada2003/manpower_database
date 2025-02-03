from fastapi import HTTPException,APIRouter
from database.query import query_get , query_create, query_update

from .models import JobModel, DepartmentModel, EmployeeModel, JobhisModel
from .models import RequestModel, AuthorModel, NotiModel, ApproveModel
from .models import ManpowerModel, ReportModel, ViewModel


def get_all_Jobs():
    jobs = query_get("""
        SELECT * FROM Jobs
        """, ())
    return jobs

def get_all_departments():
    departments = query_get("""
        SELECT * FROM Departments
        """, ())
    return departments

def get_all_employees():
    employees = query_get("""
        SELECT * FROM Employees
        """, ())
    return employees

def get_all_job_his():
    job_his = query_get("""
        SELECT * FROM job_history
        """, ())
    return job_his

def get_all_req():
    reqs = query_get("""
        SELECT * FROM Requests
        """, ())
    return reqs

def get_all_author():
    authori = query_get("""
        SELECT * FROM AuthorizedUsers
        """, ())
    return authori

def get_all_noti():
    noti = query_get("""
        SELECT * FROM Notifications
        """, ())
    return noti

def get_all_approve():
    appr = query_get("""
        SELECT * FROM Approves
        """, ())
    return appr

def get_all_manpower():
    man = query_get("""
        SELECT * FROM Manpower
        """, ())
    return man

def get_all_rep():
    rep = query_get("""
        SELECT * FROM Reports
        """, ())
    return rep

def get_all_view():
    view = query_get("""
        SELECT * FROM views
        """, ())
    return view

# insert
def add_req(req: RequestModel):
    last_row_id = query_create("""
                INSERT INTO Requests (
                    Emp_ID,
                    Request_Date,
                    Department_ID,
                    job_ID,
                    Education_Level,
                    Employment_Type,
                    Desired_Date,
                    Total_num_req,
                    Num_Vacancies
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                """,
                (
                    req.Emp_ID,
                    req.Request_Date,
                    req.Department_ID,
                    req.job_ID,
                    req.Education_Level,
                    req.Employment_Type,
                    req.Desired_Date,
                    req.Total_num_req,
                    req.Num_Vacancies
                )
                )
    return last_row_id

def get_emp_name(emp_ID: str):
    employee = query_get("""
        SELECT concat(emp_firstname, ' ', emp_lastname)
        FROM Employees
        WHERE emp_ID = %s;
    """, (emp_ID))
    return employee

def get_job_id(department_Name: str):
    job_id = query_get("""
        SELECT job_ID
        FROM Jobs j join Departments d
        ON j.department_ID = d.department_ID
        WHERE department_Name = %s;
    """, (department_Name))
    return job_id


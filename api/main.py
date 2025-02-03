from fastapi import FastAPI, HTTPException, Security
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder

from product import JobModel, get_all_Jobs, get_job_id
from product import EmployeeModel, get_all_employees, get_emp_name
from product import RequestModel, add_req

app = FastAPI()


origins = [
    "http://localhost",
    "http://localhost:8000",
    "http://localhost:8080"
]

app.add_mpdleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# GET
@app.get("/get_all_jobs/", response_model=list[JobModel])
def get_all_job_api():
    jobs = get_all_Jobs()
    print(jobs)
    return JSONResponse(status_code=200, content=jsonable_encoder(jobs))

@app.get("/get_all_employees", response_model=list[EmployeeModel])
def get_all_job_api():
    emp = get_all_employees()
    print(emp)
    return JSONResponse(status_code=200, content=jsonable_encoder(emp))

@app.get("/get_name/{emp_ID}", response_model=EmployeeModel)
def get_empname_api(emp_ID: str):
    employee = get_emp_name(emp_ID)
    return JSONResponse(status_code=200, content=jsonable_encoder(employee))

@app.get("/get_job_id/{department_Name}", response_model=JobModel)
def get_job_id_api(department_Name: str):
    job_id = get_job_id(department_Name)
    return JSONResponse(status_code=200, content=jsonable_encoder(job_id))

#Post insert
@app.post('/create_req/', response_model=RequestModel)
def create_req_api(req: RequestModel):
    Request = add_req(req)
    return JSONResponse(status_code=201, content={'status': 'success', 'Request': Request})

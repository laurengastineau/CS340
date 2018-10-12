CREATE TABLE employee (
    employee_id INTEGER PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL
);

CREATE TABLE company (
    company_id INTEGER PRIMARY KEY,
    company_name VARCHAR(300) NOT NULL
);

CREATE TABLE company_employee (
    employee_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    work_hour_start TIME NOT NULL,
    work_hour_end TIME NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (company_id) REFERENCES company (company_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (employee_id, company_id, work_hour_start, work_hour_end)
);

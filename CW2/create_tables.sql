-- Tabela regionów
CREATE TABLE regions (
    region_id NUMBER PRIMARY KEY,
    region_name VARCHAR2(50) NOT NULL
);

-- Tabela krajów
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR2(50) NOT NULL,
    region_id NUMBER,
    CONSTRAINT fk_country_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Tabela lokalizacji
CREATE TABLE locations (
    location_id NUMBER PRIMARY KEY,
    street_address VARCHAR2(100),
    postal_code VARCHAR2(12),
    city VARCHAR2(50),
    state_province VARCHAR2(50),
    country_id CHAR(2),
    CONSTRAINT fk_location_country FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- Tabela departamentów
CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL,
    manager_id NUMBER,
    location_id NUMBER,
    CONSTRAINT fk_dept_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_dept_location FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Tabela stanowisk pracy
CREATE TABLE jobs (
    job_id VARCHAR2(10) PRIMARY KEY,
    job_title VARCHAR2(50) NOT NULL,
    min_salary NUMBER,
    max_salary NUMBER
);

-- Dodanie kolumn i kluczy obcych do employees
ALTER TABLE employees
    ADD (department_id NUMBER,
         job_id VARCHAR2(10),
         CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES departments(department_id),
         CONSTRAINT fk_emp_job FOREIGN KEY (job_id) REFERENCES jobs(job_id)
    ); 
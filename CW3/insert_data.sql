-- Przykładowe dane do tabeli REGIONS
INSERT INTO regions (region_id, region_name) VALUES (1, 'Europa');
INSERT INTO regions (region_id, region_name) VALUES (2, 'Ameryka');
INSERT INTO regions (region_id, region_name) VALUES (3, 'Azja');
INSERT INTO regions (region_id, region_name) VALUES (4, 'Afryka');
INSERT INTO regions (region_id, region_name) VALUES (5, 'Australia');
INSERT INTO regions (region_id, region_name) VALUES (6, 'Antarktyda');
INSERT INTO regions (region_id, region_name) VALUES (7, 'Bliski Wschód');
INSERT INTO regions (region_id, region_name) VALUES (8, 'Skandynawia');
INSERT INTO regions (region_id, region_name) VALUES (9, 'Ameryka Płd');
INSERT INTO regions (region_id, region_name) VALUES (10, 'Karaiby');

-- Przykładowe dane do tabeli COUNTRIES
INSERT INTO countries (country_id, country_name, region_id) VALUES ('PL', 'Poland', 1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('DE', 'Germany', 1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('US', 'USA', 2);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('CN', 'China', 3);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('EG', 'Egypt', 4);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('AU', 'Australia', 5);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('AR', 'Argentina', 9);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('SE', 'Sweden', 8);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('BR', 'Brazil', 9);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('CA', 'Canada', 2);

-- Przykładowe dane do tabeli LOCATIONS
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1, 'ul. Kwiatowa 1', '00-001', 'Warszawa', 'Mazowieckie', 'PL');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2, 'Bahnhofstrasse 2', '10115', 'Berlin', 'Berlin', 'DE');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (3, '5th Avenue', '10001', 'New York', 'NY', 'US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (4, 'Nanjing Rd', '200000', 'Shanghai', 'Shanghai', 'CN');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (5, 'Pyramids St', '12345', 'Cairo', 'Cairo', 'EG');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (6, 'George St', '2000', 'Sydney', 'NSW', 'AU');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (7, 'Florida 123', 'C1000', 'Buenos Aires', 'BA', 'AR');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (8, 'Drottninggatan', '11151', 'Stockholm', 'Stockholm', 'SE');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (9, 'Paulista Ave', '01310', 'Sao Paulo', 'SP', 'BR');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (10, 'Yonge St', 'M5B2H1', 'Toronto', 'ON', 'CA');

-- Przykładowe dane do tabeli DEPARTMENTS
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (10, 'Finance', NULL, 1);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (20, 'IT', NULL, 2);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (30, 'HR', NULL, 3);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (40, 'Sales', NULL, 4);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (50, 'Marketing', NULL, 5);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (60, 'Logistics', NULL, 6);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (70, 'Support', NULL, 7);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (80, 'R&D', NULL, 8);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (90, 'Legal', NULL, 9);
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES (100, 'Admin', NULL, 10);

-- Przykładowe dane do tabeli JOBS
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('IT_PROG', 'Programista', 4000, 12000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('HR_MGR', 'HR Manager', 6000, 15000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('SA_REP', 'Sales Rep', 3000, 9000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('MK_DIR', 'Marketing Director', 8000, 20000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('FI_MGR', 'Finance Manager', 7000, 18000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_ASST', 'Admin Assistant', 2500, 6000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('LG_MGR', 'Logistics Manager', 5000, 14000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('SP_SUP', 'Support Supervisor', 3500, 8000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('RD_ENG', 'R&D Engineer', 6000, 16000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('LG_CLERK', 'Logistics Clerk', 2000, 5000);

-- Przykładowe dane do tabeli EMPLOYEES
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (1, 'Anna', 'Kowalska', 'anna.kowalska@firma.pl', '+48(22)1234567', TO_DATE('2015-01-10','YYYY-MM-DD'), 'IT_PROG', 8000, NULL, 20, 0.10);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (2, 'Jan', 'Nowak', 'jan.nowak@firma.pl', '+48(22)2345678', TO_DATE('2012-03-15','YYYY-MM-DD'), 'HR_MGR', 12000, NULL, 30, 0.15);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (3, 'Piotr', 'Zieliński', 'piotr.zielinski@firma.pl', '+49(30)1234567', TO_DATE('2018-07-01','YYYY-MM-DD'), 'SA_REP', 5000, 2, 40, 0.05);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (4, 'Maria', 'Lewandowska', 'maria.lewandowska@firma.pl', '+1(212)1234567', TO_DATE('2010-11-20','YYYY-MM-DD'), 'MK_DIR', 15000, 2, 50, 0.20);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (5, 'Tomasz', 'Wójcik', 'tomasz.wojcik@firma.pl', '+86(21)1234567', TO_DATE('2016-05-05','YYYY-MM-DD'), 'FI_MGR', 17000, 2, 10, 0.25);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (6, 'Katarzyna', 'Mazur', 'katarzyna.mazur@firma.pl', '+20(2)1234567', TO_DATE('2019-09-09','YYYY-MM-DD'), 'AD_ASST', 4000, 5, 100, NULL);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (7, 'Marek', 'Krawczyk', 'marek.krawczyk@firma.pl', '+61(2)1234567', TO_DATE('2017-02-14','YYYY-MM-DD'), 'LG_MGR', 9000, 5, 60, 0.12);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (8, 'Ewa', 'Piotrowska', 'ewa.piotrowska@firma.pl', '+54(11)1234567', TO_DATE('2013-06-30','YYYY-MM-DD'), 'SP_SUP', 7000, 7, 70, 0.08);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (9, 'Paweł', 'Dąbrowski', 'pawel.dabrowski@firma.pl', '+46(8)1234567', TO_DATE('2011-12-12','YYYY-MM-DD'), 'RD_ENG', 11000, 7, 80, 0.18);
INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct) VALUES (10, 'Agnieszka', 'Szymańska', 'agnieszka.szymanska@firma.pl', '+55(11)1234567', TO_DATE('2014-04-22','YYYY-MM-DD'), 'LG_CLERK', 3000, 7, 90, NULL);

-- Przykładowe dane do tabeli archiwum_departamentow
INSERT INTO archiwum_departamentow VALUES (101, 'Zamkniety1', TO_DATE('2022-01-01','YYYY-MM-DD'), 'Jan Nowak');
INSERT INTO archiwum_departamentow VALUES (102, 'Zamkniety2', TO_DATE('2022-02-01','YYYY-MM-DD'), 'Anna Kowalska');
INSERT INTO archiwum_departamentow VALUES (103, 'Zamkniety3', TO_DATE('2022-03-01','YYYY-MM-DD'), 'Piotr Zieliński');
INSERT INTO archiwum_departamentow VALUES (104, 'Zamkniety4', TO_DATE('2022-04-01','YYYY-MM-DD'), 'Maria Lewandowska');
INSERT INTO archiwum_departamentow VALUES (105, 'Zamkniety5', TO_DATE('2022-05-01','YYYY-MM-DD'), 'Tomasz Wójcik');
INSERT INTO archiwum_departamentow VALUES (106, 'Zamkniety6', TO_DATE('2022-06-01','YYYY-MM-DD'), 'Katarzyna Mazur');
INSERT INTO archiwum_departamentow VALUES (107, 'Zamkniety7', TO_DATE('2022-07-01','YYYY-MM-DD'), 'Marek Krawczyk');
INSERT INTO archiwum_departamentow VALUES (108, 'Zamkniety8', TO_DATE('2022-08-01','YYYY-MM-DD'), 'Ewa Piotrowska');
INSERT INTO archiwum_departamentow VALUES (109, 'Zamkniety9', TO_DATE('2022-09-01','YYYY-MM-DD'), 'Paweł Dąbrowski');
INSERT INTO archiwum_departamentow VALUES (110, 'Zamkniety10', TO_DATE('2022-10-01','YYYY-MM-DD'), 'Agnieszka Szymańska');

-- Przykładowe dane do tabeli zlodziej
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER1', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER2', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER3', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER4', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER5', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER6', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER7', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER8', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER9', SYSTIMESTAMP);
INSERT INTO zlodziej (user_name, czas_zmiany) VALUES ('USER10', SYSTIMESTAMP);

-- Przykładowe dane do tabeli JOD_GRADES
CREATE TABLE JOD_GRADES (
  grade_id NUMBER PRIMARY KEY,
  grade_name VARCHAR2(20),
  min_salary NUMBER,
  max_salary NUMBER
);
INSERT INTO JOD_GRADES VALUES (1, 'A', 2000, 5000);
INSERT INTO JOD_GRADES VALUES (2, 'B', 5001, 10000);
INSERT INTO JOD_GRADES VALUES (3, 'C', 10001, 15000);
INSERT INTO JOD_GRADES VALUES (4, 'D', 15001, 20000);
INSERT INTO JOD_GRADES VALUES (5, 'E', 20001, 26000);
INSERT INTO JOD_GRADES VALUES (6, 'F', 26001, 30000);
INSERT INTO JOD_GRADES VALUES (7, 'G', 30001, 35000);
INSERT INTO JOD_GRADES VALUES (8, 'H', 35001, 40000);
INSERT INTO JOD_GRADES VALUES (9, 'I', 40001, 45000);
INSERT INTO JOD_GRADES VALUES (10, 'J', 45001, 50000); 
-- Zadanie 1: Utwórz widok v_wysokie_pensje dla pracowników zarabiających > 6000
CREATE OR REPLACE VIEW v_wysokie_pensje AS
SELECT * FROM employees WHERE salary > 6000;

-- Zadanie 2: Zmień widok v_wysokie_pensje, aby pokazywał tylko zarabiających > 12000
CREATE OR REPLACE VIEW v_wysokie_pensje AS
SELECT * FROM employees WHERE salary > 12000;

-- Zadanie 3: Usuń widok v_wysokie_pensje
DROP VIEW v_wysokie_pensje;

-- Zadanie 4: Widok dla pracowników z departamentu Finance
CREATE OR REPLACE VIEW v_finance_employees AS
SELECT e.employee_id, e.last_name, e.first_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- Zadanie 5: Widok dla pracowników z zarobkami 5000-12000
CREATE OR REPLACE VIEW v_pracownicy_5000_12000 AS
SELECT employee_id, last_name, first_name, salary, job_id, email, hire_date
FROM employees
WHERE salary BETWEEN 5000 AND 12000;

-- Zadanie 6: Sprawdzenie możliwości DML na widokach
-- a. INSERT INTO v_pracownicy_5000_12000 (...)
-- b. UPDATE v_pracownicy_5000_12000 SET ...
-- c. DELETE FROM v_pracownicy_5000_12000 WHERE ...
-- (Wyniki zależą od ograniczeń widoku i kluczy obcych)

-- Zadanie 7: Widok dla działów z min. 4 pracownikami
CREATE OR REPLACE VIEW v_duze_dzialy AS
SELECT d.department_id, d.department_name,
       COUNT(e.employee_id) AS liczba_pracownikow,
       ROUND(AVG(e.salary)) AS srednia_pensja,
       MAX(e.salary) AS najwyzsza_pensja
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 4;
-- a. INSERT do tego widoku nie jest możliwy (zawiera agregacje)

-- Zadanie 8: Widok z warunkiem WITH CHECK OPTION
CREATE OR REPLACE VIEW v_pracownicy_5000_12000_check AS
SELECT employee_id, last_name, first_name, salary, job_id, email, hire_date
FROM employees
WHERE salary BETWEEN 5000 AND 12000
WITH CHECK OPTION;
-- a. i. INSERT z salary 6000: możliwy
-- a. ii. INSERT z salary 13000: błąd (nie spełnia warunku widoku)

-- Zadanie 9: Widok zmaterializowany v_managerowie
CREATE MATERIALIZED VIEW v_managerowie AS
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.employee_id = d.manager_id;

-- Zadanie 10: Widok 10 najlepiej opłacanych pracowników
CREATE OR REPLACE VIEW v_najlepiej_oplacani AS
SELECT * FROM (
  SELECT * FROM employees ORDER BY salary DESC
) WHERE ROWNUM <= 10; 
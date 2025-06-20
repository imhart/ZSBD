-- Zadanie 1: Blok anonimowy - maksymalny numer departamentu, dodanie nowego
DECLARE
  numer_max departments.department_id%TYPE;
  nowy_numer departments.department_id%TYPE;
  nowa_nazwa departments.department_name%TYPE := 'EDUCATION';
BEGIN
  SELECT MAX(department_id) INTO numer_max FROM departments;
  nowy_numer := numer_max + 10;
  INSERT INTO departments (department_id, department_name) VALUES (nowy_numer, nowa_nazwa);
  DBMS_OUTPUT.PUT_LINE('Dodano departament o numerze: ' || nowy_numer);
END;
/

-- Zadanie 2: Dodanie zmiany location_id (3000) dla nowego departamentu
DECLARE
  numer_max departments.department_id%TYPE;
  nowy_numer departments.department_id%TYPE;
  nowa_nazwa departments.department_name%TYPE := 'EDUCATION';
BEGIN
  SELECT MAX(department_id) INTO numer_max FROM departments;
  nowy_numer := numer_max + 10;
  INSERT INTO departments (department_id, department_name, location_id) VALUES (nowy_numer, nowa_nazwa, NULL);
  UPDATE departments SET location_id = 3000 WHERE department_id = nowy_numer;
  DBMS_OUTPUT.PUT_LINE('Dodano departament o numerze: ' || nowy_numer || ' i ustawiono location_id na 3000');
END;
/

-- Zadanie 3: Tabela nowa, pętla wpisująca liczby 1-10 bez 4 i 6
CREATE TABLE nowa (liczba VARCHAR2(10));
/
DECLARE
BEGIN
  FOR i IN 1..10 LOOP
    IF i != 4 AND i != 6 THEN
      INSERT INTO nowa VALUES (TO_CHAR(i));
    END IF;
  END LOOP;
END;
/

-- Zadanie 4: Zmienna %ROWTYPE dla countries, kraj 'CA'
DECLARE
  kraj countries%ROWTYPE;
BEGIN
  SELECT * INTO kraj FROM countries WHERE country_id = 'CA';
  DBMS_OUTPUT.PUT_LINE('Nazwa kraju: ' || kraj.country_name || ', region_id: ' || kraj.region_id);
END;
/

-- Zadanie 5: Kursor - wynagrodzenie, nazwisko dla departamentu 50
DECLARE
  CURSOR c IS SELECT salary, last_name FROM employees WHERE department_id = 50;
  v_salary employees.salary%TYPE;
  v_last_name employees.last_name%TYPE;
BEGIN
  OPEN c;
  LOOP
    FETCH c INTO v_salary, v_last_name;
    EXIT WHEN c%NOTFOUND;
    IF v_salary > 3100 THEN
      DBMS_OUTPUT.PUT_LINE(v_last_name || ' - nie dawać podwyżki');
    ELSE
      DBMS_OUTPUT.PUT_LINE(v_last_name || ' - dać podwyżkę');
    END IF;
  END LOOP;
  CLOSE c;
END;
/

-- Zadanie 6: Kursor z parametrami (widełki i fragment imienia)
DECLARE
  CURSOR c(p_min NUMBER, p_max NUMBER, p_name VARCHAR2) IS
    SELECT salary, first_name, last_name FROM employees
    WHERE salary BETWEEN p_min AND p_max AND LOWER(first_name) LIKE '%'||LOWER(p_name)||'%';
BEGIN
  DBMS_OUTPUT.PUT_LINE('a. Widełki 1000-5000, imię zawiera "a":');
  FOR r IN c(1000, 5000, 'a') LOOP
    DBMS_OUTPUT.PUT_LINE(r.first_name || ' ' || r.last_name || ' ' || r.salary);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('b. Widełki 5000-20000, imię zawiera "u":');
  FOR r IN c(5000, 20000, 'u') LOOP
    DBMS_OUTPUT.PUT_LINE(r.first_name || ' ' || r.last_name || ' ' || r.salary);
  END LOOP;
END;
/

-- Zadanie 9a: Procedura dodająca wiersz do jobs
CREATE OR REPLACE PROCEDURE add_job(p_id VARCHAR2, p_title VARCHAR2) IS
BEGIN
  INSERT INTO jobs(job_id, job_title) VALUES (p_id, p_title);
  DBMS_OUTPUT.PUT_LINE('Dodano job: '||p_id||' - '||p_title);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Błąd: '||SQLERRM);
END;
/

-- Zadanie 9b: Procedura modyfikująca title w jobs
CREATE OR REPLACE PROCEDURE update_job_title(p_id VARCHAR2, p_title VARCHAR2) IS
  v_count NUMBER;
BEGIN
  UPDATE jobs SET job_title = p_title WHERE job_id = p_id;
  v_count := SQL%ROWCOUNT;
  IF v_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20010, 'No Jobs updated');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Zmieniono job: '||p_id||' na '||p_title);
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -20010 THEN
      DBMS_OUTPUT.PUT_LINE('Błąd: Brak job do aktualizacji');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Błąd: '||SQLERRM);
    END IF;
END;
/

-- Zadanie 9c: Procedura usuwająca job
CREATE OR REPLACE PROCEDURE delete_job(p_id VARCHAR2) IS
  v_count NUMBER;
BEGIN
  DELETE FROM jobs WHERE job_id = p_id;
  v_count := SQL%ROWCOUNT;
  IF v_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20011, 'No Jobs deleted');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Usunięto job: '||p_id);
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -20011 THEN
      DBMS_OUTPUT.PUT_LINE('Błąd: Brak job do usunięcia');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Błąd: '||SQLERRM);
    END IF;
END;
/

-- Zadanie 9d: Procedura zwracająca zarobki i nazwisko (OUT)
CREATE OR REPLACE PROCEDURE get_salary_lastname(p_id NUMBER, p_salary OUT NUMBER, p_last OUT VARCHAR2) IS
BEGIN
  SELECT salary, last_name INTO p_salary, p_last FROM employees WHERE employee_id = p_id;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Brak pracownika o id '||p_id);
END;
/

-- Zadanie 9e: Procedura dodająca pracownika (id z sekwencji, wyjątek dla salary>20000)
CREATE OR REPLACE PROCEDURE add_employee(
  p_first_name VARCHAR2 := NULL,
  p_last_name VARCHAR2 := NULL,
  p_email VARCHAR2 := NULL,
  p_phone VARCHAR2 := NULL,
  p_hire_date DATE := SYSDATE,
  p_job_id VARCHAR2 := NULL,
  p_salary NUMBER := NULL,
  p_manager_id NUMBER := NULL,
  p_department_id NUMBER := NULL,
  p_commission_pct NUMBER := NULL
) IS
BEGIN
  IF p_salary > 20000 THEN
    RAISE_APPLICATION_ERROR(-20012, 'Wynagrodzenie za wysokie!');
  END IF;
  INSERT INTO employees(employee_id, first_name, last_name, email, phone, hire_date, job_id, salary, manager_id, department_id, commission_pct)
  VALUES (seq_emp_id.NEXTVAL, p_first_name, p_last_name, p_email, p_phone, p_hire_date, p_job_id, p_salary, p_manager_id, p_department_id, p_commission_pct);
  DBMS_OUTPUT.PUT_LINE('Dodano pracownika: '||p_first_name||' '||p_last_name);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Błąd: '||SQLERRM);
END;
/ 
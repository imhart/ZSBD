/*
1. Z tabeli employees wypisz w jednej kolumnie nazwisko i zarobki – nazwij kolumnę wynagrodzenie, dla osób z departamentów 20 i 50 z zarobkami pomiędzy 2000 a 7000, uporządkuj kolumny według nazwiska
2. Z tabeli employees wyciągnąć informację data zatrudnienia, nazwisko oraz kolumnę podaną przez użytkownika dla osób mających menadżera zatrudnionych w roku 2005. Uporządkować według kolumny podanej przez użytkownika
3. Wypisać imiona i nazwiska razem, zarobki oraz numer telefonu porządkując dane według pierwszej kolumny malejąco a następnie drugiej rosnąco (użyć numerów do porządkowania) dla osób z trzecią literą nazwiska 'e' oraz częścią imienia podaną przez użytkownika
4. Wypisać imię i nazwisko, liczbę miesięcy przepracowanych – funkcje months_between oraz round oraz kolumnę wysokość_dodatku jako (użyć CASE lub DECODE):
● 10% wynagrodzenia dla liczby miesięcy do 150
● 20% wynagrodzenia dla liczby miesięcy od 150 do 200
● 30% wynagrodzenia dla liczby miesięcy od 200
● uporządkować według liczby miesięcy
5. Dla każdego działów w których minimalna płaca jest wyższa niż 5000 wypisz sumę oraz średnią zarobków zaokrągloną do całości nazwij odpowiednio kolumny
6. Wypisać nazwisko, numer departamentu, nazwę departamentu, id pracy, dla osób z pracujących Toronto
7. Dla pracowników o imieniu "Jennifer" wypisz imię i nazwisko tego pracownika oraz osoby które z nim współpracują
8. Wypisać wszystkie departamenty w których nie ma pracowników
9. Wypisz imię i nazwisko, id pracy, nazwę departamentu, zarobki, oraz odpowiedni grade dla każdego pracownika
10.Wypisz imię nazwisko oraz zarobki dla osób które zarabiają więcej niż średnia wszystkich, uporządkuj malejąco według zarobków
11.Wypisz id imię i nazwisko osób, które pracują w departamencie z osobami mającymi w nazwisku "u"
12.Znajdź pracowników, którzy pracują dłużej niż średnia długość zatrudnienia w firmie.
13.Wypisz nazwę departamentu, liczbę pracowników oraz średnie wynagrodzenie w każdym departamencie. Sortuj według liczby pracowników malejąco.
14.Wypisz imiona i nazwiska pracowników, którzy zarabiają mniej niż jakikolwiek pracownik w departamencie "IT".
15.Znajdź departamenty, w których pracuje co najmniej jeden pracownik zarabiający więcej niż średnia pensja w całej firmie.
16.Wypisz pięć najlepiej opłacanych stanowisk pracy wraz ze średnimi zarobkami.
17.Dla każdego regionu, wypisz nazwę regionu, liczbę krajów oraz liczbę pracowników, którzy tam pracują.
18.Podaj imiona i nazwiska pracowników, którzy zarabiają więcej niż ich menedżerowie.
19.Policz, ilu pracowników zaczęło pracę w każdym miesiącu (bez względu na rok).
20.Znajdź trzy departamenty z najwyższą średnią pensją i wypisz ich nazwę oraz średnie wynagrodzenie.
*/

-- Zadanie 1
SELECT last_name, salary AS wynagrodzenie
FROM employees
WHERE department_id IN (20, 50)
  AND salary BETWEEN 2000 AND 7000
ORDER BY last_name;

-- Zadanie 2
-- Zamień :user_column na wybraną kolumnę, np. salary
SELECT hire_date, last_name, :user_column
FROM employees
WHERE manager_id IS NOT NULL
  AND EXTRACT(YEAR FROM hire_date) = 2005
ORDER BY :user_column;

-- Zadanie 3
-- Zamień :user_name_part na fragment imienia, np. 'an'
SELECT first_name || ' ' || last_name AS imie_nazwisko, salary, phone
FROM employees
WHERE SUBSTR(last_name, 3, 1) = 'e'
  AND LOWER(first_name) LIKE '%' || LOWER(:user_name_part) || '%'
ORDER BY 1 DESC, 2 ASC;

-- Zadanie 4
SELECT first_name, last_name,
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS miesiace,
       CASE
         WHEN MONTHS_BETWEEN(SYSDATE, hire_date) <= 150 THEN 0.1 * salary
         WHEN MONTHS_BETWEEN(SYSDATE, hire_date) > 150 AND MONTHS_BETWEEN(SYSDATE, hire_date) <= 200 THEN 0.2 * salary
         ELSE 0.3 * salary
       END AS wysokosc_dodatku
FROM employees
ORDER BY miesiace;

-- Zadanie 5
SELECT department_id,
       SUM(salary) AS suma_zarobkow,
       ROUND(AVG(salary)) AS srednia_zarobkow
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 5000;

-- Zadanie 6
SELECT e.last_name, e.department_id, d.department_name, e.job_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

-- Zadanie 7
SELECT e1.first_name, e1.last_name, e2.first_name AS wsp_first_name, e2.last_name AS wsp_last_name
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id AND e1.employee_id <> e2.employee_id
WHERE e1.first_name = 'Jennifer';

-- Zadanie 8
SELECT d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- Zadanie 9
SELECT e.first_name, e.last_name, e.job_id, d.department_name, e.salary,
       CASE
         WHEN e.salary < 3000 THEN 'A'
         WHEN e.salary < 6000 THEN 'B'
         ELSE 'C'
       END AS grade
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Zadanie 10
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- Zadanie 11
SELECT e1.employee_id, e1.first_name, e1.last_name
FROM employees e1
WHERE e1.department_id IN (
    SELECT department_id FROM employees WHERE LOWER(last_name) LIKE '%u%'
);

-- Zadanie 12
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > (
    SELECT AVG(MONTHS_BETWEEN(SYSDATE, hire_date)) FROM employees
);

-- Zadanie 13
SELECT d.department_name, COUNT(e.employee_id) AS liczba_pracownikow, ROUND(AVG(e.salary)) AS srednie_wynagrodzenie
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY liczba_pracownikow DESC;

-- Zadanie 14
SELECT first_name, last_name
FROM employees
WHERE salary < (
    SELECT MIN(e2.salary)
    FROM employees e2
    JOIN departments d ON e2.department_id = d.department_id
    WHERE d.department_name = 'IT'
);

-- Zadanie 15
SELECT DISTINCT d.department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees);

-- Zadanie 16
SELECT j.job_title, ROUND(AVG(e.salary)) AS srednia_zarobkow
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title
ORDER BY srednia_zarobkow DESC
FETCH FIRST 5 ROWS ONLY;

-- Zadanie 17
SELECT r.region_name,
       COUNT(DISTINCT c.country_id) AS liczba_krajow,
       COUNT(e.employee_id) AS liczba_pracownikow
FROM regions r
LEFT JOIN countries c ON r.region_id = c.region_id
LEFT JOIN locations l ON c.country_id = l.country_id
LEFT JOIN departments d ON l.location_id = d.location_id
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY r.region_name;

-- Zadanie 18
SELECT e.first_name, e.last_name, e.salary, m.first_name AS manager_first, m.last_name AS manager_last, m.salary AS manager_salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

-- Zadanie 19
SELECT TO_CHAR(hire_date, 'MM') AS miesiac, COUNT(*) AS liczba_pracownikow
FROM employees
GROUP BY TO_CHAR(hire_date, 'MM')
ORDER BY miesiac;

-- Zadanie 20
SELECT d.department_name, ROUND(AVG(e.salary)) AS srednie_wynagrodzenie
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY srednie_wynagrodzenie DESC
FETCH FIRST 3 ROWS ONLY; 
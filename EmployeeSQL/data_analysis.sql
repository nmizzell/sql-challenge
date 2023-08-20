-- 1
SELECT employees.emp_no AS "Employee Number"
	,last_name AS "Last Name"
	,first_name AS "First Name"
	,sex AS "Sex"
	,salaries.salary AS "Salary"
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no

-- 2
SELECT first_name AS "First Name"
	,last_name "Last Name"
	,hire_date "Hire Date"
FROM employees
WHERE extract(year FROM hire_date) = 1986

-- 3
SELECT dm.dept_no
	,d.dept_name
	,dm.emp_no
	,e.last_name
	,e.first_name
FROM dept_manager dm
LEFT JOIN departments d ON dm.dept_no = d.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no

-- 4
SELECT d.dept_no
	,e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no

-- 5
SELECT first_name
	,last_name
	,sex
FROM employees
WHERE first_name = 'Hercules'
	AND left(last_name, 1) = 'B'

-- 6
SELECT emp_no
	,last_name
	,first_name
FROM employees
WHERE emp_no IN (
		SELECT emp_no
		FROM dept_emp
		WHERE dept_no = (
				SELECT dept_no
				FROM departments
				WHERE dept_name = 'Sales'
				)
		)

-- 7
SELECT e.emp_no
	,d.dept_name
	,e.last_name
	,e.first_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development'

-- 8
SELECT last_name
	,count(*)
FROM employees
GROUP BY last_name
ORDER BY count(*) DESC
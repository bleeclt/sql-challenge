-- SELECT * FROM employees;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year', hire_date) = 1986;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- SELECT * FROM dept_manager
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager AS m
LEFT JOIN department AS d
ON m.dept_no = d.dept_no
LEFT JOIN employees as e
ON m.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
LEFT JOIN department as d
ON dept_emp.dept_no = d.dept_no
LEFT JOIN employees AS e
ON dept_emp.emp_no = e.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
LEFT JOIN department AS d
ON dept_emp.dept_no = d.dept_no
LEFT JOIN employees AS e
ON dept_emp.emp_no = e.emp_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
LEFT JOIN department AS d
ON dept_emp.dept_no = d.dept_no
LEFT JOIN employees AS e
ON dept_emp.emp_no = e.emp_no
WHERE dept_name IN ('Sales', 'Development');


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq
FROM employees
GROUP BY last_name
ORDER BY freq DESC;
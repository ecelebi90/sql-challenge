-- List the employee number, last name, first name, sex, and salary of each employee join salaries and employees tables
SELECT last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no; 


--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31'


--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept_manager.emp_no, 
       dept_manager.dept_no, 
	   departments.dept_name, 
	   employees.last_name, 
	   employees.first_name
FROM dept_manager
inner join 
	 departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN 
	employees ON dept_manager.emp_no = employees.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT 
	departments.dept_no,
	departments.dept_name,
	employees.emp_no,
	employees.first_name,
	employees.last_name
FROM dept_emp
INNER JOIN 
    departments ON dept_emp.dept_no = departments.dept_no
INNER JOIN 
    employees ON dept_emp.emp_no = employees.emp_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT 
	first_name, last_name, sex
FROM employees
where first_name = 'Hercules' and last_name LIKE 'B%'


--List each employee in the Sales department, including their employee number, last name, and first name
SELECT 
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_emp
INNER JOIN 
    employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT 
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_emp
INNER JOIN 
    employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_name = 'Sales' 
	
UNION 

SELECT 
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_emp
INNER JOIN 
    employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_name='Development';


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT last_name, count(*) AS "frequent_last_name_count"
FROM employees
group by last_name
order by "frequent_last_name_count" desc;

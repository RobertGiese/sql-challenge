-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", employees.gender as "Gender", salaries.salary as "Salary" from employees
	left join salaries
	on (employees.emp_no = salaries.emp_no)
	order by (employees.emp_no);

-- List employees who were hired in 1986.
SELECT employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", employees.hire_date as "Hire Date" from employees
	where (employees.hire_date >= '1986-1-1' AND employees.hire_date <= '1986-12-31')
	order by (employees.hire_date);

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no as "Department Number", 
	departments.dept_name as "Department Name", 
	dept_manager.emp_no as "Employee Number", 
	employees.last_name as "Last Name", 
	employees.first_name as "First Name", 
	dept_manager.from_date as "Start Date", 
	dept_manager.to_date as "End Date" from dept_manager
	join departments
	on (dept_manager.dept_no = departments.dept_no)
	join employees
	on (employees.emp_no = dept_manager.emp_no);

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number", 
	employees.last_name as "Last Name", 
	employees.first_name as "First Name", 
	departments.dept_name from employees
	join dept_emp
	on (employees.emp_no = dept_emp.emp_no)
	join departments
	on (dept_emp.dept_no = departments.dept_no);

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.last_name as "Last Name", employees.first_name as "First Name" from employees
	WHERE first_name = 'Hercules' and last_name like 'B%'
	order by (employees.last_name);

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name from employees
	join dept_emp
	on (employees.emp_no = dept_emp.emp_no)
	join departments
	on (dept_emp.dept_no = departments.dept_no)
	WHERE dept_name = 'Sales'
	ORDER BY employees.emp_no;
	
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name from employees
	join dept_emp
	on (employees.emp_no = dept_emp.emp_no)
	join departments
	on (dept_emp.dept_no = departments.dept_no)
	WHERE dept_name = 'Sales' or dept_name = 'Development'
	ORDER BY employees.emp_no;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name as "Last Name", COUNT(employees.last_name) as "Total" from employees
	GROUP BY (employees.last_name)
	ORDER BY ("Total") DESC;

SELECT employees.first_name as "First Name", employees.last_name as "Last Name", employees.emp_no as "Employee ID" from employees
	WHERE emp_no = '499942';
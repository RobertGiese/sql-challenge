CREATE TABLE employees(
	emp_no INT not null,
	birth_date VARCHAR not null,
	first_name VARCHAR not null,
	last_name VARCHAR not null,
	gender VARCHAR not null,
	hire_date DATE not null,
	primary key (emp_no)
)

CREATE TABLE departments(
	dept_no VARCHAR not null,
	dept_name VARCHAR not null,
	primary key (dept_no)
)

CREATE TABLE dept_emp(
	emp_no INT not null,
	dept_no VARCHAR not null,
	from_date DATE not null,
	to_date DATE not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
)

CREATE TABLE dept_manager(
	dept_no VARCHAR not null,
	emp_no INT not null,
	from_date DATE not null,
	to_date DATE not null,
	primary key (dept_no, emp_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
)

CREATE TABLE titles(
	emp_no INT not null,
	title VARCHAR not null,
	from_date DATE not null,
	to_date DATE not null,
	primary key (emp_no, title, from_date),
	foreign key (emp_no) references employees (emp_no)
)

CREATE TABLE salaries(
	emp_no INT not null,
	salary INT not null,
	from_date DATE not null,
	to_date DATE not null,
	primary key (emp_no, from_date),
	foreign key (emp_no) references employees (emp_no)
)


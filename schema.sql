/* titles - title_id, title
salaries - emp_no, salary
employees - emp_no, emp_title_id, birth_date,first_name,last_name,sex,hire_date
dept_manager - dep_no, emp_no
dept_emp - emp_no, dept_no
departments - dept_no, dept_name
*/

create table titles (title_id varchar(10) primary key, title varchar(50) not null);

--select * from titles;

create table departments (dept_no varchar(10) primary key,dept_name varchar(50) not null);

--select * from departments; 

create table employees (emp_no int primary key, 
      					 emp_title_id varchar(10) REFERENCES titles(title_id), birth_date date,first_name varchar(50) not null,last_name varchar(50) not null,sex char(1),hire_date date);
						 
						 
--select * from employees;

create table salaries (emp_no int references employees(emp_no) primary key, salary dec);

--select * from salaries;

create table dept_manager(dept_no varchar(10) references departments(dept_no), emp_no int references employees(emp_no), primary key(dept_no,emp_no));

--select * from dept_manager;

create table dept_emp(emp_no int references employees(emp_no),dept_no varchar(10) references departments(dept_no),primary key(emp_no,dept_no));

--select * from dept_emp;
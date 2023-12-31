--1. List the employee number, last name, first name, sex, and salary of each employee
select s.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employee as e
inner join salary as s
on s.emp_no = e.emp_no
order by s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
select last_name, first_name, hire_date 
from employee
where extract(year from hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
select distinct on (dept_manager.dept_no) dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
from dept_manager 
inner join department
on dept_manager.dept_no= department.dept_no
inner join employee
on dept_manager.emp_no = employee.emp_no
order by dept_manager.dept_no DESC;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
from employee as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join department as d
on de.dept_no = d.dept_no
order by e.emp_no DESC;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
select e.last_name, e.first_name
from employee as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
order by e.last_name;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name 
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employee as e
inner join dept_emp as cde
on e.emp_no = cde.emp_no
inner join department as d
on cde.dept_no = d.dept_no
where lower(d.dept_name) = 'sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employee as e
inner join dept_emp as cde
on e.emp_no = cde.emp_no
inner join department as d
on cde.dept_no = d.dept_no
where (lower(d.dept_name) = 'sales') or (lower(d.dept_name) = 'development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select last_name,count(last_name) as Frequency 
from employee 
group by last_name
order by frequency desc;
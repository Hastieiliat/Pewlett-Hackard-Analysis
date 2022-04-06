SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT RT.emp_no,
RT.first_name,
RT.last_name,
RT.title
FROM retirement_titles as RT;



SELECT DISTINCT ON (RT.emp_no) RT.emp_no,
RT.first_name,
RT.last_name,
RT.title
INTO unique_titles
FROM retirement_titles as RT
WHERE RT.to_date = '9999-01-01'
ORDER BY RT.emp_no ASC, RT.to_date DESC;


SELECT COUNT (UT.title), UT.title
INTO retiring_titles
FROM unique_titles as UT
Group by UT.title
ORDER BY count DESC;

select * from retiring_titles;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
DE.from_date,
DE.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER Join dept_emp as DE
on (e.emp_no = DE.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;
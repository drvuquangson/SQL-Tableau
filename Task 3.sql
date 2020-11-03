/* Compare the average salary of female versus male employees in the entire company 
until year 2002, and add a filter allowing you to see that per each department. */

SELECT 
    e.gender, ROUND(AVG(s.salary), 2) AS Salary, d.dept_name, YEAR(de.from_date) AS Calendar_year
    -- to_date will return employees who quit working for the company before 2002 not the employees working until 20002
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_no, e.gender, Calendar_year
-- Group by dept_no will also group all departments that have the same name
-- Group by gender will seperate gender into 'M' and 'F' of each deparmtnet
-- The same go for Calendar_year
HAVING Calendar_year <= 2002
ORDER BY d.dept_no;


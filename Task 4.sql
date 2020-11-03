/*Create an SQL stored procedure that will allow you to obtain the average male and female salary per department 
within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure */

-- SELECT min(salary) FROM t_salaries; = 50k

-- SELECT max(salary) FROM t_salaries; = 160k

DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary (In p_min_salary float, IN p_max_salary float)
BEGIN

SELECT e.gender, ROUND(AVG(s.salary), 2) AS salary, d.dept_name
FROM t_employees e 
	JOIN t_salaries s ON e.emp_no = s.emp_no 

	JOIN t_dept_emp de ON e.emp_no = de.emp_no 

	JOIN t_departments d ON de.dept_no = d.dept_no

WHERE  salary  BETWEEN p_min_salary AND p_max_salary
GROUP BY e.gender, d.dept_no;

END$$

DELIMITER ;

CALL filter_salary(50000, 160000);
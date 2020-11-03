/*Create a visualisation that provides a breakdown between the male and
 female employees working in the company each year, strating from 1990 */
 
 SELECT DISTINCT
    YEAR(d.from_date) AS calendar_year,
    e.gender AS gender,
    COUNT(e.emp_no) AS Number_of_employees
FROM
    t_dept_emp d
        JOIN
    t_employees e ON d.emp_no = e.emp_no
WHERE
    YEAR(d.from_date) >= 1990
GROUP BY YEAR(d.from_date), e.gender; -- Group distinct values of calendar_year and gender
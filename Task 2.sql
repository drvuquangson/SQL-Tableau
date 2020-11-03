/* Compare the number of male managers to the number of female managers from 
different departments for each year, starting from 1990 */

-- Note: t_departments: one department can have many managers, there are total of nine departments

 /* WHEN 1995 - 12 - 30 < YEAR(e.calendar_year) < 1998 - 12 - 29 THEN '1'
        ELSE '0' */

SELECT 
	dm.emp_no,
    d.dept_name,
    ee.gender,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN
            YEAR(dm.to_date) >= e.calendar_year
                AND YEAR(dm.from_date) <= e.calendar_year
        THEN
            1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e -- GROUP BY calendar_year to reduce 135639 rows to 11 rows
        CROSS JOIN
    t_dept_manager dm -- after CROSS JOIN you have 1584 rows (11 * 14)
        JOIN
    t_departments d ON d.dept_no = dm.dept_no -- INNER JOIN = still 1584 rows
        JOIN
    t_employees ee ON dm.emp_no = ee.emp_no -- INNER JOIN = still 1584 rows
ORDER BY dm.emp_no , calendar_year; 
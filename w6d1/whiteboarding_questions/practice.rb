Partner A: White Boarding

Ask your partner the below questions! **Don't spend longer than 20 minutes per
coding question.** Start a timer once the question has finished being read (or
the relevant information has been presented).

## Question One: Employees Query

You are given a PostgreSQL database with two tables: the first is an `employees`
table and the second is a `departments` table. Employees can belong to a single
department.

1.  Write a SQL query that, given a department name, finds all the employees
    `name`s that are in that department.

2.  Next find the name of the employees that dont belong to any department'

SELECT
    name
FROM
    employees
JOIN
    departments ON departments.id = employees.department_id
WHERE 
    departments.name = ?


SELECT
    name
FROM
    employees
WHERE employees.department_id IS NULL





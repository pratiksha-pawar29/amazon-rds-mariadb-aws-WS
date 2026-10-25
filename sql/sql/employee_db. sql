
-- Amazon RDS on AWS - MariaDB Project
-- Employee Database and CRUD Operations

CREATE DATABASE IF NOT EXISTS employee_db;

USE employee_db;

CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert sample records
INSERT INTO employees (name, department, salary)
VALUES
    ('Rahul', 'IT', 75000.00),
    ('Priya', 'HR', 65000.00),
    ('Amit', 'Finance', 70000.00);

-- Read all employee records
SELECT * FROM employees;

-- Find employees in the IT department
SELECT name, department, salary
FROM employees
WHERE department = 'IT';

-- Update Rahul's salary
UPDATE employees
SET salary = 80000.00
WHERE name = 'Rahul';

-- Verify the updated record
SELECT * FROM employees
WHERE name = 'Rahul';

-- Delete Amit's record
DELETE FROM employees
WHERE name = 'Amit';

-- Display remaining records
SELECT * FROM employees;

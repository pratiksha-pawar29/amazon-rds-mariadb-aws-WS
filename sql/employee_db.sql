
-- =========================================================
-- Project: Amazon RDS on AWS - MariaDB Database Deployment
-- Purpose: Demonstrate database creation and CRUD operations
-- Database: employee_db
-- =========================================================

-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS employee_db;

-- Select the database
USE employee_db;

-- WARNING:
-- This drops the existing employees table and its data.
-- Remove this statement if you need to preserve existing data.
DROP TABLE IF EXISTS employees;

-- Create the employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- CREATE: Insert sample employee records
INSERT INTO employees (name, department, salary)
VALUES
    ('Rahul', 'IT', 75000.00),
    ('Priya', 'HR', 65000.00),
    ('Amit', 'Finance', 70000.00);

-- READ: Display all employees
SELECT * FROM employees;

-- READ: Display employees in the IT department
SELECT name, department, salary
FROM employees
WHERE department = 'IT';

-- UPDATE: Change Rahul's salary
UPDATE employees
SET salary = 80000.00
WHERE name = 'Rahul';

-- Verify the updated record
SELECT * FROM employees
WHERE name = 'Rahul';

-- DELETE: Remove Amit's record
DELETE FROM employees
WHERE name = 'Amit';

-- Display the final records
SELECT * FROM employees;

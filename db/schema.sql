-- first we neet to clean everything from database if exists before creating:
DROP DATABASE IF EXISTS employees;
-- create new database:
CREATE DATABASE employees;
-- The USE Statement is used to select a database and perform SQL operations into that database:
USE employees;

CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(30)
)
CREATE TABLE role (
    id INT PRIMARY KEY,

    title VARCHAR(30),
    --  to hold role salary
    salary DECIMAL,
    -- to hold reference to department role belongs to
    department_id INT 

    -- create FOREIGN KEY to connect the department table
    FOREIGN KEY (department_id) REFERENCES department(id)
)
CREATE TABLE employee (
    id INT PRIMARY KEY,
    -- to hold employee first name
    first_name VARCHAR(30),
    -- to hold employee last name 
    last_name VARCHAR(30),
    -- to hold reference to employee role
    role_id INT,
    -- to hold reference to another employee that is the manager of the current employee (`null` if the employee has no manager)
    manager_id INT
)


-- first we neet to clean everything from database if exists before creating:
DROP DATABASE IF EXISTS employees;
-- create new database:
CREATE DATABASE employees;
-- The USE Statement is used to select a database and perform SQL operations into that database:
USE employees;

CREATE TABLE department (
-- AUTO_INCREMENT means that it is unique and  it is gonna get added automaticaly and incremented automaticaly 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);
CREATE TABLE role (

    id NOT NULL AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(30) NOT NULL,
    --  to hold role salary
    salary DECIMAL(20, 2) NULL,
    -- to hold reference to department role belongs to
    department_id INT  NOT NULL,
     -- create FOREIGN KEY to connect the department table
    FOREIGN KEY (department_id) 
            REFERENCES department(id)
            ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE employee (

    id NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- to hold employee first name
    first_name VARCHAR(30) NOT NULL,
    -- to hold employee last name 
    last_name VARCHAR(30) NOT NULL,
    -- to hold reference to employee role
    role_id INT NOT NULL,
    -- to hold reference to another employee that is the manager of the current employee (`null` if the employee has no manager)
    manager_id INT NULL,
    FOREIGN KEY (role_id) 
        REFERENCES role(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (manager_id)
        REFERENCES employee(id)
        ON DELETE SET NULL  ON UPDATE CASCADE
);


-- first we neet to clean everything from database if exists before creating:
DROP DATABASE IF EXISTS employees;
-- create new database:
CREATE DATABASE employees;
-- The USE Statement is used to select a database and perform SQL operations into that database:
USE employees;

CREATE TABLE department (
-- AUTO_INCREMENT means that it is unique and  it is gonna get added automaticaly and incremented automaticaly 
    id INT NOT NULL AUTO_INCREMENT,
    -- Makes a string column called "name" which cannot contain null --
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE role (
-- create a numeric colum called "id" which will automatically incremet its default value as we create new rows --  
    id INT NOT NULL AUTO_INCREMENT,
 
    title VARCHAR(30) NOT NULL,
    --  to hold role salary
    salary INT NULL,
    -- to hold reference to department role belongs to
    department_id INT,
    PRIMARY KEY(id),
     -- create FOREIGN KEY to connect the department table
    FOREIGN KEY (department_id) 
            REFERENCES department(id)
                ON DELETE SET NULL
);
CREATE TABLE employee (

    id  INT NOT NULL AUTO_INCREMENT,
    -- to hold employee first name
    first_name VARCHAR(30) NOT NULL,
    -- to hold employee last name 
    last_name VARCHAR(30) NOT NULL,
     PRIMARY KEY(id),
    -- to hold reference to employee role
    role_id INT,
    -- to hold reference to another employee that is the manager of the current employee (`null` if the employee has no manager)
    manager_id INT NULL,
    FOREIGN KEY (role_id) 
        REFERENCES role(id)
            ON DELETE SET NULL,
    FOREIGN KEY (manager_id) 
        REFERENCES employee(id)
            ON DELETE SET NULL
);


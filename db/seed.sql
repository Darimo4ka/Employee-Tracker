-- will create decking company employee tracker. since this is standard layout for departments in small business inviroment(constraction company, landscaping company ext.)
USE employees;
INSERT INTO department (name)
VALUES  ("Sales"),
        ("Legal"),
        ("Finance"),
        ("Engineering");

INSERT INTO role (title, salary, department_id)
VALUES  ("Sales Person", 50000, 1), 
        ("lawyer", 70000, 2),
        ("Paralegal", 45000, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES  ("John", "Doe", 1,  NULL),
        ("Jenny", "Stark", 1, 1),
        ("Clark", "Mendes", 2, NULL),
        ("Sofia", "Red", 3, 3);
       
INSERT INTO department (name)
VALUES  ("Sales"),
        ("Legal"),
        ("Finance"),
        ("Engineering");

SELECT * FROM DEPARTMENT;       

INSERT INTO role (title, salary, department_id)
VALUES  ("Sales Person", 50000, 1), 
        ("lawyer", 70000, 2),
        ("Paralegal", 45000, 2),
        ("Accountant", 55000, 3),
        ("Stractural Engineer", 75000, 4);

SELECT * FROM ROLE;        

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES  ("John", "Doe", 1,  NULL),
        ("Jenny", "Stark", 1, 1),
        ("Clark", "Mendes", 2, NULL),
        ("Sofia", "Red", 3, 3),
        ("Andrew", "Green", 4 , NULL),
        ("Jennifer", "Rodriguez", 4, 5),
        ("Armando", "Alvares", 5, NULL);
       
SELECT * FROM employee;       
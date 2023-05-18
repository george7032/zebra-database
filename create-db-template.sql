SHOW DATABASES;
CREATE DATABASE zebra;

USE zebra;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    second_name VARCHAR(20),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

ALTER TABLE employee
ADD FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;



INSERT INTO employee VALUES (100, 'Jan', 'Lemon', '1961-05-11', 'M', 110000, 100, 1);
INSERT INTO employee VALUES (101, 'Michael', 'Scott', '1964-03-05', 'F', 75000, 100, 2);
INSERT INTO employee VALUES (102, 'Angela', 'Martin', '1971-06-25', 'M', 63000, 102, 2);
INSERT INTO employee VALUES (103, 'Kelly', 'Kapon', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES (104, 'George', 'Kimani', '1958-02-05', 'F', 69000, 102, 2);
INSERT INTO employee VALUES (105, 'Peter', 'James', '1969-02-19', 'M', 78000, 100, 3);
INSERT INTO employee VALUES (106, 'Lilian', 'Wamaitha', '1973-09-05', 'M', 65000, 106, 3);
INSERT INTO employee VALUES (107, 'Samuel', 'Njuguna', '1978-07-22', 'F', 71000, 106, 3);
INSERT INTO employee VALUES (108, 'Sarah', 'Wambui', '1967-10-01', 'M', 250000, 100, 1);


CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(20) NOT NULL,
    mgr_id INT, 
    mgr_start_date DATE
    
);

ALTER TABLE branch
ADD FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

INSERT INTO branch VALUES (1, 'Corporate', 100, '2006-02-09');
INSERT INTO branch VALUES (2, 'Scranton', 102, '1992-04-06');
INSERT INTO branch VALUES (3, 'Stamford', 106, '1998-02-13');

USE zebra;

CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR (30),
    branch_id INT
);

ALTER TABLE client
ADD FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;

INSERT INTO client VALUES (400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES (401, 'Lackawana Country', 2);
INSERT INTO client VALUES (402, 'Fed Ex', 3);
INSERT INTO client VALUES (403, 'Hohn Daly Law LLC', 3);
INSERT INTO client VALUES (404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES (405, 'Times Newspaper', 3);
INSERT INTO client VALUES (406, 'Fed Ex', 2);

CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(50),
    supply_type VARCHAR (50), 
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE    
);

INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'paper');

INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'paper');

INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'paper');

INSERT INTO branch_supplier VALUES(2, 'J.L Forms $ Labels', 'paper');

INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'paper');

INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'paper');

INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'paper');

SELECT * FROM client;

CREATE TABLE work_with(
    emp_id INT ,
    client_id INT,
    total_sales INT,
    PRIMARY KEY (emp_id, client_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE, 
    FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);
DROP TABLE work_with;

DESC work_with;

SELECT * FROM work_with;

INSERT INTO work_with VALUES(105, 400, 55000);
INSERT INTO work_with VALUES(102, 401, 267000);
INSERT INTO work_with VALUES(108, 402, 22000);
INSERT INTO work_with VALUES(107, 403, 5000);
INSERT INTO work_with VALUES(108, 403, 12000);
INSERT INTO work_with VALUES(105, 404, 33000);
INSERT INTO work_with VALUES(107, 405, 26000);
INSERT INTO work_with VALUES(102, 406, 15000);
INSERT INTO work_with VALUES(105, 406, 130000);


SELECT * FROM work_with;
SELECT * FROM employee;
SELECT * FROM branch;
SELECT * FROM client;
SELECT * FROM branch_supplier;


--QUERIES

SHOW DATABASES;

USE zebra;

SHOW TABLES;


DESC employee;


SELECT *
FROM employee;

SELECT *
FROM employee
ORDER BY salary;

SELECT * 
FROM employee
ORDER BY salary DESC;

SELECT *
FROM employee
ORDER BY sex , first_name , second_name;

SELECT * 
FROM employee
LIMIT 5;

SELECT first_name, second_name
FROM employee;

SELECT first_name AS foreName, second_name AS SurName
FROM employee;


SELECT DISTINCT sex     
FROM employee;

SELECT COUNT(emp_id)
FROM employee;

SELECT COUNT(emp_id)
FROM employee
WHERE sex= 'F' AND birth_date >'1970-01-01';







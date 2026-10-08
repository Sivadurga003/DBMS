create database company;
use company;

CREATE TABLE Department (
dep_id INT PRIMARY KEY,
dep_name VARCHAR(50)NOT NULL,
dep_adrress VARCHAR(50));

CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50) NOT NULL,
age INT,
salary DECIMAL(10,2),
dep_id INT,
FOREIGN KEY(dep_id)
REFERENCES Department(dep_id)
);

INSERT INTO Department(dep_id,dep_name,dep_adrress)
VALUES
(1,"AIML","Kakinada"),
(2,"CSE","Yeleswaram"),
(3,"DS","Yerraram"),
(4,"MECH","kakinada");

INSERT INTO Employee(emp_id,emp_name,age,salary,dep_id)
VALUES 
(101,"siva",20,20000,1),
(102,"Vijay",29,30000,1),
(103,"Bala",23,10000,2),
(104,"Mahesh",24,30000,3),
(105,"Praveen",23,20000,4);

SELECT emp_id,dep_id FROM Employee;

CREATE VIEW De AS  
SELECT emp_name,salary FROM Employee WHERE Salary=20000;

SELECT * FROM De;


CREATE VIEW Dept AS 
SELECT Employee.age,Employee.emp_name
FROM Employee;

SELECT * From DEPt;

INSERT INTO Dept(age,emp_name)
VALUES (43,"harsha");
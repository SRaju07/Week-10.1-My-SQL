-- Create Database
-------------------
CREATE DATABASE Amazon;
-------------------------------------------------------------------------------------------
-- To view created database
---------------------------
SHOW DATABASES;
-------------------------------------------------------------------------------------------
-- Select the database to work
------------------------------
USE amazon;
-------------------------------------------------------------------------------------------
-- Create Employees Table (Table-1)
 ------------------------------------
CREATE TABLE Employees(Emp_ID INT PRIMARY KEY UNIQUE,
		Name VARCHAR(50), 
        Age INT,
        Salary INT,
        Department_ID INT);
-------------------------------------------------------------------------------------------
-- Insert into Table
----------------------
INSERT INTO Employees(Emp_ID, Name, Age, Salary, Department_ID) VALUES
		(1, 'John', 30, 60000, 101),
		(2, 'Emily', 25, 48000, 102),
		(3, 'Michael', 40, 75000, 103),
		(4, 'Sara', 35, 56000, 101),
		(5, 'David', 28, 49000, 102),
		(6, 'Robert', 45, 90000, 103),
		(7, 'Sophia', 29, 51000, 102);
-------------------------------------------------------------------------------------------
-- View full table in tabular form
-----------------------------------
SELECT* FROM Employees;
-------------------------------------------------------------------------------------------
-- Create Departments Table (Table-2)
 ------------------------------------
 CREATE TABLE Departments(Department_ID INT, 
		Department_Name VARCHAR(50));
-------------------------------------------------------------------------------------------
 -- Insert into Table
----------------------
INSERT INTO Departments VALUES
	(101,'HR'),
	(102,'Finance'),
	(103,'IT');
-------------------------------------------------------------------------------------------
   -- View full table in tabular form
-----------------------------------
SELECT* FROM Departments;     
 -------------------------------------------------------------------------------------------
-- Create Sales Table (Table-3)
 ------------------------------------       
CREATE TABLE Sales (Sales_ID INT PRIMARY KEY,
		Customer_ID INT,
        Amount DECIMAL (10,2),
        Sales_Date DATE);
-------------------------------------------------------------------------------------------
 -- Insert into Table
----------------------
INSERT INTO Sales(Sales_ID, Customer_ID, Amount, Sales_Date) VALUES
	(1, 101, 4500.00, '2023-03-15'),
	(2, 102, 5500.00, '2023-03-16'),
	(3, 103, 7000.00, '2023-03-17'),
	(4, 104, 3000.00, '2023-03-18'),
	(5, 105, 6000.00, '2023-03-19');
-------------------------------------------------------------------------------------------
   -- View full table in tabular form
--------------------------------------
SELECT* FROM Sales;
 -------------------------------------------------------------------------------------------
-- Create Product Table (Table-4)
 ------------------------------------
CREATE TABLE Products (Product_ID INT PRIMARY KEY,
	Product_Name VARCHAR(50),
    Price INT);
 -------------------------------------------------------------------------------------------
 -- Insert into Table
----------------------
INSERT INTO Products(Product_ID, Product_name, Price) VALUES
	(1, 'Laptop', 1000),
	(2, 'Mobile', 500),
	(3, 'Tablet', 300),
	(4, 'Headphones', 100),
	(5, 'Smartwatch', 200);
-------------------------------------------------------------------------------------------
   -- View full table in tabular form
--------------------------------------
SELECT* FROM Products;
 -------------------------------------------------------------------------------------------
-- Create Order Table (Table-5)
 ------------------------------------
CREATE TABLE Orders (Order_ID INT PRIMARY KEY,
	Customer_Name VARCHAR(50),
    Order_Date DATE,
    Order_Amount INT);
-------------------------------------------------------------------------------------------
 -- Insert into Table
----------------------
INSERT INTO Orders(Order_ID, Customer_Name, Order_Date, Order_Amount) VALUES
	(1, 'John', '2023-05-01', 500),
	(2, 'Emily', '2023-05-02', 700),
	(3, 'Michael', '2023-05-03', 1200),
	(4, 'Sara', '2023-05-04', 450),
	(5, 'David', '2023-05-05', 900),
	(6, 'John', '2023-05-06', 600),
	(7, 'Emily', '2023-05-07', 750);
-------------------------------------------------------------------------------------------
   -- View full table in tabular form
--------------------------------------
SELECT* FROM Orders;
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
/*-- Question 1: Retrieve Employee Details
Retrieve all employees whose salary is greater than 60000.*/
-------------------------------------------------------------------------------------------
SELECT * FROM Employees
	WHERE Salary > 60000;
    
-------------------------------------------------------------------------------------------
/*-- Question 2: Find Total Sales Per Customer
Calculate the total sales amount for each customer from the sales table. */
-------------------------------------------------------------------------------------------
SELECT Customer_ID, 
	SUM(Amount) AS Total_Sales FROM Sales 
	GROUP BY Customer_ID;

-------------------------------------------------------------------------------------------
/*-- Question 3: Employee Salary in Finance Department
Retrieve the names and salaries of all employees working in the 'Finance' department. */
-------------------------------------------------------------------------------------------
SELECT Name, Salary FROM Employees
	JOIN Departments USING (Department_ID)
	WHERE Department_Name='Finance';

-------------------------------------------------------------------------------------------
/*-- Question 4: Total Sales on a Specific Date
Find the total sales amount made on '2023-03-17'. */
-------------------------------------------------------------------------------------------
SELECT SUM(Amount) AS Total_Sales FROM Sales
	WHERE Sales_Date='2023-03-17';
    
-------------------------------------------------------------------------------------------
/*-- Question 5: High-Value Orders
Get the names of customers who have placed an order of more than 600. */
-------------------------------------------------------------------------------------------

SELECT Customer_NAME FROM Orders
	WHERE Order_Amount > 600;
  
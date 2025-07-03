create database shops;
use shops;


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO Customers VALUES
(1, 'Manish', 'Pune'),
(2, 'Nisha', 'Mumbai'),
(3, 'Niraj', 'Delhi');

INSERT INTO Orders VALUES
(101, 1, '2025-06-01', 200.00),
(102, 2, '2025-06-03', 100.00),
(103, 1, '2025-06-05', 150.00);


-- creating View with Complex SELECT

CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_spent,
    AVG(o.amount) AS avg_order_value
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name, c.city;
    
    
    SELECT * FROM CustomerOrderSummary;
    
    
    -- Abstraction
    -- I want users to access only order summaries, not raw order data
    
    
    CREATE VIEW OrderTotals AS
SELECT 
    customer_id,
    SUM(amount) AS total_amount
FROM 
    Orders
GROUP BY 
    customer_id;
    
    -- Users can query
    
    SELECT * FROM OrderTotals;
    
    -- Security
    -- Suppose Employees table has sensitive info
    
    CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);


-- I want normal users to only see names and departments

CREATE VIEW PublicEmployees AS
SELECT name, department FROM Employees;




    
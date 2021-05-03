-- Starting with the employee table, there are EmployeeId and LastNm for 10 employees  
-- Now, looking at the order table, there is a EmployeeId foreign key for each order record

-- Since the order table contains a foreign key for the employee, I can join both tables
--      together using an inner join on this foreign key. This puts the corresponding order and employee data together 

-- With the employee and order data together, I need to be able to count the number of records for a certain employeeId.

-- To do this, I first need to group the data by employee. I can now use COUNT(*) to count 
--      the number of records/orders being grouped by employee

-- To get the most orders, I should order the records in a descending manner (most orders at the top) 

SELECT e.LastName, COUNT(*) AS NumOrders
FROM Employees e
JOIN Orders o
	ON e.EmployeeId = o.EmployeeId
GROUP BY e.EmployeeId
ORDER BY COUNT(*) DESC
-- LIMIT 1;

-- Answer: Peacock
-- employee with most orders (lname)

-- Starting with the employee table, there are EmployeeId and LastNm for 10 employees  
-- Now, looking at the order table, there is a EmployeeId foreign key for each order record

-- Since the order table contains a foreign key for the employee, I can join both tables
--      together using an inner join on this foreign key. This puts the corresponding order and employee data together 
--      (each 'temporary record' is an order with employee info)

-- With the employee and order data together, I need to be able to count the number of records (which can be thought of as orders)
--         for a certain employeeId.
-- To do this, I first need to group the data by employee. I can now use the aggregate COUNT() sql function to count 
-- each the number of records/orders being grouped by employee

-- To only get the most orders, I should order the records in a descending manner (most orders at the top) and then take the top record

-- Finally, to get the last name I just need to select the lastname from the employee table

SELECT e.LastName
FROM Employees e
JOIN Orders o
	ON e.EmployeeId = o.EmployeeId
GROUP BY e.EmployeeId
ORDER BY COUNT(*) DESC
LIMIT 1;

-- answer: Peacock
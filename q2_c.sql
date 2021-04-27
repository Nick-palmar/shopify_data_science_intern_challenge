-- The customers table contains, PK: CustomerId, Column: country
-- The products table has, PK: ProductId, Column: product name (answer will be pulled from here), FK: SupplierId, CategoryId
-- The orders table has, PK: OrderId, FK: CustomerId, EmployeeId, ShipperId
-- NOTE: Orders has customerId FK, cusmoters has country column (where we can identify Germany)
-- The orderDetails table has: PK OrderDetailId, FK: OrderId, ProductId, Column: Quantity
-- NOTE: Orders and OrderDetails can be joined to get product information from an order (in terms of type and quantity)

-- start by joining the orders with only the german customers to ensure we are only looking at German orders for the rest of the query.
--      Join on using the customerId foreign key in the order table (which is the primary key for customers) 

-- We need most ordered products - the order table does not contain any info about qunatity but the OrderDetails does. This means we need to join the OrderDetail table 
--      (again using a the OrderId foreign key in the OrderDetails table) in order to have access to specific products and quantities.

-- The OrderDetails also contains a productId foreign key; I ultimately want product names so I must join the product table to the OrderDetails table  
--      to get access to the product names. 

-- Now that I have orders with associated productIds, productNames and quantities for German customers, I can group and order the data to solve the problem.
-- Since I am looking for most popular products, I know I must group the current result-set by productId's so that everyhting is in terms of products.

-- Now, I can order the products by the total quantity (which would be the sums of the individual qunaities). By ordering the total quantities
--      In a descending manner, I can have the most ordered product on top of the final query result. 

-- Since each productId corresponds with a single ProductName, I can select the product name (without any interference from the grouup by clause)

-- Evidently, Germans like Boston Crab Meat (160 Orders, max)!

SELECT p.ProductName, SUM(od.quantity) AS TotalGermanCustomerOrders
FROM Customers c
JOIN Orders o
	ON c.CustomerId = o.CustomerId
    	AND c.Country = 'Germany'
JOIN OrderDetails od
	ON od.OrderId = o.OrderId
JOIN Products p
	ON p.ProductId = od.ProductId
GROUP BY p.ProductId
ORDER BY SUM(od.quantity) DESC

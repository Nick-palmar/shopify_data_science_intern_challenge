-- speedy express is a shipper w/ shipperId 1
-- each order has a shipperId associated with it
-- each order has order details which includes an order id and quantity
SELECT SUM(od.Quantity) AS TotalProductShipsSpeedyExpress
FROM Shippers s
JOIN Orders o
	ON s.ShipperId = o.ShipperId
JOIN OrderDetails od
	ON o.OrderId = od.OrderId
WHERE s.ShipperId = 1

-- answer: 3575 total orders shipped 



-- speedy express is a shipper w/ shipperId 1
-- each order has a shipperId associated with it

-- Assuming that each record in the order table is a distinct order 
--      (which they are; I checked) I can join the order table through the foreign 'ShipperId' key.
--      This gives me a temporary result set containing all orders with shipper Id info

-- Since I only want to get speedy express shipments, I reduce the result set to ShipperId's of 1 
--      (since speedy shippers has a shipping id of 1)

-- The only remaining orders are those for speedy express so I should not use COUNT() to count the number of orders for speedy express

SELECT COUNT(*) AS TotalOrderShipsSpeedyExpress
FROM Shippers s
JOIN Orders o
	ON s.ShipperId = o.ShipperId
WHERE s.ShipperId = 1

-- answer: 54 orders shipped
        
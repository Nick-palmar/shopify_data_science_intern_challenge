-- speedy express is a shipper w/ shipperId 1
-- each order has a shipperId associated with it

-- Assuming that each record in the order table is a distinct order 
--      I can join the order table to the shipper table through the foreign 'ShipperId' key.

-- Since I only want to get speedy express shipments, I reduce the result set to ShipperId's of 1 
--      (since speedy shippers has a shipping id of 1)

-- The remaining orders are those for speedy express so use COUNT(*) to count the number of orders 

SELECT COUNT(*) AS TotalOrderShipsSpeedyExpress
FROM Shippers s
JOIN Orders o
	ON s.ShipperId = o.ShipperId
WHERE s.ShipperId = 1

-- Answer: 54 orders 
        
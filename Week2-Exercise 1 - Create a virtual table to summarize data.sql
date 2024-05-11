-- TASK-1
CREATE VIEW OrderView AS 
SELECT
	o.OrderID,
    o.Quantity,
    o.TotalCost
FROM orders o
WHERE o.Quantity > 2;


SELECT * FROM OrderView;

-- Task 2

SELECT 
    c.CustomerID,
    concat(c.FirstName, '', c.LastName),
    o.OrderID,
    o.TotalCost,
    m.ItemName,
    m.Cuisine
FROM customers c INNER JOIN bookings b
    ON c.CustomerID = b.CustomerID
INNER JOIN orders o
    ON b.BookingID = o.BookingID
INNER JOIN menu m
    on o.MenuID = m.MenuID
;
    
-- Task 3

SELECT m.ItemName
FROM menu m
WHERE MenuID = ANY (SELECT MenuID FROM orders WHERE Quantity > 2)
;
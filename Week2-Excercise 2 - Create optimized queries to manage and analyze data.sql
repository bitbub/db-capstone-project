-- Task-1 Write a procedure 'GetMaxQuantity'

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity)
    FROM Orders
END //

DELIMITER;


CALL GetMaxQuantity();



-- Task-2 Write a prepare statement

PREPARE GetOrderDetail FROM 'SELECT * FROM customers c INNER JOIN bookings b ON c.BookingID = b.BookingID INNER JOIN orders o ON b.OrderID = o.OrderID WHERE c.CustomerID = ? ';

SET @id = 1;

EXECUTE GetOrderDetail USING @id;



-- Task-3 Write a procedure 'CancelOrder'

DELIMITER //

CREATE PROCEDURE CancleOrder(IN orderid INT)
BEGIN

DELETE FROM Orders
WHERE OrderID = orderid
END //

DELIMITER ;

CALL CancleOrder(5);
-- Task - 1 create procedure AddBooking
DELIMITER //

CREATE PROCEDURE AddBooking (IN b_id INT, IN b_date DATE, t_no INT, c_id INT, s_id INT )
BEGIN
	INSERT INTO bookings (BookingID,BookingDate,TableNo,CustomerID,StaffID) VALUES
    (b_id, b_date, t_no, c_id, s_id);
END//

DELIMITER ;

CALL AddBooking(9,"2022-12-30",3,4,5);




-- Task - 2 create procedure UpdateBooking
DELIMITER //
CREATE PROCEDURE UpdateBooking (IN b_id INT, IN b_date DATE)
BEGIN
	UPDATE bookings 
    SET BookingID = b_id and BookingDate = b_date
    WHERE b_id = 8
 END//
 DELIMITER ;

CALL UpdateBooking(9,"2022-12-17");




-- Task - 3 create procedure CancelBooking

DELIMITER //
CREATE PROCEDURE CancelBooking (IN b_id INT)
BEGIN
	DELETE FROM  bookings 
    WHERE BookingID = b_id
END//
DELIMITER ;

CALL UpdateBooking(9,"2022-12-17");
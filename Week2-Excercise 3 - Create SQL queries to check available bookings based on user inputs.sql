-- Task-1 insert data into booking table

INSERT INTO Bookings (BookingID, BookingDate, Table, CustomerID) VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1)
;


-- Task-2 create a procedure called CheckBooking


CREATE PROCEDURE CheckBooking(IN data DATE, IN id INT)
BEGIN
SELECT *
	CASE b.BookingDate == date and b.BookingID = id THEN 'Table @id is already booked'
	END as Booking status
FROM Bookings b
END
;


-- Task-3 create a procedure called AddValidBooking

CREATE PROCEDURE AddValidBooking(IN a DATE, IN b INT)
SET @customer_id = 2
SET @booking_id = 5
BEGIN
	START TRANSATION
		IF EXIST(SELECT * FROM Bookings WHERE BookingDate = a and Table = b)
			SELECT 'Table b is already booked - booking cancelled'
			ROLLBACK;
		ELSE
			INSERT INTO Bookings (BookingID, BookingDate, Table, CustomerID) VALUES
			(@booking_id, a, b, @customer_id);
		END IF;
	COMMIT;
END;	

CALL AddValidBooking('2022-12-17', 6)
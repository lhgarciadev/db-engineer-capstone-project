DELIMITER $$

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN new_booking_date DATE)
BEGIN
    UPDATE Bookings
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;
    SELECT 'Booking successfully updated' AS Status;
END $$

DELIMITER ;

CALL UpdateBooking(5, '2022-12-05');

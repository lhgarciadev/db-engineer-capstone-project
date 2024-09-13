DELIMITER $$

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = booking_id;
    SELECT 'Booking successfully canceled' AS Status;
END $$

DELIMITER ;

CALL CancelBooking(5);

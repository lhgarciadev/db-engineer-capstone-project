DELIMITER $$

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT, IN customer_id INT)
BEGIN
    DECLARE booking_status INT;
    START TRANSACTION;
    
    -- Verifica si la mesa ya está reservada en la fecha dada
    SELECT COUNT(*)
    INTO booking_status
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;
    
    -- Si la mesa está reservada, realiza rollback; de lo contrario, inserta la nueva reserva
    IF booking_status > 0 THEN
        ROLLBACK;
        SELECT 'Booking failed: Table is already booked' AS Status;
    ELSE
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (booking_date, table_number, customer_id);
        COMMIT;
        SELECT 'Booking successful' AS Status;
    END IF;
END $$

DELIMITER ;

CALL AddValidBooking('2022-10-10', 5, 2);
CALL AddValidBooking('2022-12-01', 3, 2);


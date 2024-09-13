DELIMITER $$

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE booking_status INT;
    
    -- Verifica si existe una reserva para la mesa y fecha proporcionada
    SELECT COUNT(*)
    INTO booking_status
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;
    
    -- Muestra si la mesa está reservada o disponible
    IF booking_status > 0 THEN
        SELECT 'Table is already booked' AS Status;
    ELSE
        SELECT 'Table is available' AS Status;
    END IF;
END $$

DELIMITER ;

CALL CheckBooking('2022-10-10', 5);

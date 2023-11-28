CREATE PROCEDURE UpdateBooking (IN p_BookingID INT, IN p_BookingDate DATE)
BEGIN
    DECLARE error_message VARCHAR(255);

    -- Verificar si la reserva existe antes de intentar actualizarla
    IF NOT EXISTS (SELECT 1 FROM booking WHERE booking_id = p_BookingID) THEN
        SET error_message = 'La reserva no existe.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    ELSE
        -- Actualizar la fecha de la reserva
        UPDATE booking SET date = p_BookingDate WHERE booking_id = p_BookingID;

        SELECT '' AS result;
    END IF;
END

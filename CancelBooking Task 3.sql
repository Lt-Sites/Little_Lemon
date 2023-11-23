CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN p_BookingID INT)
BEGIN
    DECLARE error_message VARCHAR(255);

    -- Verificar si la reserva existe antes de intentar cancelarla
    IF NOT EXISTS (SELECT 1 FROM booking WHERE booking_id = p_BookingID) THEN
        SET error_message = 'La reserva no existe.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    ELSE
        -- Eliminar la reserva si existe
        DELETE FROM booking WHERE booking_id = p_BookingID;

        SELECT 'Reserva cancelada correctamente.' AS result;
    END IF;
END

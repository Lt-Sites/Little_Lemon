CREATE PROCEDURE AddValidBooking (IN p_BookingDate DATE, IN p_TableNumber INT)
BEGIN
    DECLARE error_message VARCHAR(255);

    START TRANSACTION;

    -- Verificar si ya existe una reserva para la fecha y la mesa proporcionadas
    IF EXISTS (SELECT 1 FROM booking WHERE date = p_BookingDate AND table_number = p_TableNumber) THEN
        SET error_message = 'Ya hay una reserva para esa fecha y mesa.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    ELSE
        -- Insertar la reserva si no existe una reserva para la fecha y mesa proporcionadas
        INSERT INTO booking (date, table_number)
        VALUES (p_BookingDate, p_TableNumber);

        SELECT 'Reserva agregada correctamente.' AS result;
    END IF;

    COMMIT;
    


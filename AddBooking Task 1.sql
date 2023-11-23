CREATE PROCEDURE AddBooking (IN p_BookingID INT, IN p_CustomerID INT, IN p_TableNumber INT, IN p_BookingDate DATE)
BEGIN
    DECLARE error_message VARCHAR(255);
    
    -- Verificar si la reserva ya existe
    IF EXISTS (SELECT 1 FROM booking WHERE bookingid = p_BookingID) THEN
        SET error_message = 'La reserva ya existe.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    ELSE
        -- Insertar la reserva
        INSERT INTO booking (bookingid, customerid, tablenumber, date)
        VALUES (p_BookingID, p_CustomerID, p_TableNumber, p_BookingDate);
        
        SELECT 'Reserva agregada correctamente.' AS result;
    END IF;
END

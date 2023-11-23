CREATE PROCEDURE CancelOrder(IN p_OrderID INT)
BEGIN
    DECLARE error_message VARCHAR(255);

    -- Verificar si la orden existe antes de intentar cancelarla
    IF NOT EXISTS (SELECT 1 FROM orders WHERE order_id = p_OrderID) THEN
        SET error_message = 'La orden no existe.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    ELSE
        -- Eliminar la orden específica
        DELETE FROM orders WHERE order_id = p_OrderID;

        SELECT 'Orden cancelada correctamente.' AS result;
    END IF;
END


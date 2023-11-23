CREATE PROCEDURE GetOrderDetail(IN p_OrderID INT)
BEGIN
    SET @sql_query = 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?';

    -- Preparar la consulta
    PREPARE stmt FROM @sql_query;

    -- Ejecutar la consulta con el parámetro
    EXECUTE stmt USING p_OrderID;

    -- Liberar la consulta preparada
    DEALLOCATE PREPARE stmt;
END

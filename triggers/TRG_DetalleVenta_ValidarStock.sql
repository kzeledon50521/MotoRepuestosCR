USE MotoRepuestosCR;
GO

/*
Trigger: TRG_DetalleVenta_ValidarStock
Descripción:
Impide registrar una venta cuando la cantidad solicitada supera el stock disponible.
Evita inconsistencias en el inventario.
*/

CREATE TRIGGER TRG_DetalleVenta_ValidarStock
ON detalle_venta
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN productos p ON p.id_producto = i.id_producto
        WHERE p.stock < i.cantidad
    )
    BEGIN
        RAISERROR('Stock insuficiente para realizar la venta.',16,1);
        RETURN;
    END

    INSERT INTO detalle_venta(id_venta,id_producto,cantidad,subtotal)
    SELECT id_venta,id_producto,cantidad,subtotal
    FROM inserted;
END
GO
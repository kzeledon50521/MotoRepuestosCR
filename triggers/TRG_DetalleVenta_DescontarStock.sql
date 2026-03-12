USE MotoRepuestosCR;
GO

/*
Trigger: TRG_DetalleVenta_DescontarStock
Descripción:
Reduce automáticamente el stock del producto cuando se registra una venta.
Permite mantener actualizado el inventario.
*/

CREATE TRIGGER TRG_DetalleVenta_DescontarStock
ON detalle_venta
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET stock = stock - i.cantidad
    FROM productos p
    INNER JOIN inserted i ON p.id_producto = i.id_producto;
END
GO
USE MotoRepuestosCR;
GO

/*
Trigger: TRG_DetalleVenta_CalcularSubtotal
Descripción:
Calcula automáticamente el subtotal al registrar un detalle de venta.
Subtotal = cantidad * precio del producto.
*/

CREATE TRIGGER TRG_DetalleVenta_CalcularSubtotal
ON detalle_venta
AFTER INSERT
AS
BEGIN
    UPDATE dv
    SET subtotal = i.cantidad * p.precio
    FROM detalle_venta dv
    INNER JOIN inserted i ON dv.id_detalle = i.id_detalle
    INNER JOIN productos p ON p.id_producto = i.id_producto;
END
GO
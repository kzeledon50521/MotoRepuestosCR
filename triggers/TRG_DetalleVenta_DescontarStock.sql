USE MotoRepuestosCR;
GO

/* =========================================================
   Trigger: trg_detalleventa_descontar_stock
   Descripción:
   Descuenta automáticamente del inventario la cantidad vendida
   cuando se registra un detalle de venta.
   ========================================================= */
CREATE OR REPLACE TRIGGER trg_detalleventa_descontar_stock
AFTER INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
   UPDATE Productos
   SET stock = stock - :NEW.cantidad
   WHERE id_producto = :NEW.id_producto;
END;
/
USE MotoRepuestosCR;
GO

/* =========================================================
   Trigger: trg_detalleventa_asignar_precio
   Descripción:
   Asigna automáticamente al detalle de venta el precio actual
   del producto seleccionado al momento de registrar la venta.
   ========================================================= */
CREATE OR REPLACE TRIGGER trg_detalleventa_asignar_precio
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
   SELECT precio
   INTO :NEW.precio
   FROM Productos
   WHERE id_producto = :NEW.id_producto;
END;
/
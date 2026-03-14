USE MotoRepuestosCR;
GO

/* =========================================================
   Trigger: trg_detalleventa_validar_stock
   Descripción:
   Valida que exista stock suficiente antes de registrar
   un detalle de venta.
   ========================================================= */
CREATE OR REPLACE TRIGGER trg_detalleventa_validar_stock
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
DECLARE
   v_stock NUMBER;
BEGIN
   SELECT stock
   INTO v_stock
   FROM Productos
   WHERE id_producto = :NEW.id_producto;

   IF v_stock < :NEW.cantidad THEN
      RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente para realizar la venta.');
   END IF;
END;
/
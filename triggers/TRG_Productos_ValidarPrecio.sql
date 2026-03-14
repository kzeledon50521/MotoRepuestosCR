USE MotoRepuestosCR;
GO

/* =========================================================
   Trigger: trg_productos_validar_precio
   Descripción:
   Impide insertar o actualizar productos con precio menor
   o igual a cero.
   ========================================================= */
CREATE OR REPLACE TRIGGER trg_productos_validar_precio
BEFORE INSERT OR UPDATE ON Productos
FOR EACH ROW
BEGIN
   IF :NEW.precio <= 0 THEN
      RAISE_APPLICATION_ERROR(-20002, 'El precio debe ser mayor a 0.');
   END IF;
END;
/
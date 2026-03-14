USE MotoRepuestosCR;
GO

/* =========================================================
   Trigger: trg_productos_validar_stock
   Descripción:
   Impide insertar o actualizar productos con stock negativo.
   ========================================================= */
CREATE OR REPLACE TRIGGER trg_productos_validar_stock
BEFORE INSERT OR UPDATE ON Productos
FOR EACH ROW
BEGIN
   IF :NEW.stock < 0 THEN
      RAISE_APPLICATION_ERROR(-20003, 'El stock no puede ser negativo.');
   END IF;
END;
/
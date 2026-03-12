USE MotoRepuestosCR;
GO

/*
Trigger: TRG_Productos_ValidarPrecio
Descripción:
Evita que se inserten o actualicen productos con precio menor o igual a cero.
*/

CREATE TRIGGER TRG_Productos_ValidarPrecio
ON productos
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE precio <= 0)
    BEGIN
        RAISERROR('El precio debe ser mayor a 0.',16,1);
        ROLLBACK TRANSACTION;
    END
END
GO
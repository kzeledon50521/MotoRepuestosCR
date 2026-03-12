USE MotoRepuestosCR;
GO

/*
Trigger: TRG_Productos_ValidarStock
Descripción:
Impide registrar productos con stock negativo.
*/

CREATE TRIGGER TRG_Productos_ValidarStock
ON productos
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE stock < 0)
    BEGIN
        RAISERROR('El stock no puede ser negativo.',16,1);
        ROLLBACK TRANSACTION;
    END
END
GO
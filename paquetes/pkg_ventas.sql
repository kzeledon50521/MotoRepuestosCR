/* =========================================================
   Package: pkg_ventas
   Descripción:
   Permite registrar, actualizar y eliminar ventas.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_ventas AS
   PROCEDURE registrar_venta(p_cliente NUMBER,p_empleado NUMBER);
   PROCEDURE eliminar_venta(p_id NUMBER);
END pkg_ventas;
/

CREATE OR REPLACE PACKAGE BODY pkg_ventas AS

   PROCEDURE registrar_venta(p_cliente NUMBER,p_empleado NUMBER) IS
   BEGIN
      INSERT INTO Ventas(fecha,id_cliente,id_empleado)
      VALUES(SYSDATE,p_cliente,p_empleado);
   END;

   PROCEDURE eliminar_venta(p_id NUMBER) IS
   BEGIN
      DELETE FROM Ventas
      WHERE id_venta = p_id;
   END;

END pkg_ventas;
/
/*
Package: pkg_consultas_ventas
Descripción:
Permite obtener información general sobre las ventas realizadas,
como el monto total acumulado.
*/

CREATE OR REPLACE PACKAGE pkg_consultas_ventas AS
   FUNCTION total_ventas RETURN NUMBER;
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_consultas_ventas AS

   FUNCTION total_ventas RETURN NUMBER IS v_total NUMBER;
   BEGIN
      SELECT SUM(subtotal) INTO v_total FROM detalle_venta;
      RETURN v_total;
   END;

END;
/
/* =========================================================
   Package: pkg_consultas_ventas
   Descripción:
   Permite obtener información general de las ventas.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_consultas_ventas AS
   FUNCTION total_ventas RETURN NUMBER;
   FUNCTION total_venta_por_id(p_id_venta NUMBER) RETURN NUMBER;
END pkg_consultas_ventas;
/

CREATE OR REPLACE PACKAGE BODY pkg_consultas_ventas AS

   FUNCTION total_ventas RETURN NUMBER IS
      v_total NUMBER;
   BEGIN
      SELECT NVL(SUM(cantidad * precio),0)
      INTO v_total
      FROM DetalleVenta;
      RETURN v_total;
   END;

   FUNCTION total_venta_por_id(p_id_venta NUMBER) RETURN NUMBER IS
      v_total NUMBER;
   BEGIN
      SELECT NVL(SUM(cantidad * precio),0)
      INTO v_total
      FROM DetalleVenta
      WHERE id_venta = p_id_venta;
      RETURN v_total;
   END;

END pkg_consultas_ventas;
/
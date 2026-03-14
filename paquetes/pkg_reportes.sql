/* =========================================================
   Package: pkg_reportes
   Descripción:
   Genera reportes de ventas y totales.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_reportes AS
   FUNCTION ventas_cliente(p_cliente NUMBER) RETURN NUMBER;
   FUNCTION total_venta(p_venta NUMBER) RETURN NUMBER;
END pkg_reportes;
/

CREATE OR REPLACE PACKAGE BODY pkg_reportes AS

   FUNCTION ventas_cliente(p_cliente NUMBER) RETURN NUMBER IS
      v_total NUMBER;
   BEGIN
      SELECT COUNT(*)
      INTO v_total
      FROM Ventas
      WHERE id_cliente = p_cliente;
      RETURN v_total;
   END;

   FUNCTION total_venta(p_venta NUMBER) RETURN NUMBER IS
      v_total NUMBER;
   BEGIN
      SELECT NVL(SUM(cantidad*precio),0)
      INTO v_total
      FROM DetalleVenta
      WHERE id_venta = p_venta;
      RETURN v_total;
   END;

END pkg_reportes;
/
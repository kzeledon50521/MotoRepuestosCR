/* =========================================================
   Package: pkg_detalle_venta
   Descripción:
   Permite registrar, modificar y eliminar detalles de venta.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_detalle_venta AS
   PROCEDURE agregar_detalle(p_venta NUMBER, p_producto NUMBER, p_cantidad NUMBER, p_precio NUMBER);
   PROCEDURE actualizar_detalle(p_id_detalle NUMBER, p_cantidad NUMBER, p_precio NUMBER);
   PROCEDURE eliminar_detalle(p_id_detalle NUMBER);
END pkg_detalle_venta;
/

CREATE OR REPLACE PACKAGE BODY pkg_detalle_venta AS

   PROCEDURE agregar_detalle(p_venta NUMBER, p_producto NUMBER, p_cantidad NUMBER, p_precio NUMBER) IS
   BEGIN
      INSERT INTO DetalleVenta(id_venta,id_producto,cantidad,precio)
      VALUES(p_venta,p_producto,p_cantidad,p_precio);
   END;

   PROCEDURE actualizar_detalle(p_id_detalle NUMBER, p_cantidad NUMBER, p_precio NUMBER) IS
   BEGIN
      UPDATE DetalleVenta
      SET cantidad = p_cantidad,
          precio = p_precio
      WHERE id_detalle = p_id_detalle;
   END;

   PROCEDURE eliminar_detalle(p_id_detalle NUMBER) IS
   BEGIN
      DELETE FROM DetalleVenta
      WHERE id_detalle = p_id_detalle;
   END;

END pkg_detalle_venta;
/
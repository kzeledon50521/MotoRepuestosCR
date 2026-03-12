/*
Package: pkg_detalle_venta
Descripción:
Permite registrar los productos asociados a cada venta,
indicando cantidad y subtotal correspondiente.
*/

CREATE OR REPLACE PACKAGE pkg_detalle_venta AS
   PROCEDURE agregar_detalle(p_venta NUMBER, p_producto NUMBER, p_cantidad NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_detalle_venta AS

   PROCEDURE agregar_detalle(p_venta NUMBER, p_producto NUMBER, p_cantidad NUMBER) IS
   BEGIN
      INSERT INTO detalle_venta(id_venta, id_producto, cantidad, subtotal)
      VALUES(p_venta, p_producto, p_cantidad, 0);
   END;

END;
/
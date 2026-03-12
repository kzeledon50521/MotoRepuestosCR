/*
Package: pkg_inventario
Descripción:
Agrupa operaciones relacionadas con el control del inventario,
permitiendo aumentar la cantidad disponible de un producto.
*/

CREATE OR REPLACE PACKAGE pkg_inventario AS
   PROCEDURE aumentar_stock(p_producto NUMBER, p_cant NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_inventario AS

   PROCEDURE aumentar_stock(p_producto NUMBER, p_cant NUMBER) IS
   BEGIN
      UPDATE productos SET stock = stock + p_cant WHERE id_producto = p_producto;
   END;

END;
/
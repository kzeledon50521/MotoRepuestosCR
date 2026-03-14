/* =========================================================
   Package: pkg_inventario
   Descripción:
   Permite aumentar o disminuir el stock de productos.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_inventario AS
   PROCEDURE aumentar_stock(p_producto NUMBER, p_cant NUMBER);
   PROCEDURE disminuir_stock(p_producto NUMBER, p_cant NUMBER);
END pkg_inventario;
/

CREATE OR REPLACE PACKAGE BODY pkg_inventario AS

   PROCEDURE aumentar_stock(p_producto NUMBER, p_cant NUMBER) IS
   BEGIN
      UPDATE Productos
      SET stock = stock + p_cant
      WHERE id_producto = p_producto;
   END;

   PROCEDURE disminuir_stock(p_producto NUMBER, p_cant NUMBER) IS
   BEGIN
      UPDATE Productos
      SET stock = stock - p_cant
      WHERE id_producto = p_producto;
   END;

END pkg_inventario;
/
/* =========================================================
   Package: pkg_consultas_productos
   Descripción:
   Permite consultar información específica de los productos.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_consultas_productos AS
   FUNCTION obtener_precio(p_producto NUMBER) RETURN NUMBER;
   FUNCTION obtener_stock(p_producto NUMBER) RETURN NUMBER;
END pkg_consultas_productos;
/

CREATE OR REPLACE PACKAGE BODY pkg_consultas_productos AS

   FUNCTION obtener_precio(p_producto NUMBER) RETURN NUMBER IS
      v_precio NUMBER;
   BEGIN
      SELECT precio INTO v_precio
      FROM Productos
      WHERE id_producto = p_producto;
      RETURN v_precio;
   END;

   FUNCTION obtener_stock(p_producto NUMBER) RETURN NUMBER IS
      v_stock NUMBER;
   BEGIN
      SELECT stock INTO v_stock
      FROM Productos
      WHERE id_producto = p_producto;
      RETURN v_stock;
   END;

END pkg_consultas_productos;
/
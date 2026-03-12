/*
Package: pkg_consultas_productos
Descripción:
Facilita la consulta de información específica del catálogo,
como obtener el precio actual de un producto.
*/

CREATE OR REPLACE PACKAGE pkg_consultas_productos AS
   FUNCTION obtener_precio(p_producto NUMBER) RETURN NUMBER;
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_consultas_productos AS

   FUNCTION obtener_precio(p_producto NUMBER) RETURN NUMBER IS v_precio NUMBER;
   BEGIN
      SELECT precio INTO v_precio FROM productos WHERE id_producto = p_producto;
      RETURN v_precio;
   END;

END;
/
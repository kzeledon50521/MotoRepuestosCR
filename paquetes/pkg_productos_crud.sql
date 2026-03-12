/*
Package: pkg_productos_crud
Descripción:
Este paquete agrupa operaciones básicas relacionadas con el mantenimiento
del catálogo de productos, como registrar nuevos repuestos o modificar su precio.
*/

CREATE OR REPLACE PACKAGE pkg_productos_crud AS
   PROCEDURE insertar_producto(p_nombre VARCHAR2, p_desc VARCHAR2, p_cat VARCHAR2, p_precio NUMBER, p_stock NUMBER);
   PROCEDURE actualizar_precio(p_id NUMBER, p_precio NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_productos_crud AS

   PROCEDURE insertar_producto(p_nombre VARCHAR2, p_desc VARCHAR2, p_cat VARCHAR2, p_precio NUMBER, p_stock NUMBER) IS
   BEGIN
      INSERT INTO productos(nombre_producto, descripcion, categoria, precio, stock)
      VALUES(p_nombre, p_desc, p_cat, p_precio, p_stock);
   END;

   PROCEDURE actualizar_precio(p_id NUMBER, p_precio NUMBER) IS
   BEGIN
      UPDATE productos SET precio = p_precio WHERE id_producto = p_id;
   END;

END;
/
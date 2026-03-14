/* =========================================================
   Package: pkg_productos_crud
   Descripción:
   Permite insertar, actualizar y eliminar productos.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_productos_crud AS
   PROCEDURE insertar_producto(p_nombre VARCHAR2,p_precio NUMBER,p_stock NUMBER,p_id_categoria NUMBER,p_id_marca NUMBER,p_id_proveedor NUMBER);
   PROCEDURE actualizar_producto(p_id NUMBER,p_nombre VARCHAR2,p_precio NUMBER,p_stock NUMBER,p_id_categoria NUMBER,p_id_marca NUMBER,p_id_proveedor NUMBER);
   PROCEDURE eliminar_producto(p_id NUMBER);
END pkg_productos_crud;
/

CREATE OR REPLACE PACKAGE BODY pkg_productos_crud AS

   PROCEDURE insertar_producto(p_nombre VARCHAR2,p_precio NUMBER,p_stock NUMBER,p_id_categoria NUMBER,p_id_marca NUMBER,p_id_proveedor NUMBER) IS
   BEGIN
      INSERT INTO Productos(nombre,precio,stock,id_categoria,id_marca,id_proveedor)
      VALUES(p_nombre,p_precio,p_stock,p_id_categoria,p_id_marca,p_id_proveedor);
   END;

   PROCEDURE actualizar_producto(p_id NUMBER,p_nombre VARCHAR2,p_precio NUMBER,p_stock NUMBER,p_id_categoria NUMBER,p_id_marca NUMBER,p_id_proveedor NUMBER) IS
   BEGIN
      UPDATE Productos
      SET nombre = p_nombre,
          precio = p_precio,
          stock = p_stock,
          id_categoria = p_id_categoria,
          id_marca = p_id_marca,
          id_proveedor = p_id_proveedor
      WHERE id_producto = p_id;
   END;

   PROCEDURE eliminar_producto(p_id NUMBER) IS
   BEGIN
      DELETE FROM Productos
      WHERE id_producto = p_id;
   END;

END pkg_productos_crud;
/
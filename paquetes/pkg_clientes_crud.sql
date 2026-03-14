/* =========================================================
   Package: pkg_clientes_crud
   Descripción:
   Permite insertar, actualizar y eliminar clientes del sistema.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_clientes_crud AS
   PROCEDURE insertar_cliente(p_nombre VARCHAR2, p_tel VARCHAR2, p_correo VARCHAR2);
   PROCEDURE actualizar_cliente(p_id NUMBER, p_nombre VARCHAR2, p_tel VARCHAR2, p_correo VARCHAR2);
   PROCEDURE eliminar_cliente(p_id NUMBER);
END pkg_clientes_crud;
/

CREATE OR REPLACE PACKAGE BODY pkg_clientes_crud AS

   PROCEDURE insertar_cliente(p_nombre VARCHAR2, p_tel VARCHAR2, p_correo VARCHAR2) IS
   BEGIN
      INSERT INTO Clientes(nombre, telefono, correo)
      VALUES (p_nombre, p_tel, p_correo);
   END;

   PROCEDURE actualizar_cliente(p_id NUMBER, p_nombre VARCHAR2, p_tel VARCHAR2, p_correo VARCHAR2) IS
   BEGIN
      UPDATE Clientes
      SET nombre = p_nombre,
          telefono = p_tel,
          correo = p_correo
      WHERE id_cliente = p_id;
   END;

   PROCEDURE eliminar_cliente(p_id NUMBER) IS
   BEGIN
      DELETE FROM Clientes
      WHERE id_cliente = p_id;
   END;

END pkg_clientes_crud;
/
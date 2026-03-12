/*
Package: pkg_clientes_crud
Descripción:
Permite gestionar la información de los clientes registrados en el sistema,
facilitando el almacenamiento de datos necesarios para futuras ventas.
*/

CREATE OR REPLACE PACKAGE pkg_clientes_crud AS
   PROCEDURE insertar_cliente(p_nombre VARCHAR2, p_tel VARCHAR2, p_correo VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_clientes_crud AS

   PROCEDURE insertar_cliente(p_nombre VARCHAR2, p_tel VARCHAR2, p_correo VARCHAR2) IS
   BEGIN
      INSERT INTO clientes(nombre, telefono, correo)
      VALUES(p_nombre, p_tel, p_correo);
   END;

END;
/
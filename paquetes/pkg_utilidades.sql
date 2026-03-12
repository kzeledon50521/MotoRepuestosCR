/*
Package: pkg_utilidades
Descripción:
Contiene funciones auxiliares generales que pueden ser utilizadas
en diferentes procesos del sistema.
*/

CREATE OR REPLACE PACKAGE pkg_utilidades AS
   FUNCTION obtener_fecha RETURN DATE;
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_utilidades AS

   FUNCTION obtener_fecha RETURN DATE IS
   BEGIN
      RETURN SYSDATE;
   END;

END;
/
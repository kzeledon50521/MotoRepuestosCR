/* =========================================================
   Package: pkg_utilidades
   Descripción:
   Funciones generales del sistema.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_utilidades AS
   FUNCTION obtener_fecha RETURN DATE;
END pkg_utilidades;
/

CREATE OR REPLACE PACKAGE BODY pkg_utilidades AS

   FUNCTION obtener_fecha RETURN DATE IS
   BEGIN
      RETURN SYSDATE;
   END;

END pkg_utilidades;
/
/*
Package: pkg_reportes
Descripción:
Permite generar consultas simples para análisis,
como la cantidad de ventas realizadas por un cliente.
*/

CREATE OR REPLACE PACKAGE pkg_reportes AS
   FUNCTION ventas_cliente(p_cliente NUMBER) RETURN NUMBER;
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_reportes AS

   FUNCTION ventas_cliente(p_cliente NUMBER) RETURN NUMBER IS v_total NUMBER;
   BEGIN
      SELECT COUNT(*) INTO v_total FROM ventas WHERE id_cliente = p_cliente;
      RETURN v_total;
   END;

END;
/
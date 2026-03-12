/*
Package: pkg_ventas
Descripción:
Contiene la lógica necesaria para registrar las ventas realizadas,
permitiendo llevar un control cronológico de las transacciones.
*/

CREATE OR REPLACE PACKAGE pkg_ventas AS
   PROCEDURE registrar_venta(p_cliente NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_ventas AS

   PROCEDURE registrar_venta(p_cliente NUMBER) IS
   BEGIN
      INSERT INTO ventas(fecha, id_cliente)
      VALUES(SYSDATE, p_cliente);
   END;

END;
/
/*
Package: pkg_validaciones
Descripción:
Incluye funciones que ayudan a validar condiciones del negocio,
como verificar si existe stock suficiente antes de una venta.
*/

CREATE OR REPLACE PACKAGE pkg_validaciones AS
   FUNCTION validar_stock(p_producto NUMBER, p_cantidad NUMBER) RETURN NUMBER;
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_validaciones AS

   FUNCTION validar_stock(p_producto NUMBER, p_cantidad NUMBER) RETURN NUMBER IS v_stock NUMBER;
   BEGIN
      SELECT stock INTO v_stock FROM productos WHERE id_producto = p_producto;
      IF v_stock >= p_cantidad THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

END;
/
/* =========================================================
   Package: pkg_validaciones
   Descripción:
   Funciones de validación del sistema.
   ========================================================= */
CREATE OR REPLACE PACKAGE pkg_validaciones AS
   FUNCTION validar_stock(p_producto NUMBER,p_cantidad NUMBER) RETURN NUMBER;
END pkg_validaciones;
/

CREATE OR REPLACE PACKAGE BODY pkg_validaciones AS

   FUNCTION validar_stock(p_producto NUMBER,p_cantidad NUMBER) RETURN NUMBER IS
      v_stock NUMBER;
   BEGIN
      SELECT stock INTO v_stock
      FROM Productos
      WHERE id_producto = p_producto;

      IF v_stock >= p_cantidad THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

END pkg_validaciones;
/
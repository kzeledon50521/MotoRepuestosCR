/* =========================================================
   FUNCIONES - MotoRepuestos CR
   Modelo actualizado según tablas reales
   ========================================================= */


/* =========================================================
   1) Retorna el stock de un producto
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_stock_producto (
    p_id_producto IN NUMBER
) RETURN NUMBER
AS
    v_stock NUMBER;
BEGIN
    SELECT stock
    INTO v_stock
    FROM Productos
    WHERE id_producto = p_id_producto;

    RETURN v_stock;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/

/* =========================================================
   2) Retorna el precio de un producto
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_precio_producto (
    p_id_producto IN NUMBER
) RETURN NUMBER
AS
    v_precio NUMBER;
BEGIN
    SELECT precio
    INTO v_precio
    FROM Productos
    WHERE id_producto = p_id_producto;

    RETURN v_precio;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/

/* =========================================================
   3) Retorna el nombre de un cliente
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_nombre_cliente (
    p_id_cliente IN NUMBER
) RETURN VARCHAR2
AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre
    INTO v_nombre
    FROM Clientes
    WHERE id_cliente = p_id_cliente;

    RETURN v_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO EXISTE';
END;
/

/* =========================================================
   4) Retorna el nombre de un producto
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_nombre_producto (
    p_id_producto IN NUMBER
) RETURN VARCHAR2
AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre
    INTO v_nombre
    FROM Productos
    WHERE id_producto = p_id_producto;

    RETURN v_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO EXISTE';
END;
/

/* =========================================================
   5) Retorna el nombre de una categoría
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_nombre_categoria (
    p_id_categoria IN NUMBER
) RETURN VARCHAR2
AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre
    INTO v_nombre
    FROM Categorias
    WHERE id_categoria = p_id_categoria;

    RETURN v_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO EXISTE';
END;
/

/* =========================================================
   6) Retorna el nombre de una marca
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_nombre_marca (
    p_id_marca IN NUMBER
) RETURN VARCHAR2
AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre
    INTO v_nombre
    FROM Marcas
    WHERE id_marca = p_id_marca;

    RETURN v_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO EXISTE';
END;
/

/* =========================================================
   7) Retorna el nombre de un proveedor
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_nombre_proveedor (
    p_id_proveedor IN NUMBER
) RETURN VARCHAR2
AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre
    INTO v_nombre
    FROM Proveedores
    WHERE id_proveedor = p_id_proveedor;

    RETURN v_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO EXISTE';
END;
/

/* =========================================================
   8) Retorna el nombre de un empleado
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_nombre_empleado (
    p_id_empleado IN NUMBER
) RETURN VARCHAR2
AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre
    INTO v_nombre
    FROM Empleados
    WHERE id_empleado = p_id_empleado;

    RETURN v_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO EXISTE';
END;
/

/* =========================================================
   9) Retorna la cantidad total de clientes
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_total_clientes
RETURN NUMBER
AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM Clientes;

    RETURN v_total;
END;
/

/* =========================================================
   10) Retorna la cantidad total de productos
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_total_productos
RETURN NUMBER
AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM Productos;

    RETURN v_total;
END;
/

/* =========================================================
   11) Retorna la cantidad total de ventas
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_total_ventas
RETURN NUMBER
AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM Ventas;

    RETURN v_total;
END;
/

/* =========================================================
   12) Retorna la cantidad total de empleados
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_total_empleados
RETURN NUMBER
AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM Empleados;

    RETURN v_total;
END;
/

/* =========================================================
   13) Retorna el total monetario de una venta
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_total_monto_venta (
    p_id_venta IN NUMBER
) RETURN NUMBER
AS
    v_total NUMBER;
BEGIN
    SELECT NVL(SUM(cantidad * precio), 0)
    INTO v_total
    FROM DetalleVenta
    WHERE id_venta = p_id_venta;

    RETURN v_total;
END;
/

/* =========================================================
   14) Verifica si existe un cliente
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_existe_cliente (
    p_id_cliente IN NUMBER
) RETURN NUMBER
AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM Clientes
    WHERE id_cliente = p_id_cliente;

    IF v_total > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
/

/* =========================================================
   15) Verifica si existe un producto
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_existe_producto (
    p_id_producto IN NUMBER
) RETURN NUMBER
AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM Productos
    WHERE id_producto = p_id_producto;

    IF v_total > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
/--

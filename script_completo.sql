/* =========================================================
   SCRIPT COMPLETO - MotoRepuestos CR S.A.
   Motor: Oracle
   Descripción:
   Script consolidado para creación de tablas, secuencias,
   procedimientos, funciones, cursores, paquetes, triggers y vistas.
   ========================================================= */

SET SERVEROUTPUT ON;

/* =========================================================
   1. ELIMINACIÓN DE OBJETOS (opcional, para re-ejecutar)
   ========================================================= */
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_top5_productos_ingresos'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_resumen_ventas_diarias'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_clientes_sin_compras'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_historial_ventas_producto'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_productos_por_categoria'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_clientes_frecuentes'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_ventas_mes_actual'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_productos_mas_vendidos'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_resumen_ventas_cliente'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_productos_bajo_stock'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

BEGIN EXECUTE IMMEDIATE 'DROP TRIGGER trg_productos_validar_stock'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TRIGGER trg_productos_validar_precio'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TRIGGER trg_detalleventa_descontar_stock'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TRIGGER trg_detalleventa_validar_stock'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TRIGGER trg_detalleventa_asignar_precio'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_ventas'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_validaciones'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_utilidades'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_reportes'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_productos_crud'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_inventario'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_detalle_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_consultas_ventas'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_consultas_productos'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PACKAGE pkg_clientes_crud'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_ventas_por_empleado'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_ventas_por_cliente'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_productos_por_proveedor'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_productos_por_marca'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_productos_por_categoria'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_eliminar_detalle_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_actualizar_detalle_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_buscar_detalle_id'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_detalle_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_insertar_detalle_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_eliminar_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_actualizar_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_buscar_venta_id'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_ventas'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_insertar_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_eliminar_producto'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_actualizar_producto'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_buscar_producto_id'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_productos'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_insertar_producto'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_eliminar_cliente'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_actualizar_cliente'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_buscar_cliente_id'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_listar_clientes'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE sp_insertar_cliente'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_existe_producto'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_existe_cliente'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_total_monto_venta'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_total_empleados'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_total_ventas'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_total_productos'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_total_clientes'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_nombre_empleado'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_nombre_proveedor'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_nombre_marca'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_nombre_categoria'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_nombre_producto'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_nombre_cliente'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_precio_producto'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP FUNCTION fn_stock_producto'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_detalleventa'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_ventas'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_empleados'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_clientes'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_productos'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_proveedores'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_marcas'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_categorias'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

BEGIN EXECUTE IMMEDIATE 'DROP TABLE DetalleVenta CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Ventas CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Empleados CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Clientes CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Productos CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Proveedores CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Marcas CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Categorias CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

/* =========================================================
   2. TABLAS
   ========================================================= */
CREATE TABLE Categorias (
    id_categoria NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE Marcas (
    id_marca NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE Proveedores (
    id_proveedor NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    telefono VARCHAR2(20),
    correo VARCHAR2(100)
);

CREATE TABLE Productos (
    id_producto NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    precio NUMBER(10,2),
    stock NUMBER,
    id_categoria NUMBER,
    id_marca NUMBER,
    id_proveedor NUMBER,
    CONSTRAINT fk_productos_categoria FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    CONSTRAINT fk_productos_marca FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca),
    CONSTRAINT fk_productos_proveedor FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Clientes (
    id_cliente NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    telefono VARCHAR2(20),
    correo VARCHAR2(100)
);

CREATE TABLE Empleados (
    id_empleado NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    puesto VARCHAR2(100)
);

CREATE TABLE Ventas (
    id_venta NUMBER PRIMARY KEY,
    fecha DATE,
    id_cliente NUMBER,
    id_empleado NUMBER,
    CONSTRAINT fk_ventas_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT fk_ventas_empleado FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE DetalleVenta (
    id_detalle NUMBER PRIMARY KEY,
    id_venta NUMBER,
    id_producto NUMBER,
    cantidad NUMBER,
    precio NUMBER(10,2),
    CONSTRAINT fk_detalle_venta FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

/* =========================================================
   3. SECUENCIAS
   ========================================================= */
CREATE SEQUENCE seq_categorias START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_marcas START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_proveedores START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_productos START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_empleados START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_ventas START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_detalleventa START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

/* =========================================================
   4. DATOS BÁSICOS DE APOYO
   ========================================================= */
INSERT INTO Categorias VALUES (seq_categorias.NEXTVAL, 'Frenos');
INSERT INTO Categorias VALUES (seq_categorias.NEXTVAL, 'Motor');
INSERT INTO Categorias VALUES (seq_categorias.NEXTVAL, 'Suspensión');

INSERT INTO Marcas VALUES (seq_marcas.NEXTVAL, 'Yamaha');
INSERT INTO Marcas VALUES (seq_marcas.NEXTVAL, 'Honda');
INSERT INTO Marcas VALUES (seq_marcas.NEXTVAL, 'Suzuki');

INSERT INTO Proveedores VALUES (seq_proveedores.NEXTVAL, 'Proveedor Central', '2222-1111', 'proveedor1@correo.com');
INSERT INTO Proveedores VALUES (seq_proveedores.NEXTVAL, 'Moto Parts CR', '2222-2222', 'proveedor2@correo.com');

INSERT INTO Empleados VALUES (seq_empleados.NEXTVAL, 'Carlos Mora', 'Vendedor');
INSERT INTO Empleados VALUES (seq_empleados.NEXTVAL, 'Ana Pérez', 'Cajera');

COMMIT;

/* =========================================================
   5. PROCEDIMIENTOS ALMACENADOS (25)
   ========================================================= */
CREATE OR REPLACE PROCEDURE sp_insertar_cliente (
    p_nombre    IN VARCHAR2,
    p_telefono  IN VARCHAR2,
    p_correo    IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Clientes (id_cliente, nombre, telefono, correo)
    VALUES (seq_clientes.NEXTVAL, p_nombre, p_telefono, p_correo);
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_clientes (
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_cliente, nombre, telefono, correo
        FROM Clientes;
END;
/

CREATE OR REPLACE PROCEDURE sp_buscar_cliente_id (
    p_id_cliente IN NUMBER,
    p_resultado  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_cliente, nombre, telefono, correo
        FROM Clientes
        WHERE id_cliente = p_id_cliente;
END;
/

CREATE OR REPLACE PROCEDURE sp_actualizar_cliente (
    p_id_cliente IN NUMBER,
    p_nombre     IN VARCHAR2,
    p_telefono   IN VARCHAR2,
    p_correo     IN VARCHAR2
)
AS
BEGIN
    UPDATE Clientes
    SET nombre = p_nombre,
        telefono = p_telefono,
        correo = p_correo
    WHERE id_cliente = p_id_cliente;
END;
/

CREATE OR REPLACE PROCEDURE sp_eliminar_cliente (
    p_id_cliente IN NUMBER
)
AS
BEGIN
    DELETE FROM Clientes
    WHERE id_cliente = p_id_cliente;
END;
/

CREATE OR REPLACE PROCEDURE sp_insertar_producto (
    p_nombre        IN VARCHAR2,
    p_precio        IN NUMBER,
    p_stock         IN NUMBER,
    p_id_categoria  IN NUMBER,
    p_id_marca      IN NUMBER,
    p_id_proveedor  IN NUMBER
)
AS
BEGIN
    INSERT INTO Productos (id_producto, nombre, precio, stock, id_categoria, id_marca, id_proveedor)
    VALUES (seq_productos.NEXTVAL, p_nombre, p_precio, p_stock, p_id_categoria, p_id_marca, p_id_proveedor);
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_productos (
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre, precio, stock, id_categoria, id_marca, id_proveedor
        FROM Productos;
END;
/

CREATE OR REPLACE PROCEDURE sp_buscar_producto_id (
    p_id_producto IN NUMBER,
    p_resultado   OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre, precio, stock, id_categoria, id_marca, id_proveedor
        FROM Productos
        WHERE id_producto = p_id_producto;
END;
/

CREATE OR REPLACE PROCEDURE sp_actualizar_producto (
    p_id_producto   IN NUMBER,
    p_nombre        IN VARCHAR2,
    p_precio        IN NUMBER,
    p_stock         IN NUMBER,
    p_id_categoria  IN NUMBER,
    p_id_marca      IN NUMBER,
    p_id_proveedor  IN NUMBER
)
AS
BEGIN
    UPDATE Productos
    SET nombre = p_nombre,
        precio = p_precio,
        stock = p_stock,
        id_categoria = p_id_categoria,
        id_marca = p_id_marca,
        id_proveedor = p_id_proveedor
    WHERE id_producto = p_id_producto;
END;
/

CREATE OR REPLACE PROCEDURE sp_eliminar_producto (
    p_id_producto IN NUMBER
)
AS
BEGIN
    DELETE FROM Productos
    WHERE id_producto = p_id_producto;
END;
/

CREATE OR REPLACE PROCEDURE sp_insertar_venta (
    p_fecha       IN DATE,
    p_id_cliente  IN NUMBER,
    p_id_empleado IN NUMBER
)
AS
BEGIN
    INSERT INTO Ventas (id_venta, fecha, id_cliente, id_empleado)
    VALUES (seq_ventas.NEXTVAL, p_fecha, p_id_cliente, p_id_empleado);
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_ventas (
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_venta, fecha, id_cliente, id_empleado
        FROM Ventas;
END;
/

CREATE OR REPLACE PROCEDURE sp_buscar_venta_id (
    p_id_venta  IN NUMBER,
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_venta, fecha, id_cliente, id_empleado
        FROM Ventas
        WHERE id_venta = p_id_venta;
END;
/

CREATE OR REPLACE PROCEDURE sp_actualizar_venta (
    p_id_venta    IN NUMBER,
    p_fecha       IN DATE,
    p_id_cliente  IN NUMBER,
    p_id_empleado IN NUMBER
)
AS
BEGIN
    UPDATE Ventas
    SET fecha = p_fecha,
        id_cliente = p_id_cliente,
        id_empleado = p_id_empleado
    WHERE id_venta = p_id_venta;
END;
/

CREATE OR REPLACE PROCEDURE sp_eliminar_venta (
    p_id_venta IN NUMBER
)
AS
BEGIN
    DELETE FROM Ventas
    WHERE id_venta = p_id_venta;
END;
/

CREATE OR REPLACE PROCEDURE sp_insertar_detalle_venta (
    p_id_venta    IN NUMBER,
    p_id_producto IN NUMBER,
    p_cantidad    IN NUMBER,
    p_precio      IN NUMBER
)
AS
BEGIN
    INSERT INTO DetalleVenta (id_detalle, id_venta, id_producto, cantidad, precio)
    VALUES (seq_detalleventa.NEXTVAL, p_id_venta, p_id_producto, p_cantidad, p_precio);
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_detalle_venta (
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_detalle, id_venta, id_producto, cantidad, precio
        FROM DetalleVenta;
END;
/

CREATE OR REPLACE PROCEDURE sp_buscar_detalle_id (
    p_id_detalle IN NUMBER,
    p_resultado  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_detalle, id_venta, id_producto, cantidad, precio
        FROM DetalleVenta
        WHERE id_detalle = p_id_detalle;
END;
/

CREATE OR REPLACE PROCEDURE sp_actualizar_detalle_venta (
    p_id_detalle  IN NUMBER,
    p_id_venta    IN NUMBER,
    p_id_producto IN NUMBER,
    p_cantidad    IN NUMBER,
    p_precio      IN NUMBER
)
AS
BEGIN
    UPDATE DetalleVenta
    SET id_venta = p_id_venta,
        id_producto = p_id_producto,
        cantidad = p_cantidad,
        precio = p_precio
    WHERE id_detalle = p_id_detalle;
END;
/

CREATE OR REPLACE PROCEDURE sp_eliminar_detalle_venta (
    p_id_detalle IN NUMBER
)
AS
BEGIN
    DELETE FROM DetalleVenta
    WHERE id_detalle = p_id_detalle;
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_productos_por_categoria (
    p_id_categoria IN NUMBER,
    p_resultado    OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre, precio, stock, id_categoria, id_marca, id_proveedor
        FROM Productos
        WHERE id_categoria = p_id_categoria;
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_productos_por_marca (
    p_id_marca  IN NUMBER,
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre, precio, stock, id_categoria, id_marca, id_proveedor
        FROM Productos
        WHERE id_marca = p_id_marca;
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_productos_por_proveedor (
    p_id_proveedor IN NUMBER,
    p_resultado    OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre, precio, stock, id_categoria, id_marca, id_proveedor
        FROM Productos
        WHERE id_proveedor = p_id_proveedor;
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_ventas_por_cliente (
    p_id_cliente IN NUMBER,
    p_resultado  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_venta, fecha, id_cliente, id_empleado
        FROM Ventas
        WHERE id_cliente = p_id_cliente;
END;
/

CREATE OR REPLACE PROCEDURE sp_listar_ventas_por_empleado (
    p_id_empleado IN NUMBER,
    p_resultado   OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_venta, fecha, id_cliente, id_empleado
        FROM Ventas
        WHERE id_empleado = p_id_empleado;
END;
/

/* =========================================================
   6. FUNCIONES (15)
   ========================================================= */
CREATE OR REPLACE FUNCTION fn_stock_producto (p_id_producto IN NUMBER) RETURN NUMBER AS
    v_stock NUMBER;
BEGIN
    SELECT stock INTO v_stock FROM Productos WHERE id_producto = p_id_producto;
    RETURN v_stock;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 0;
END;
/

CREATE OR REPLACE FUNCTION fn_precio_producto (p_id_producto IN NUMBER) RETURN NUMBER AS
    v_precio NUMBER;
BEGIN
    SELECT precio INTO v_precio FROM Productos WHERE id_producto = p_id_producto;
    RETURN v_precio;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 0;
END;
/

CREATE OR REPLACE FUNCTION fn_nombre_cliente (p_id_cliente IN NUMBER) RETURN VARCHAR2 AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre INTO v_nombre FROM Clientes WHERE id_cliente = p_id_cliente;
    RETURN v_nombre;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 'NO EXISTE';
END;
/

CREATE OR REPLACE FUNCTION fn_nombre_producto (p_id_producto IN NUMBER) RETURN VARCHAR2 AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre INTO v_nombre FROM Productos WHERE id_producto = p_id_producto;
    RETURN v_nombre;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 'NO EXISTE';
END;
/

CREATE OR REPLACE FUNCTION fn_nombre_categoria (p_id_categoria IN NUMBER) RETURN VARCHAR2 AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre INTO v_nombre FROM Categorias WHERE id_categoria = p_id_categoria;
    RETURN v_nombre;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 'NO EXISTE';
END;
/

CREATE OR REPLACE FUNCTION fn_nombre_marca (p_id_marca IN NUMBER) RETURN VARCHAR2 AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre INTO v_nombre FROM Marcas WHERE id_marca = p_id_marca;
    RETURN v_nombre;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 'NO EXISTE';
END;
/

CREATE OR REPLACE FUNCTION fn_nombre_proveedor (p_id_proveedor IN NUMBER) RETURN VARCHAR2 AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre INTO v_nombre FROM Proveedores WHERE id_proveedor = p_id_proveedor;
    RETURN v_nombre;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 'NO EXISTE';
END;
/

CREATE OR REPLACE FUNCTION fn_nombre_empleado (p_id_empleado IN NUMBER) RETURN VARCHAR2 AS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT nombre INTO v_nombre FROM Empleados WHERE id_empleado = p_id_empleado;
    RETURN v_nombre;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 'NO EXISTE';
END;
/

CREATE OR REPLACE FUNCTION fn_total_clientes RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM Clientes;
    RETURN v_total;
END;
/

CREATE OR REPLACE FUNCTION fn_total_productos RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM Productos;
    RETURN v_total;
END;
/

CREATE OR REPLACE FUNCTION fn_total_ventas RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM Ventas;
    RETURN v_total;
END;
/

CREATE OR REPLACE FUNCTION fn_total_empleados RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM Empleados;
    RETURN v_total;
END;
/

CREATE OR REPLACE FUNCTION fn_total_monto_venta (p_id_venta IN NUMBER) RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT NVL(SUM(cantidad * precio), 0) INTO v_total
    FROM DetalleVenta WHERE id_venta = p_id_venta;
    RETURN v_total;
END;
/

CREATE OR REPLACE FUNCTION fn_existe_cliente (p_id_cliente IN NUMBER) RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM Clientes WHERE id_cliente = p_id_cliente;
    IF v_total > 0 THEN RETURN 1; ELSE RETURN 0; END IF;
END;
/

CREATE OR REPLACE FUNCTION fn_existe_producto (p_id_producto IN NUMBER) RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM Productos WHERE id_producto = p_id_producto;
    IF v_total > 0 THEN RETURN 1; ELSE RETURN 0; END IF;
END;
/

/* =========================================================
   7. CURSORES (15) - bloques demostrativos
   ========================================================= */
DECLARE
    CURSOR cur_clientes IS SELECT id_cliente, nombre, telefono, correo FROM Clientes;
BEGIN
    FOR r IN cur_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || r.id_cliente || ' - ' || r.nombre);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_productos IS SELECT id_producto, nombre, precio, stock FROM Productos;
BEGIN
    FOR r IN cur_productos LOOP
        DBMS_OUTPUT.PUT_LINE('Producto: ' || r.id_producto || ' - ' || r.nombre);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_categorias IS SELECT id_categoria, nombre FROM Categorias;
BEGIN
    FOR r IN cur_categorias LOOP
        DBMS_OUTPUT.PUT_LINE('Categoría: ' || r.id_categoria || ' - ' || r.nombre);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_marcas IS SELECT id_marca, nombre FROM Marcas;
BEGIN
    FOR r IN cur_marcas LOOP
        DBMS_OUTPUT.PUT_LINE('Marca: ' || r.id_marca || ' - ' || r.nombre);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_proveedores IS SELECT id_proveedor, nombre, telefono, correo FROM Proveedores;
BEGIN
    FOR r IN cur_proveedores LOOP
        DBMS_OUTPUT.PUT_LINE('Proveedor: ' || r.id_proveedor || ' - ' || r.nombre);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_empleados IS SELECT id_empleado, nombre, puesto FROM Empleados;
BEGIN
    FOR r IN cur_empleados LOOP
        DBMS_OUTPUT.PUT_LINE('Empleado: ' || r.id_empleado || ' - ' || r.nombre);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_ventas IS SELECT id_venta, fecha, id_cliente, id_empleado FROM Ventas;
BEGIN
    FOR r IN cur_ventas LOOP
        DBMS_OUTPUT.PUT_LINE('Venta: ' || r.id_venta || ' - Cliente: ' || r.id_cliente);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_detalle_venta IS SELECT id_detalle, id_venta, id_producto, cantidad, precio FROM DetalleVenta;
BEGIN
    FOR r IN cur_detalle_venta LOOP
        DBMS_OUTPUT.PUT_LINE('Detalle: ' || r.id_detalle || ' - Venta: ' || r.id_venta);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_productos_stock_bajo IS SELECT id_producto, nombre, stock FROM Productos WHERE stock <= 5;
BEGIN
    FOR r IN cur_productos_stock_bajo LOOP
        DBMS_OUTPUT.PUT_LINE('Stock bajo: ' || r.nombre || ' - Stock: ' || r.stock);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_productos_por_categoria IS
        SELECT p.id_producto, p.nombre, c.nombre AS categoria
        FROM Productos p JOIN Categorias c ON p.id_categoria = c.id_categoria;
BEGIN
    FOR r IN cur_productos_por_categoria LOOP
        DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ' - Categoría: ' || r.categoria);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_productos_por_marca IS
        SELECT p.id_producto, p.nombre, m.nombre AS marca
        FROM Productos p JOIN Marcas m ON p.id_marca = m.id_marca;
BEGIN
    FOR r IN cur_productos_por_marca LOOP
        DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ' - Marca: ' || r.marca);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_productos_por_proveedor IS
        SELECT p.id_producto, p.nombre, pr.nombre AS proveedor
        FROM Productos p JOIN Proveedores pr ON p.id_proveedor = pr.id_proveedor;
BEGIN
    FOR r IN cur_productos_por_proveedor LOOP
        DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ' - Proveedor: ' || r.proveedor);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_ventas_por_cliente IS
        SELECT v.id_venta, v.fecha, c.nombre AS cliente
        FROM Ventas v JOIN Clientes c ON v.id_cliente = c.id_cliente;
BEGIN
    FOR r IN cur_ventas_por_cliente LOOP
        DBMS_OUTPUT.PUT_LINE('Venta: ' || r.id_venta || ' - Cliente: ' || r.cliente);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_ventas_por_empleado IS
        SELECT v.id_venta, v.fecha, e.nombre AS empleado
        FROM Ventas v JOIN Empleados e ON v.id_empleado = e.id_empleado;
BEGIN
    FOR r IN cur_ventas_por_empleado LOOP
        DBMS_OUTPUT.PUT_LINE('Venta: ' || r.id_venta || ' - Empleado: ' || r.empleado);
    END LOOP;
END;
/

DECLARE
    CURSOR cur_total_por_venta IS
        SELECT id_venta, SUM(cantidad * precio) AS total
        FROM DetalleVenta
        GROUP BY id_venta;
BEGIN
    FOR r IN cur_total_por_venta LOOP
        DBMS_OUTPUT.PUT_LINE('Venta: ' || r.id_venta || ' - Total: ' || r.total);
    END LOOP;
END;
/

/* =========================================================
   8. PACKAGES (10)
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
      INSERT INTO Clientes(id_cliente, nombre, telefono, correo)
      VALUES (seq_clientes.NEXTVAL, p_nombre, p_tel, p_correo);
   END;
   PROCEDURE actualizar_cliente(p_id NUMBER, p_nombre VARCHAR2, p_tel VARCHAR2, p_correo VARCHAR2) IS
   BEGIN
      UPDATE Clientes
      SET nombre = p_nombre, telefono = p_tel, correo = p_correo
      WHERE id_cliente = p_id;
   END;
   PROCEDURE eliminar_cliente(p_id NUMBER) IS
   BEGIN
      DELETE FROM Clientes WHERE id_cliente = p_id;
   END;
END pkg_clientes_crud;
/

CREATE OR REPLACE PACKAGE pkg_consultas_productos AS
   FUNCTION obtener_precio(p_producto NUMBER) RETURN NUMBER;
   FUNCTION obtener_stock(p_producto NUMBER) RETURN NUMBER;
END pkg_consultas_productos;
/

CREATE OR REPLACE PACKAGE BODY pkg_consultas_productos AS
   FUNCTION obtener_precio(p_producto NUMBER) RETURN NUMBER IS v_precio NUMBER;
   BEGIN
      SELECT precio INTO v_precio FROM Productos WHERE id_producto = p_producto;
      RETURN v_precio;
   EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 0; END;
   FUNCTION obtener_stock(p_producto NUMBER) RETURN NUMBER IS v_stock NUMBER;
   BEGIN
      SELECT stock INTO v_stock FROM Productos WHERE id_producto = p_producto;
      RETURN v_stock;
   EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 0; END;
END pkg_consultas_productos;
/

CREATE OR REPLACE PACKAGE pkg_consultas_ventas AS
   FUNCTION total_ventas RETURN NUMBER;
   FUNCTION total_venta_por_id(p_id_venta NUMBER) RETURN NUMBER;
END pkg_consultas_ventas;
/

CREATE OR REPLACE PACKAGE BODY pkg_consultas_ventas AS
   FUNCTION total_ventas RETURN NUMBER IS v_total NUMBER;
   BEGIN
      SELECT NVL(SUM(cantidad * precio),0) INTO v_total FROM DetalleVenta;
      RETURN v_total;
   END;
   FUNCTION total_venta_por_id(p_id_venta NUMBER) RETURN NUMBER IS v_total NUMBER;
   BEGIN
      SELECT NVL(SUM(cantidad * precio),0) INTO v_total FROM DetalleVenta WHERE id_venta = p_id_venta;
      RETURN v_total;
   END;
END pkg_consultas_ventas;
/

CREATE OR REPLACE PACKAGE pkg_detalle_venta AS
   PROCEDURE agregar_detalle(p_venta NUMBER, p_producto NUMBER, p_cantidad NUMBER, p_precio NUMBER);
   PROCEDURE actualizar_detalle(p_id_detalle NUMBER, p_cantidad NUMBER, p_precio NUMBER);
   PROCEDURE eliminar_detalle(p_id_detalle NUMBER);
END pkg_detalle_venta;
/

CREATE OR REPLACE PACKAGE BODY pkg_detalle_venta AS
   PROCEDURE agregar_detalle(p_venta NUMBER, p_producto NUMBER, p_cantidad NUMBER, p_precio NUMBER) IS
   BEGIN
      INSERT INTO DetalleVenta(id_detalle,id_venta,id_producto,cantidad,precio)
      VALUES(seq_detalleventa.NEXTVAL,p_venta,p_producto,p_cantidad,p_precio);
   END;
   PROCEDURE actualizar_detalle(p_id_detalle NUMBER, p_cantidad NUMBER, p_precio NUMBER) IS
   BEGIN
      UPDATE DetalleVenta SET cantidad = p_cantidad, precio = p_precio WHERE id_detalle = p_id_detalle;
   END;
   PROCEDURE eliminar_detalle(p_id_detalle NUMBER) IS
   BEGIN
      DELETE FROM DetalleVenta WHERE id_detalle = p_id_detalle;
   END;
END pkg_detalle_venta;
/

CREATE OR REPLACE PACKAGE pkg_inventario AS
   PROCEDURE aumentar_stock(p_producto NUMBER, p_cant NUMBER);
   PROCEDURE disminuir_stock(p_producto NUMBER, p_cant NUMBER);
END pkg_inventario;
/

CREATE OR REPLACE PACKAGE BODY pkg_inventario AS
   PROCEDURE aumentar_stock(p_producto NUMBER, p_cant NUMBER) IS
   BEGIN
      UPDATE Productos SET stock = stock + p_cant WHERE id_producto = p_producto;
   END;
   PROCEDURE disminuir_stock(p_producto NUMBER, p_cant NUMBER) IS
   BEGIN
      UPDATE Productos SET stock = stock - p_cant WHERE id_producto = p_producto;
   END;
END pkg_inventario;
/

CREATE OR REPLACE PACKAGE pkg_productos_crud AS
   PROCEDURE insertar_producto(p_nombre VARCHAR2,p_precio NUMBER,p_stock NUMBER,p_id_categoria NUMBER,p_id_marca NUMBER,p_id_proveedor NUMBER);
   PROCEDURE actualizar_producto(p_id NUMBER,p_nombre VARCHAR2,p_precio NUMBER,p_stock NUMBER,p_id_categoria NUMBER,p_id_marca NUMBER,p_id_proveedor NUMBER);
   PROCEDURE eliminar_producto(p_id NUMBER);
END pkg_productos_crud;
/

CREATE OR REPLACE PACKAGE BODY pkg_productos_crud AS
   PROCEDURE insertar_producto(p_nombre VARCHAR2,p_precio NUMBER,p_stock NUMBER,p_id_categoria NUMBER,p_id_marca NUMBER,p_id_proveedor NUMBER) IS
   BEGIN
      INSERT INTO Productos(id_producto,nombre,precio,stock,id_categoria,id_marca,id_proveedor)
      VALUES(seq_productos.NEXTVAL,p_nombre,p_precio,p_stock,p_id_categoria,p_id_marca,p_id_proveedor);
   END;
   PROCEDURE actualizar_producto(p_id NUMBER,p_nombre VARCHAR2,p_precio NUMBER,p_stock NUMBER,p_id_categoria NUMBER,p_id_marca NUMBER,p_id_proveedor NUMBER) IS
   BEGIN
      UPDATE Productos
      SET nombre = p_nombre, precio = p_precio, stock = p_stock,
          id_categoria = p_id_categoria, id_marca = p_id_marca, id_proveedor = p_id_proveedor
      WHERE id_producto = p_id;
   END;
   PROCEDURE eliminar_producto(p_id NUMBER) IS
   BEGIN
      DELETE FROM Productos WHERE id_producto = p_id;
   END;
END pkg_productos_crud;
/

CREATE OR REPLACE PACKAGE pkg_reportes AS
   FUNCTION ventas_cliente(p_cliente NUMBER) RETURN NUMBER;
   FUNCTION total_venta(p_venta NUMBER) RETURN NUMBER;
END pkg_reportes;
/

CREATE OR REPLACE PACKAGE BODY pkg_reportes AS
   FUNCTION ventas_cliente(p_cliente NUMBER) RETURN NUMBER IS v_total NUMBER;
   BEGIN
      SELECT COUNT(*) INTO v_total FROM Ventas WHERE id_cliente = p_cliente;
      RETURN v_total;
   END;
   FUNCTION total_venta(p_venta NUMBER) RETURN NUMBER IS v_total NUMBER;
   BEGIN
      SELECT NVL(SUM(cantidad*precio),0) INTO v_total FROM DetalleVenta WHERE id_venta = p_venta;
      RETURN v_total;
   END;
END pkg_reportes;
/

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

CREATE OR REPLACE PACKAGE pkg_validaciones AS
   FUNCTION validar_stock(p_producto NUMBER,p_cantidad NUMBER) RETURN NUMBER;
END pkg_validaciones;
/

CREATE OR REPLACE PACKAGE BODY pkg_validaciones AS
   FUNCTION validar_stock(p_producto NUMBER,p_cantidad NUMBER) RETURN NUMBER IS
      v_stock NUMBER;
   BEGIN
      SELECT stock INTO v_stock FROM Productos WHERE id_producto = p_producto;
      IF v_stock >= p_cantidad THEN RETURN 1; ELSE RETURN 0; END IF;
   EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 0; END;
END pkg_validaciones;
/

CREATE OR REPLACE PACKAGE pkg_ventas AS
   PROCEDURE registrar_venta(p_cliente NUMBER,p_empleado NUMBER);
   PROCEDURE eliminar_venta(p_id NUMBER);
END pkg_ventas;
/

CREATE OR REPLACE PACKAGE BODY pkg_ventas AS
   PROCEDURE registrar_venta(p_cliente NUMBER,p_empleado NUMBER) IS
   BEGIN
      INSERT INTO Ventas(id_venta,fecha,id_cliente,id_empleado)
      VALUES(seq_ventas.NEXTVAL,SYSDATE,p_cliente,p_empleado);
   END;
   PROCEDURE eliminar_venta(p_id NUMBER) IS
   BEGIN
      DELETE FROM Ventas WHERE id_venta = p_id;
   END;
END pkg_ventas;
/

/* =========================================================
   9. TRIGGERS (5)
   ========================================================= */
CREATE OR REPLACE TRIGGER trg_detalleventa_asignar_precio
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
   SELECT precio INTO :NEW.precio
   FROM Productos
   WHERE id_producto = :NEW.id_producto;
END;
/

CREATE OR REPLACE TRIGGER trg_detalleventa_validar_stock
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
DECLARE
   v_stock NUMBER;
BEGIN
   SELECT stock INTO v_stock
   FROM Productos
   WHERE id_producto = :NEW.id_producto;

   IF v_stock < :NEW.cantidad THEN
      RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente para realizar la venta.');
   END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_detalleventa_descontar_stock
AFTER INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
   UPDATE Productos
   SET stock = stock - :NEW.cantidad
   WHERE id_producto = :NEW.id_producto;
END;
/

CREATE OR REPLACE TRIGGER trg_productos_validar_precio
BEFORE INSERT OR UPDATE ON Productos
FOR EACH ROW
BEGIN
   IF :NEW.precio <= 0 THEN
      RAISE_APPLICATION_ERROR(-20002, 'El precio debe ser mayor a 0.');
   END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_productos_validar_stock
BEFORE INSERT OR UPDATE ON Productos
FOR EACH ROW
BEGIN
   IF :NEW.stock < 0 THEN
      RAISE_APPLICATION_ERROR(-20003, 'El stock no puede ser negativo.');
   END IF;
END;
/

/* =========================================================
   10. VISTAS (10)
   ========================================================= */
CREATE OR REPLACE VIEW v_productos_bajo_stock AS
SELECT p.id_producto,
       p.nombre,
       c.nombre AS categoria,
       p.stock,
       p.precio
FROM Productos p
LEFT JOIN Categorias c ON p.id_categoria = c.id_categoria
WHERE p.stock < 10;

CREATE OR REPLACE VIEW v_resumen_ventas_cliente AS
SELECT c.id_cliente,
       c.nombre,
       COUNT(DISTINCT v.id_venta) AS total_compras,
       NVL(SUM(dv.cantidad * dv.precio), 0) AS monto_total_gastado
FROM Clientes c
LEFT JOIN Ventas v ON c.id_cliente = v.id_cliente
LEFT JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
GROUP BY c.id_cliente, c.nombre;

CREATE OR REPLACE VIEW v_productos_mas_vendidos AS
SELECT p.id_producto,
       p.nombre,
       c.nombre AS categoria,
       NVL(SUM(dv.cantidad), 0) AS unidades_vendidas,
       NVL(SUM(dv.cantidad * dv.precio), 0) AS total_generado
FROM Productos p
LEFT JOIN Categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN DetalleVenta dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre, c.nombre;

CREATE OR REPLACE VIEW v_ventas_mes_actual AS
SELECT v.id_venta,
       v.fecha,
       c.nombre AS cliente,
       e.nombre AS empleado,
       COUNT(dv.id_producto) AS productos_vendidos,
       NVL(SUM(dv.cantidad * dv.precio), 0) AS total_venta
FROM Ventas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Empleados e ON v.id_empleado = e.id_empleado
JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
WHERE EXTRACT(MONTH FROM v.fecha) = EXTRACT(MONTH FROM SYSDATE)
  AND EXTRACT(YEAR FROM v.fecha) = EXTRACT(YEAR FROM SYSDATE)
GROUP BY v.id_venta, v.fecha, c.nombre, e.nombre;

CREATE OR REPLACE VIEW v_clientes_frecuentes AS
SELECT c.id_cliente,
       c.nombre,
       c.telefono,
       c.correo,
       COUNT(v.id_venta) AS numero_compras
FROM Clientes c
JOIN Ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.telefono, c.correo
HAVING COUNT(v.id_venta) > 3;

CREATE OR REPLACE VIEW v_productos_por_categoria AS
SELECT c.nombre AS categoria,
       COUNT(p.id_producto) AS cantidad_productos,
       MIN(p.precio) AS precio_minimo,
       MAX(p.precio) AS precio_maximo,
       ROUND(AVG(p.precio), 2) AS precio_promedio
FROM Categorias c
LEFT JOIN Productos p ON c.id_categoria = p.id_categoria
GROUP BY c.nombre;

CREATE OR REPLACE VIEW v_historial_ventas_producto AS
SELECT p.nombre AS producto,
       v.fecha,
       dv.cantidad,
       dv.precio,
       (dv.cantidad * dv.precio) AS total_linea,
       c.nombre AS cliente_comprador,
       e.nombre AS empleado,
       v.id_venta
FROM DetalleVenta dv
JOIN Productos p ON dv.id_producto = p.id_producto
JOIN Ventas v ON dv.id_venta = v.id_venta
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Empleados e ON v.id_empleado = e.id_empleado;

CREATE OR REPLACE VIEW v_clientes_sin_compras AS
SELECT c.id_cliente,
       c.nombre,
       c.telefono,
       c.correo
FROM Clientes c
LEFT JOIN Ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

CREATE OR REPLACE VIEW v_resumen_ventas_diarias AS
SELECT fecha,
       COUNT(id_venta) AS cantidad_ventas,
       SUM(total_venta) AS total_dia
FROM (
    SELECT v.fecha,
           v.id_venta,
           NVL(SUM(dv.cantidad * dv.precio), 0) AS total_venta
    FROM Ventas v
    JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
    GROUP BY v.fecha, v.id_venta
)
GROUP BY fecha;

CREATE OR REPLACE VIEW v_top5_productos_ingresos AS
SELECT *
FROM (
    SELECT p.id_producto,
           p.nombre AS producto,
           c.nombre AS categoria,
           NVL(SUM(dv.cantidad), 0) AS unidades_vendidas,
           NVL(SUM(dv.cantidad * dv.precio), 0) AS ingresos_totales
    FROM Productos p
    LEFT JOIN Categorias c ON p.id_categoria = c.id_categoria
    LEFT JOIN DetalleVenta dv ON p.id_producto = dv.id_producto
    GROUP BY p.id_producto, p.nombre, c.nombre
    ORDER BY ingresos_totales DESC
)
WHERE ROWNUM <= 5;

/* =========================================================
   FIN DEL SCRIPT
   ========================================================= */

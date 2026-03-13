/* =========================================================
   PROCEDIMIENTOS ALMACENADOS - MotoRepuestos CR
   Modelo actualizado según tablas reales
   ========================================================= */


/* =========================================================
   1) CLIENTES
   ========================================================= */

CREATE OR REPLACE PROCEDURE sp_insertar_cliente (
    p_nombre    IN VARCHAR2,
    p_telefono  IN VARCHAR2,
    p_correo    IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Clientes (nombre, telefono, correo)
    VALUES (p_nombre, p_telefono, p_correo);
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

/* =========================================================
   2) PRODUCTOS
   ========================================================= */

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
    INSERT INTO Productos (nombre, precio, stock, id_categoria, id_marca, id_proveedor)
    VALUES (p_nombre, p_precio, p_stock, p_id_categoria, p_id_marca, p_id_proveedor);
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

/* =========================================================
   3) VENTAS
   ========================================================= */

CREATE OR REPLACE PROCEDURE sp_insertar_venta (
    p_fecha       IN DATE,
    p_id_cliente  IN NUMBER,
    p_id_empleado IN NUMBER
)
AS
BEGIN
    INSERT INTO Ventas (fecha, id_cliente, id_empleado)
    VALUES (p_fecha, p_id_cliente, p_id_empleado);
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

/* =========================================================
   4) DETALLE VENTA
   ========================================================= */

CREATE OR REPLACE PROCEDURE sp_insertar_detalle_venta (
    p_id_venta    IN NUMBER,
    p_id_producto IN NUMBER,
    p_cantidad    IN NUMBER,
    p_precio      IN NUMBER
)
AS
BEGIN
    INSERT INTO DetalleVenta (id_venta, id_producto, cantidad, precio)
    VALUES (p_id_venta, p_id_producto, p_cantidad, p_precio);
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

/* =========================================================
   5) PROCEDIMIENTOS EXTRA DEL NEGOCIO
   ========================================================= */

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

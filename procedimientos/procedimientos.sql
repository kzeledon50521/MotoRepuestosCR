/* ------------------------------------------------------------
  Procedimeintos de cliente
   ------------------------------------------------------------ */

/* ------------------------------------------------------------
   Insertar Cliente
   ------------------------------------------------------------ */

CREATE OR REPLACE PROCEDURE sp_insertar_cliente (
    p_id_cliente IN NUMBER,
    p_nombre     IN VARCHAR2,
    p_telefono   IN VARCHAR2,
    p_correo     IN VARCHAR2
)
AS
BEGIN
    INSERT INTO CLIENTES (id_cliente, nombre, telefono, correo)
    VALUES (p_id_cliente, p_nombre, p_telefono, p_correo);
END;
/

/* ------------------------------------------------------------
   Listar Cliente
   ------------------------------------------------------------ */

CREATE OR REPLACE PROCEDURE sp_listar_clientes (
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_cliente, nombre, telefono, correo
        FROM CLIENTES;
END;
/

/* ------------------------------------------------------------
   Buscar cliente por id
   ------------------------------------------------------------ */

CREATE OR REPLACE PROCEDURE sp_buscar_cliente_id (
    p_id_cliente IN NUMBER,
    p_resultado  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_cliente, nombre, telefono, correo
        FROM CLIENTES
        WHERE id_cliente = p_id_cliente;
END;
/

/* ------------------------------------------------------------
   Actualizar cliente
   ------------------------------------------------------------ */

CREATE OR REPLACE PROCEDURE sp_actualizar_cliente (
    p_id_cliente IN NUMBER,
    p_nombre     IN VARCHAR2,
    p_telefono   IN VARCHAR2,
    p_correo     IN VARCHAR2
)
AS
BEGIN
    UPDATE CLIENTES
    SET nombre = p_nombre,
        telefono = p_telefono,
        correo = p_correo
    WHERE id_cliente = p_id_cliente;
END;
/
/* ------------------------------------------------------------
   Eliminar cliente
   ------------------------------------------------------------ */

CREATE OR REPLACE PROCEDURE sp_eliminar_cliente (
    p_id_cliente IN NUMBER
)
AS
BEGIN
    DELETE FROM CLIENTES
    WHERE id_cliente = p_id_cliente;
END;
/

/* ------------------------------------------------------------
   Procedimeintos Productos 
   ------------------------------------------------------------ */

/* ------------------------------------------------------------
   Insertar producto
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_insertar_producto (
    p_id_producto      IN NUMBER,
    p_nombre_producto  IN VARCHAR2,
    p_descripcion      IN VARCHAR2,
    p_categoria        IN VARCHAR2,
    p_precio           IN NUMBER,
    p_stock            IN NUMBER
)
AS
BEGIN
    INSERT INTO PRODUCTOS (id_producto, nombre_producto, descripcion, categoria, precio, stock)
    VALUES (p_id_producto, p_nombre_producto, p_descripcion, p_categoria, p_precio, p_stock);
END;
/

/* ------------------------------------------------------------
   Listar productos
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_listar_productos (
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre_producto, descripcion, categoria, precio, stock
        FROM PRODUCTOS;
END;
/

/* ------------------------------------------------------------
   Buscar producto por id
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_buscar_producto_id (
    p_id_producto IN NUMBER,
    p_resultado   OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre_producto, descripcion, categoria, precio, stock
        FROM PRODUCTOS
        WHERE id_producto = p_id_producto;
END;
/

/* ------------------------------------------------------------
  Actualizar producto
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_actualizar_producto (
    p_id_producto      IN NUMBER,
    p_nombre_producto  IN VARCHAR2,
    p_descripcion      IN VARCHAR2,
    p_categoria        IN VARCHAR2,
    p_precio           IN NUMBER,
    p_stock            IN NUMBER
)
AS
BEGIN
    UPDATE PRODUCTOS
    SET nombre_producto = p_nombre_producto,
        descripcion = p_descripcion,
        categoria = p_categoria,
        precio = p_precio,
        stock = p_stock
    WHERE id_producto = p_id_producto;
END;
/

/* ------------------------------------------------------------
  Eliminar producto
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_eliminar_producto (
    p_id_producto IN NUMBER
)
AS
BEGIN
    DELETE FROM PRODUCTOS
    WHERE id_producto = p_id_producto;
END;
/

/* ------------------------------------------------------------
   Procedimeintos Ventas
   ------------------------------------------------------------ */

/* ------------------------------------------------------------
   Insertar Venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_insertar_venta (
    p_id_venta    IN NUMBER,
    p_fecha       IN DATE,
    p_id_cliente  IN NUMBER
)
AS
BEGIN
    INSERT INTO VENTAS (id_venta, fecha, id_cliente)
    VALUES (p_id_venta, p_fecha, p_id_cliente);
END;
/

/* ------------------------------------------------------------
   Listar Venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_listar_ventas (
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_venta, fecha, id_cliente
        FROM VENTAS;
END;
/

/* ------------------------------------------------------------
   Buscar venta por id
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_buscar_venta_id (
    p_id_venta  IN NUMBER,
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_venta, fecha, id_cliente
        FROM VENTAS
        WHERE id_venta = p_id_venta;
END;
/

/* ------------------------------------------------------------
   Actualizar venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_actualizar_venta (
    p_id_venta    IN NUMBER,
    p_fecha       IN DATE,
    p_id_cliente  IN NUMBER
)
AS
BEGIN
    UPDATE VENTAS
    SET fecha = p_fecha,
        id_cliente = p_id_cliente
    WHERE id_venta = p_id_venta;
END;
/

/* ------------------------------------------------------------
   Eliminar venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_eliminar_venta (
    p_id_venta IN NUMBER
)
AS
BEGIN
    DELETE FROM VENTAS
    WHERE id_venta = p_id_venta;
END;
/

/* ------------------------------------------------------------
   Procedimeintos DETALLE_VENTA
   ------------------------------------------------------------ */

/* ------------------------------------------------------------
   Insertar detalle de venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_insertar_detalle_venta (
    p_id_detalle   IN NUMBER,
    p_id_venta     IN NUMBER,
    p_id_producto  IN NUMBER,
    p_cantidad     IN NUMBER,
    p_subtotal     IN NUMBER
)
AS
BEGIN
    INSERT INTO DETALLE_VENTA (id_detalle, id_venta, id_producto, cantidad, subtotal)
    VALUES (p_id_detalle, p_id_venta, p_id_producto, p_cantidad, p_subtotal);
END;
/

/* ------------------------------------------------------------
   Listar detalle de venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_listar_detalle_venta (
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_detalle, id_venta, id_producto, cantidad, subtotal
        FROM DETALLE_VENTA;
END;
/

/* ------------------------------------------------------------
   Buscar detalle por id
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_buscar_detalle_id (
    p_id_detalle IN NUMBER,
    p_resultado  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_detalle, id_venta, id_producto, cantidad, subtotal
        FROM DETALLE_VENTA
        WHERE id_detalle = p_id_detalle;
END;
/

/* ------------------------------------------------------------
   Actualizar detalle de venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_actualizar_detalle_venta (
    p_id_detalle   IN NUMBER,
    p_id_venta     IN NUMBER,
    p_id_producto  IN NUMBER,
    p_cantidad     IN NUMBER,
    p_subtotal     IN NUMBER
)
AS
BEGIN
    UPDATE DETALLE_VENTA
    SET id_venta = p_id_venta,
        id_producto = p_id_producto,
        cantidad = p_cantidad,
        subtotal = p_subtotal
    WHERE id_detalle = p_id_detalle;
END;
/

/* ------------------------------------------------------------
   Eliminar detalle de venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_eliminar_detalle_venta (
    p_id_detalle IN NUMBER
)
AS
BEGIN
    DELETE FROM DETALLE_VENTA
    WHERE id_detalle = p_id_detalle;
END;
/

/* ------------------------------------------------------------
   5 procedimientos extra del negocio
   ------------------------------------------------------------ */

/* ------------------------------------------------------------
   Listar ventas por cliente
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_listar_ventas_por_cliente (
    p_id_cliente IN NUMBER,
    p_resultado  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_venta, fecha, id_cliente
        FROM VENTAS
        WHERE id_cliente = p_id_cliente;
END;
/

/* ------------------------------------------------------------
   Listar productos por categoría
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_listar_productos_por_categoria (
    p_categoria IN VARCHAR2,
    p_resultado OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre_producto, descripcion, categoria, precio, stock
        FROM PRODUCTOS
        WHERE categoria = p_categoria;
END;
/

/* ------------------------------------------------------------
   Actualizar stock de producto
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_actualizar_stock_producto (
    p_id_producto IN NUMBER,
    p_nuevo_stock IN NUMBER
)
AS
BEGIN
    UPDATE PRODUCTOS
    SET stock = p_nuevo_stock
    WHERE id_producto = p_id_producto;
END;
/

/* ------------------------------------------------------------
   Listar productos con stock bajo
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_productos_stock_bajo (
    p_stock_minimo IN NUMBER,
    p_resultado    OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_resultado FOR
        SELECT id_producto, nombre_producto, stock
        FROM PRODUCTOS
        WHERE stock <= p_stock_minimo;
END;
/

/* ------------------------------------------------------------
   Obtener total de una venta
   ------------------------------------------------------------ */
CREATE OR REPLACE PROCEDURE sp_total_venta (
    p_id_venta IN NUMBER,
    p_total    OUT NUMBER
)
AS
BEGIN
    SELECT NVL(SUM(subtotal), 0)
    INTO p_total
    FROM DETALLE_VENTA
    WHERE id_venta = p_id_venta;
END;
/

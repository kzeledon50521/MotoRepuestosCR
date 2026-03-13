/* =========================================================
   CURSORES - MotoRepuestos CR
   Modelo actualizado según tablas reales
   ========================================================= */


/* =========================================================
   1) Cursor de clientes
   ========================================================= */
DECLARE
    CURSOR cur_clientes IS
        SELECT id_cliente, nombre, telefono, correo
        FROM Clientes;
BEGIN
    FOR r IN cur_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || r.id_cliente || ' - ' || r.nombre);
    END LOOP;
END;
/

/* =========================================================
   2) Cursor de productos
   ========================================================= */
DECLARE
    CURSOR cur_productos IS
        SELECT id_producto, nombre, precio, stock
        FROM Productos;
BEGIN
    FOR r IN cur_productos LOOP
        DBMS_OUTPUT.PUT_LINE('Producto: ' || r.id_producto || ' - ' || r.nombre);
    END LOOP;
END;
/

/* =========================================================
   3) Cursor de categorías
   ========================================================= */
DECLARE
    CURSOR cur_categorias IS
        SELECT id_categoria, nombre
        FROM Categorias;
BEGIN
    FOR r IN cur_categorias LOOP
        DBMS_OUTPUT.PUT_LINE('Categoría: ' || r.id_categoria || ' - ' || r.nombre);
    END LOOP;
END;
/

/* =========================================================
   4) Cursor de marcas
   ========================================================= */
DECLARE
    CURSOR cur_marcas IS
        SELECT id_marca, nombre
        FROM Marcas;
BEGIN
    FOR r IN cur_marcas LOOP
        DBMS_OUTPUT.PUT_LINE('Marca: ' || r.id_marca || ' - ' || r.nombre);
    END LOOP;
END;
/

/* =========================================================
   5) Cursor de proveedores
   ========================================================= */
DECLARE
    CURSOR cur_proveedores IS
        SELECT id_proveedor, nombre, telefono, correo
        FROM Proveedores;
BEGIN
    FOR r IN cur_proveedores LOOP
        DBMS_OUTPUT.PUT_LINE('Proveedor: ' || r.id_proveedor || ' - ' || r.nombre);
    END LOOP;
END;
/

/* =========================================================
   6) Cursor de empleados
   ========================================================= */
DECLARE
    CURSOR cur_empleados IS
        SELECT id_empleado, nombre, puesto
        FROM Empleados;
BEGIN
    FOR r IN cur_empleados LOOP
        DBMS_OUTPUT.PUT_LINE('Empleado: ' || r.id_empleado || ' - ' || r.nombre);
    END LOOP;
END;
/

/* =========================================================
   7) Cursor de ventas
   ========================================================= */
DECLARE
    CURSOR cur_ventas IS
        SELECT id_venta, fecha, id_cliente, id_empleado
        FROM Ventas;
BEGIN
    FOR r IN cur_ventas LOOP
        DBMS_OUTPUT.PUT_LINE('Venta: ' || r.id_venta || ' - Cliente: ' || r.id_cliente);
    END LOOP;
END;
/

/* =========================================================
   8) Cursor de detalle de venta
   ========================================================= */
DECLARE
    CURSOR cur_detalle_venta IS
        SELECT id_detalle, id_venta, id_producto, cantidad, precio
        FROM DetalleVenta;
BEGIN
    FOR r IN cur_detalle_venta LOOP
        DBMS_OUTPUT.PUT_LINE('Detalle: ' || r.id_detalle || ' - Venta: ' || r.id_venta);
    END LOOP;
END;
/

/* =========================================================
   9) Cursor de productos con stock bajo
   ========================================================= */
DECLARE
    CURSOR cur_productos_stock_bajo IS
        SELECT id_producto, nombre, stock
        FROM Productos
        WHERE stock <= 5;
BEGIN
    FOR r IN cur_productos_stock_bajo LOOP
        DBMS_OUTPUT.PUT_LINE('Stock bajo: ' || r.nombre || ' - Stock: ' || r.stock);
    END LOOP;
END;
/

/* =========================================================
   10) Cursor de productos por categoría
   ========================================================= */
DECLARE
    CURSOR cur_productos_por_categoria IS
        SELECT p.id_producto, p.nombre, c.nombre AS categoria
        FROM Productos p
        JOIN Categorias c ON p.id_categoria = c.id_categoria;
BEGIN
    FOR r IN cur_productos_por_categoria LOOP
        DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ' - Categoría: ' || r.categoria);
    END LOOP;
END;
/

/* =========================================================
   11) Cursor de productos por marca
   ========================================================= */
DECLARE
    CURSOR cur_productos_por_marca IS
        SELECT p.id_producto, p.nombre, m.nombre AS marca
        FROM Productos p
        JOIN Marcas m ON p.id_marca = m.id_marca;
BEGIN
    FOR r IN cur_productos_por_marca LOOP
        DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ' - Marca: ' || r.marca);
    END LOOP;
END;
/

/* =========================================================
   12) Cursor de productos por proveedor
   ========================================================= */
DECLARE
    CURSOR cur_productos_por_proveedor IS
        SELECT p.id_producto, p.nombre, pr.nombre AS proveedor
        FROM Productos p
        JOIN Proveedores pr ON p.id_proveedor = pr.id_proveedor;
BEGIN
    FOR r IN cur_productos_por_proveedor LOOP
        DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ' - Proveedor: ' || r.proveedor);
    END LOOP;
END;
/

/* =========================================================
   13) Cursor de ventas por cliente
   ========================================================= */
DECLARE
    CURSOR cur_ventas_por_cliente IS
        SELECT v.id_venta, v.fecha, c.nombre AS cliente
        FROM Ventas v
        JOIN Clientes c ON v.id_cliente = c.id_cliente;
BEGIN
    FOR r IN cur_ventas_por_cliente LOOP
        DBMS_OUTPUT.PUT_LINE('Venta: ' || r.id_venta || ' - Cliente: ' || r.cliente);
    END LOOP;
END;
/

/* =========================================================
   14) Cursor de ventas por empleado
   ========================================================= */
DECLARE
    CURSOR cur_ventas_por_empleado IS
        SELECT v.id_venta, v.fecha, e.nombre AS empleado
        FROM Ventas v
        JOIN Empleados e ON v.id_empleado = e.id_empleado;
BEGIN
    FOR r IN cur_ventas_por_empleado LOOP
        DBMS_OUTPUT.PUT_LINE('Venta: ' || r.id_venta || ' - Empleado: ' || r.empleado);
    END LOOP;
END;
/

/* =========================================================
   15) Cursor de total por venta
   ========================================================= */
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

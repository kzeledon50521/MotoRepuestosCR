CREATE VIEW VistaProductos AS
SELECT nombre, precio, stock
FROM Productos;

CREATE VIEW VistaClientes AS
SELECT nombre, telefono
FROM Clientes;

CREATE VIEW VistaProveedores AS
SELECT nombre, telefono
FROM Proveedores;

CREATE VIEW VistaProductosCategoria AS
SELECT p.nombre, c.nombre AS categoria
FROM Productos p
JOIN Categorias c ON p.id_categoria = c.id_categoria;

CREATE VIEW VistaProductosMarca AS
SELECT p.nombre, m.nombre AS marca
FROM Productos p
JOIN Marcas m ON p.id_marca = m.id_marca;

CREATE VIEW VistaVentas AS
SELECT id_venta, fecha
FROM Ventas;

CREATE VIEW VistaVentasClientes AS
SELECT v.id_venta, c.nombre
FROM Ventas v
JOIN Clientes c ON v.id_cliente = c.id_cliente;

CREATE VIEW VistaInventario AS
SELECT nombre, stock
FROM Productos;

CREATE VIEW VistaProductosProveedor AS
SELECT p.nombre, pr.nombre AS proveedor
FROM Productos p
JOIN Proveedores pr ON p.id_proveedor = pr.id_proveedor;

CREATE VIEW VistaDetalleVentas AS
SELECT v.id_venta, p.nombre, d.cantidad
FROM DetalleVenta d
JOIN Productos p ON d.id_producto = p.id_producto
JOIN Ventas v ON d.id_venta = v.id_venta;

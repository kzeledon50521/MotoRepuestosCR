-- ====================================================
-- SISTEMA MOTOREPUESTOS CR S.A.
-- ARCHIVO: vistas.sql
-- DESCRIPCIÓN: Contiene las 10 vistas requeridas para 
--              la gestión del inventario, clientes y ventas
-- ====================================================

-- ====================================================
-- Vista 1: Productos con bajo stock
-- Muestra productos con existencia menor a 10 unidades
-- Útil para alertas de reabastecimiento
-- ====================================================
CREATE OR REPLACE VIEW v_productos_bajo_stock AS
SELECT id_producto, nombre_producto, categoria, stock, precio
FROM PRODUCTOS
WHERE stock < 10
ORDER BY stock ASC;

-- ====================================================
-- Vista 2: Resumen de ventas por cliente
-- Muestra total de compras y monto gastado por cada cliente
-- ====================================================
CREATE OR REPLACE VIEW v_resumen_ventas_cliente AS
SELECT c.id_cliente, c.nombre, COUNT(v.id_venta) AS total_compras, 
       COALESCE(SUM(dv.subtotal), 0) AS monto_total_gastado
FROM CLIENTES c
LEFT JOIN VENTAS v ON c.id_cliente = v.id_cliente
LEFT JOIN DETALLE_VENTA dv ON v.id_venta = dv.id_venta
GROUP BY c.id_cliente, c.nombre;

-- ====================================================
-- Vista 3: Productos más vendidos
-- Ranking de productos por unidades vendidas e ingresos generados
-- ====================================================
CREATE OR REPLACE VIEW v_productos_mas_vendidos AS
SELECT p.id_producto, p.nombre_producto, p.categoria, 
       COALESCE(SUM(dv.cantidad), 0) AS unidades_vendidas, 
       COALESCE(SUM(dv.subtotal), 0) AS total_generado
FROM PRODUCTOS p
LEFT JOIN DETALLE_VENTA dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre_producto, p.categoria
ORDER BY unidades_vendidas DESC;

-- ====================================================
-- Vista 4: Ventas del mes actual
-- Muestra todas las ventas realizadas en el mes corriente
-- ====================================================
CREATE OR REPLACE VIEW v_ventas_mes_actual AS
SELECT v.id_venta, v.fecha, c.nombre AS cliente, 
       COUNT(dv.id_producto) AS productos_vendidos,
       SUM(dv.subtotal) AS total_venta
FROM VENTAS v
JOIN CLIENTES c ON v.id_cliente = c.id_cliente
JOIN DETALLE_VENTA dv ON v.id_venta = dv.id_venta
WHERE EXTRACT(MONTH FROM v.fecha) = EXTRACT(MONTH FROM CURRENT_DATE)
  AND EXTRACT(YEAR FROM v.fecha) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY v.id_venta, v.fecha, c.nombre;

-- ====================================================
-- Vista 5: Clientes frecuentes
-- Clientes que han realizado más de 3 compras
-- ====================================================
CREATE OR REPLACE VIEW v_clientes_frecuentes AS
SELECT c.id_cliente, c.nombre, c.telefono, c.correo, 
       COUNT(v.id_venta) AS numero_compras
FROM CLIENTES c
JOIN VENTAS v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.telefono, c.correo
HAVING COUNT(v.id_venta) > 3;

-- ====================================================
-- Vista 6: Estadísticas por categoría
-- Resumen de productos agrupados por categoría
-- ====================================================
CREATE OR REPLACE VIEW v_productos_por_categoria AS
SELECT categoria, COUNT(*) AS cantidad_productos, 
       MIN(precio) AS precio_minimo, 
       MAX(precio) AS precio_maximo, 
       ROUND(AVG(precio), 2) AS precio_promedio
FROM PRODUCTOS
WHERE categoria IS NOT NULL
GROUP BY categoria
ORDER BY categoria;

-- ====================================================
-- Vista 7: Historial completo de ventas
-- Detalle de todas las ventas realizadas con información del producto y cliente
-- ====================================================
CREATE OR REPLACE VIEW v_historial_ventas_producto AS
SELECT p.nombre_producto, v.fecha, dv.cantidad, dv.subtotal, 
       c.nombre AS cliente_comprador, v.id_venta
FROM DETALLE_VENTA dv
JOIN PRODUCTOS p ON dv.id_producto = p.id_producto
JOIN VENTAS v ON dv.id_venta = v.id_venta
JOIN CLIENTES c ON v.id_cliente = c.id_cliente
ORDER BY v.fecha DESC;

-- ====================================================
-- Vista 8: Clientes inactivos
-- Clientes que están registrados pero nunca han comprado
-- ====================================================
CREATE OR REPLACE VIEW v_clientes_sin_compras AS
SELECT c.id_cliente, c.nombre, c.telefono, c.correo
FROM CLIENTES c
LEFT JOIN VENTAS v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- ====================================================
-- Vista 9: Resumen de ventas diarias
-- Total de ventas agrupadas por día
-- ====================================================
CREATE OR REPLACE VIEW v_resumen_ventas_diarias AS
SELECT fecha, COUNT(DISTINCT id_venta) AS cantidad_ventas, 
       SUM(total_venta) AS total_dia
FROM (
    SELECT v.fecha, v.id_venta, SUM(dv.subtotal) AS total_venta
    FROM VENTAS v
    JOIN DETALLE_VENTA dv ON v.id_venta = dv.id_venta
    GROUP BY v.fecha, v.id_venta
) AS ventas_por_venta
GROUP BY fecha
ORDER BY fecha DESC;

-- ====================================================
-- Vista 10: Top 5 productos por ingresos
-- Los 5 productos que más ingresos han generado
-- ====================================================
CREATE OR REPLACE VIEW v_top5_productos_ingresos AS
SELECT p.nombre_producto, p.categoria, 
       COALESCE(SUM(dv.cantidad), 0) AS unidades_vendidas, 
       COALESCE(SUM(dv.subtotal), 0) AS ingresos_totales
FROM PRODUCTOS p
LEFT JOIN DETALLE_VENTA dv ON p.id_producto = dv.id_producto
GROUP BY p.nombre_producto, p.categoria
ORDER BY ingresos_totales DESC
LIMIT 5;

-- ====================================================
-- FIN DE LAS VISTAS
-- Total: 10 vistas funcionales
-- ====================================================

USE analisis_ventas;

-- 1) Ventas totales por mes
SELECT
    DATE_FORMAT(fecha, '%Y-%m') AS mes,
    SUM(monto_total) AS ventas_totales,
    COUNT(*) AS num_transacciones
FROM ventas
GROUP BY mes
ORDER BY mes;

-- 2) Top productos por ingresos generados
SELECT
    p.nombre_producto,
    p.categoria,
    SUM(v.cantidad) AS unidades_vendidas,
    SUM(v.monto_total) AS ingresos
FROM ventas v
JOIN productos p ON p.producto_id = v.producto_id
GROUP BY p.producto_id, p.nombre_producto, p.categoria
ORDER BY ingresos DESC;

-- 3) Ranking de empleados por ventas generadas
SELECT
    e.nombre_empleado,
    e.region,
    SUM(v.monto_total) AS ventas_generadas,
    RANK() OVER (ORDER BY SUM(v.monto_total) DESC) AS ranking
FROM ventas v
JOIN empleados e ON e.empleado_id = v.empleado_id
GROUP BY e.empleado_id, e.nombre_empleado, e.region;

-- 4) Ingresos por segmento de cliente
SELECT
    c.segmento,
    COUNT(DISTINCT c.cliente_id) AS num_clientes,
    SUM(v.monto_total) AS ingresos_totales
FROM ventas v
JOIN clientes c ON c.cliente_id = v.cliente_id
GROUP BY c.segmento
ORDER BY ingresos_totales DESC;
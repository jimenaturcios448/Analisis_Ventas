USE analisis_ventas;

CREATE OR REPLACE VIEW vw_ventas_detalle AS
SELECT
    v.venta_id,
    v.fecha,
    YEAR(v.fecha) AS anio,
    MONTH(v.fecha) AS mes_num,
    DATE_FORMAT(v.fecha,'%Y-%m') AS anio_mes,
    c.cliente_id,
    c.nombre_cliente,
    c.ciudad,
    c.segmento,
    p.producto_id,
    p.nombre_producto,
    p.categoria,
    e.empleado_id,
    e.nombre_empleado,
    e.region,
    v.cantidad,
    v.precio_unitario,
    v.descuento_pct,
    v.monto_total
FROM ventas v
JOIN clientes  c ON c.cliente_id  = v.cliente_id
JOIN productos p ON p.producto_id = v.producto_id
JOIN empleados e ON e.empleado_id = v.empleado_id;
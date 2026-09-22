USE analisis_ventas;

SET GLOBAL local_infile = 1;

-- CLIENTES
LOAD DATA LOCAL INFILE 'data/clientes.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cliente_id, nombre_cliente, ciudad, segmento, fecha_registro);

-- PRODUCTOS
LOAD DATA LOCAL INFILE 'data/productos.csv'
INTO TABLE productos
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(producto_id, nombre_producto, categoria, precio_unitario);

-- EMPLEADOS
LOAD DATA LOCAL INFILE 'data/empleados.csv'
INTO TABLE empleados
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(empleado_id, nombre_empleado, region);

-- VENTAS
LOAD DATA LOCAL INFILE 'data/ventas.csv'
INTO TABLE ventas
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(venta_id, fecha, cliente_id, producto_id, empleado_id, cantidad,
 precio_unitario, descuento_pct, monto_total);
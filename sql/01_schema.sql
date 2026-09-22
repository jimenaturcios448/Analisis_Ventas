-- Crear la base de datos
DROP DATABASE IF EXISTS analisis_ventas;
CREATE DATABASE analisis_ventas
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE analisis_ventas;

-- Tabla de clientes
CREATE TABLE clientes (
    cliente_id       INT PRIMARY KEY,
    nombre_cliente   VARCHAR(100) NOT NULL,
    ciudad           VARCHAR(50)  NOT NULL,
    segmento         VARCHAR(30)  NOT NULL,
    fecha_registro   DATE         NOT NULL
);

-- Tabla de productos
CREATE TABLE productos (
    producto_id      INT PRIMARY KEY,
    nombre_producto  VARCHAR(100) NOT NULL,
    categoria        VARCHAR(50)  NOT NULL,
    precio_unitario  DECIMAL(10,2) NOT NULL
);

-- Tabla de empleados
CREATE TABLE empleados (
    empleado_id      INT PRIMARY KEY,
    nombre_empleado  VARCHAR(100) NOT NULL,
    region           VARCHAR(30)  NOT NULL
);

-- Tabla de ventas (conecta a las otras 3)
CREATE TABLE ventas (
    venta_id         INT PRIMARY KEY,
    fecha            DATE NOT NULL,
    cliente_id       INT NOT NULL,
    producto_id      INT NOT NULL,
    empleado_id      INT NOT NULL,
    cantidad         INT NOT NULL,
    precio_unitario  DECIMAL(10,2) NOT NULL,
    descuento_pct    DECIMAL(4,2) NOT NULL DEFAULT 0,
    monto_total      DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_ventas_cliente  FOREIGN KEY (cliente_id)  REFERENCES clientes(cliente_id),
    CONSTRAINT fk_ventas_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
    CONSTRAINT fk_ventas_empleado FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);
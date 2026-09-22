# 📊 Analisis_Ventas

Proyecto de análisis de ventas de una tienda retail ficticia, usando MySQL para modelar y analizar los datos, con datos de origen en Excel/CSV.

## Tecnologías usadas

- **MySQL** — base de datos relacional, modelo de tablas y consultas de análisis
- **Visual Studio Code** — desarrollo de scripts SQL y control de versiones
- **Excel/CSV** — datos de origen
- **Power BI** — dashboard interactivo (en progreso)

## Estructura del proyecto

Analisis_Ventas/
├── data/ # Datos de origen en CSV
├── sql/ # Scripts SQL (esquema, carga, consultas, vistas)
└── docs/ # Documentación


## Modelo de datos

Modelo tipo estrella: una tabla de hechos `ventas` conectada a tres tablas de dimensión (`clientes`, `productos`, `empleados`).

## Cómo reproducirlo

1. Ejecuta `sql/01_schema.sql` para crear la base de datos y tablas
2. Ejecuta `sql/02_carga_datos.sql` para cargar los datos desde `data/`
3. Ejecuta `sql/03_consultas_analisis.sql` para ver los análisis de negocio
4. Ejecuta `sql/04_vistas_powerbi.sql` para crear las vistas
5. Conecta Power BI a la base `analisis_ventas` usando la vista `vw_ventas_detalle`

## Autor

Proyecto de portafolio de análisis de datos.
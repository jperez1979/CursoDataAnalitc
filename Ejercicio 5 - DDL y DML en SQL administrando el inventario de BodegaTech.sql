-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: JESUS PEREZ
-- Fecha: 26/06/2026
-- ══════════════════════════════════════════
-- ── SECCIÓN DDL ──────────────────────────
-- DROP TABLE
DROP TABLE IF EXISTS inventario;
-- CREATE TABLE
CREATE TABLE [dbo].[inventario](
	[id_producto] [int]  NOT NULL,
	[nombre_producto] [varchar](100) NULL,
	[categoria] [varchar](50) NULL,
	[precio_unitario] [decimal](18, 2) NULL,
	[stock_actual] [int] NULL,
	[stock_minimo] [int] NULL,
	[fecha_ingreso] [date] NULL,
	[activo] [tinyint] NULL,
 CONSTRAINT [PK_inventario] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];


-- ── SECCIÓN DML ──────────────────────────
-- INSERT INTO
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(1,'Laptop Pro 15','Computación',1200.00,15,3,'2024-01-10',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(2,'Mouse Inalámbrico','Accesorios',28.00,80,10,'2024-01-10',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(3,'Monitor 4K 27"','Computación',450.00,12,2,'2024-01-15',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(4,'Teclado Mecánico','Accesorios',95.00,40,5,'2024-01-15',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(5,'Laptop Basic 14','Computación',650.00,20,3,'2024-02-01',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(6,'Auriculares BT Pro','Audio',120.00,35,5,'2024-02-01',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(7,'Hub USB-C 7 puertos','Accesorios',45.00,60,10,'2024-02-10',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(8,'Webcam HD 1080p','Accesorios',85.00,25,5,'2024-02-10',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(9,'SSD Externo 1TB','Almacenamiento',130.00,18,3,'2024-03-01',1);
insert into inventario (id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) values(10,'Parlante Bluetooth','Audio',60.00,45,8,'2024-03-01',1);


-- UPDATE ventas del día
update inventario set stock_actual = stock_actual - 3 where id_producto = 1
update inventario set stock_actual = stock_actual - 12 where id_producto = 2
update inventario set stock_actual = stock_actual - 5 where id_producto = 6

-- UPDATE producto descontinuado
update inventario set activo = 0 where id_producto = 8

-- SELECT validaciones
SELECT * FROM inventario;
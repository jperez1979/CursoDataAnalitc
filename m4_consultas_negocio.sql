/*
Instrucciones

Sobre la base de datos Ventas_Tech_DB creada en M3, escribí las siguientes consultas en un archivo llamado m4_consultas_negocio.sql. Trabajamos solo sobre la tabla ventas (recordá que tiene id_cliente, id_producto, cantidad, precio_unitario y fecha_venta). Los nombres de productos y clientes los vas a poder traer cruzando tablas con JOIN en el Módulo 5; por ahora trabajamos con los IDs.

Consulta 1 — Resumen ejecutivo mensual Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes. Calculá el total como cantidad * precio_unitario. Usá alias descriptivos en español y agrupá por mes con EXTRACT(MONTH FROM fecha_venta).

Consulta 2 — Ranking de productos Top 5 de id_producto por total facturado, mostrando las unidades vendidas (SUM(cantidad)) y el total generado. Usá GROUP BY id_producto, ORDER BY y limitá el resultado a 5.

Consulta 3 — Clientes recurrentes id_cliente que hayan realizado más de un pedido, mostrando la cantidad de pedidos y el total gastado. Usá GROUP BY id_cliente y HAVING COUNT(*) > 1.

Consulta 4 — Meses por encima/por debajo del promedio Total facturado por mes, con una columna adicional que etiquete con CASE WHEN si ese mes quedó 'Por encima' o 'Por debajo' del promedio mensual general.

Bloque de cierre Al final del archivo agregá un bloque de comentarios -- con 3 hallazgos concretos que encontraste al revisar los resultados. Por ejemplo: "El producto 1 concentra el 40% de la facturación del trimestre."
*/


/*
Consulta 1 — Resumen ejecutivo mensual Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes. 
			  Calculá el total como cantidad * precio_unitario. 
			  Usá alias descriptivos en español y agrupá por mes con EXTRACT(MONTH FROM fecha_venta).
*/
select datepart(MONTH ,fecha_venta) as mes,sum(cantidad * precio_unitario) as Total, count(*) Cantidad_Pedidos,avg(cantidad * precio_unitario) as Promedio_Pedido
from ventas
group by datepart(MONTH ,fecha_venta)

/*
Consulta 2 — Ranking de productos Top 5 de id_producto por total facturado, mostrando las unidades vendidas (SUM(cantidad)) 
				y el total generado. Usá GROUP BY id_producto, ORDER BY y limitá el resultado a 5.
*/
select top 5  p.id_producto, p.nombre_producto, sum(cantidad * precio_unitario) as Total, sum(cantidad) as Cantidad
from ventas v inner join productos p on v.id_producto = p.id_producto
group by p.id_producto, p.nombre_producto
order by sum(cantidad * precio_unitario) desc

/*
Consulta 3 — Clientes recurrentes id_cliente que hayan realizado más de un pedido, mostrando la cantidad de pedidos y el total gastado. 
			 Usá GROUP BY id_cliente y HAVING COUNT(*) > 1.
*/
select c.id_cliente, c.nombre, count(cantidad) as CantidadPedidos, sum(cantidad * precio_unitario) as TotalGastado
from ventas v inner join clientes c on v.id_cliente = c.id_cliente
group by c.id_cliente, c.nombre
having count(cantidad) > 1


/*
Consulta 4 — Meses por encima/por debajo del promedio Total facturado por mes, con una columna adicional que etiquete con 
			CASE WHEN si ese mes quedó 'Por encima' o 'Por debajo' del promedio mensual general.
*/

select datepart(MONTH,fecha_venta) as mes,sum(cantidad * precio_unitario) as Total,
case
	when sum(cantidad * precio_unitario) > avg(cantidad * precio_unitario) then 'Por Encima'
	else 'Por debajo'
	end
from ventas
group by datepart(MONTH ,fecha_venta)


/*
Bloque de cierre

El articulo mas vendido 1 - Laptop Pro 15 concentra el 56% de las ventas.
El cliente mas comprador 1 - María López concentra el 41% de las ventas.
Todos los clientes registrados tienen al menos una compra.
*/
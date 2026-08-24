--Nivel 1 — Consultas básicas--

--¿Cuántos pedidos hay en total?--
SELECT COUNT(id)
FROM pedidos;
--¿Cuántos clientes tenemos?--
SELECT COUNT(DISTINCT id)
FROM clientes;
--¿Cuáles son todos los productos y sus precios?--
SELECT nombre, precio
FROM productos;

--\Nivel 2 — Agregaciones simples--
--Qué producto se vende más por cantidad?--

SELECT p.nombre, SUM(lp.cantidad) AS total_vendido
FROM productos p
INNER JOIN lineas_pedido lp
ON p.id = lp.producto_id
GROUP BY p.nombre
ORDER BY  total_vendido DESC
LIMIT 1;

--¿Qué producto genera más ingresos?--
SELECT p.nombre, SUM(lp.cantidad * lp.precio_unitario) AS producto_con_mas_ingresos
FROM productos p
INNER JOIN lineas_pedido lp
ON p.id = lp.producto_id
GROUP BY p.nombre
ORDER BY producto_con_mas_ingresos DESC
LIMIT 1;

--¿Cuál es el importe total de ventas?--
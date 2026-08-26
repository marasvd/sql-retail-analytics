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
SELECT SUM(importe) AS total_vendido
FROM pedidos;

--Nivel 3 — Análisis con JOINs--

--¿Qué categoría vende más?--
SELECT c.nombre AS categoria_mas_vendida, SUM(lp.cantidad * lp.precio_unitario) AS total_vendido
FROM productos P 
INNER JOIN categorias c
ON  p.categoria_id = c.id
INNER JOIN lineas_pedido lp
ON lp.producto_id = p.id
GROUP BY c.nombre
ORDER BY total_vendido DESC
LIMIT 1;

--¿Qué clientes han gastado más?-- forma larga
SELECT c.nombre AS nombre_cliente, SUM(lp.cantidad * lp.precio_unitario) AS total
FROM clientes C
INNER JOIN pedidos P
ON c.id = p.cliente_id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
GROUP BY c.nombre
ORDER BY total DESC
LIMIT 1;
-- forma rapida-- sirve solo si no se tuviera en cuenta el estado
SELECT c.nombre AS nombre_cliente, SUM(p.importe) AS total
FROM clientes c
INNER JOIN pedidos P on c.id = P.cliente_id
GROUP BY c.nombre
ORDER BY total DESC
LIMIT 1;
--para la trazabiliad con sus diferentes estados--
SELECT c.nombre AS nombre_cliente, SUM(lp.cantidad * lp.precio_unitario) AS total
FROM clientes C
INNER JOIN pedidos P
ON c.id = p.cliente_id
INNER JOIN lineas_pedido lp ON p.id = lp.pedido_id
WHERE p.estado = 'completado'
GROUP BY c.nombre
ORDER BY total DESC
LIMIT 1;

--¿Cuál es el ticket promedio por pedido?--
SELECT AVG(importe) as ticket_promedio
FROM pedidos;

--Nivel 4 — Análisis temporal--
--¿Cómo evolucionan las ventas por mes?--
SELECT strftime(fecha, '%y-%m') AS mes, SUM(importe) AS total_ventas
FROM pedidos
GROUP BY mes
ORDER BY mes DESC;
--¿Qué mes fue el mejor?--
SELECT strftime(fecha, '%y-%m') AS mes, SUM(importe) AS total_ventas
FROM pedidos
GROUP BY mes
ORDER BY total_ventas DESC
LIMIT 1;

--Nivel 5 — Conclusiones de negocio--
--¿Qué clientes VIP compran más?--
SELECT c.nombre AS cliente_vip, SUM(p.importe) AS total
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
WHERE c.es_vip = TRUE
GROUP BY cliente_vip
ORDER BY total DESC
LIMIT 5;

--¿Qué productos tienen stock bajo pero alta demanda?--
SELECT pr.nombre AS producto, pr.stock AS stock, SUM(lp.cantidad) AS unidades_vendidas
FROM productos pr
INNER JOIN lineas_pedido lp
ON pr.id = lp.producto_id
GROUP BY pr.id, pr.nombre, pr.stock
ORDER BY unidades_vendidas DESC, stock ASC
LIMIT 5;
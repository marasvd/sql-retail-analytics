SELECT *
FROM categorias;

SELECT COUNT(*)
FROM categorias

SELECT *
FROM clientes;

SELECT *
FROM empleados
LIMIT 10;

SELECT COUNT(*)
FROM empleados;

SELECT *
FROM productos
LIMIT  10;

SELECT *
FROM vendedores
LIMIT 10;

SELECT 
    v.id,
    v.empleado_id,
    e.nombre AS nombre_empleado,
    v.equipo,
    v.ventas
FROM vendedores v
LEFT JOIN empleados e ON e.id = v.empleado_id
LIMIT 10;
SELECT nombre
FROM read_csv('data/raw/vendedores.csv');

SELECT nombre
FROM empleados;

SELECT 
    v.id,
    v.nombre AS nombre_en_csv,
    v.equipo,
    v.ventas
FROM read_csv('data/raw/vendedores.csv') v
LEFT JOIN empleados e ON e.nombre = v.nombre
WHERE e.id IS NULL;

SELECT nombre, departamento
FROM empleados
LIMIT 25;

SELECT nombre
FROM empleados
WHERE nombre LIKE '% %'
ORDER BY id
LIMIT 20;

SELECT 
    nombre AS nombre_original,
    regexp_replace(nombre, ' \d+$', '') AS nombre_limpio
FROM empleados
LIMIT 10;

SELECT 
    v.id,
    v.empleado_id,
    e.nombre AS nombre_empleado,
    v.equipo,
    v.ventas
FROM vendedores v
LEFT JOIN empleados e ON e.id = v.empleado_id
LIMIT 10;

----prueba los nuevos datos, ---

---verificar clientes ---
SELECT *
FROM clientes
LIMIT 15;

----verificar pedidos---

SELECT *
FROM categorias
LIMIT 10;

SELECT p.nombre, lp.cantidad
FROM productos p
INNER JOIN lineas_pedido lp
ON p.id = lp.id;

SELECT nombre, descripcion
FROM categorias
LIMIT 5;

SELECT *
FROM empleados
LIMIT 10;

SELECT *
FROM vendedores
LIMIT 10;

SELECT c.nombre, p.fecha
FROM clientes c
LEFT JOIN  pedidos p
ON c.id = p.id;

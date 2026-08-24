TRUNCATE TABLE lineas_pedido;
TRUNCATE TABLE pedidos;
TRUNCATE TABLE productos;
TRUNCATE TABLE categorias;
TRUNCATE TABLE clientes;
TRUNCATE TABLE vendedores;
TRUNCATE TABLE empleados;



-- primera tabla--
INSERT INTO categorias
SELECT *
FROM read_csv('data/raw/categorias.csv');


INSERT INTO clientes
SELECT *
FROM read_csv('data/raw/clientes.csv');

INSERT INTO empleados
SELECT *
FROM read_csv('data/raw/empleados.csv');

INSERT INTO pedidos (id, cliente_id, fecha, importe, estado)
SELECT id, cliente_id, fecha, importe, estado
FROM read_csv('data/raw/pedidos.csv');

INSERT INTO lineas_pedido (id, pedido_id, producto_id, cantidad, precio_unitario)
SELECT id, pedido_id, producto_id, cantidad, precio_unitario
FROM read_csv('data/raw/lineas_pedido.csv');


INSERT INTO productos(id, categoria_id, nombre, precio, stock)
SELECT id, categoria_id, nombre, precio, stock
FROM read_csv('data/raw/productos.csv');

INSERT INTO vendedores(id, equipo, categoria, ventas)
SELECT id, equipo, categoria, ventas FROM read_csv('data/raw/vendedores.csv');
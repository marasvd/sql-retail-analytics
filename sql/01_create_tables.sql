-- tablas sin depemdencias
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    email VARCHAR,
    ciudad VARCHAR,
    fecha_registro DATE,
    canal_adquisicion VARCHAR,
    es_vip BOOLEAN
);

DROP TABLE IF EXISTS categorias;
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    descripcion TEXT
);

CREATE TABLE empleados (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR  NOT NULL,
    departamento VARCHAR,
    salario DECIMAL,
    fecha_contratacion DATE
);

--- termine las tablas con dependencia, simpless ----

CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    categoria_id INTEGER REFERENCES categorias(id),
    nombre VARCHAR NOT NULL,
    precio DECIMAL,
    stock INT
);

DROP TABLE IF EXISTS vendedores;
CREATE TABLE vendedores (
    id INTEGER PRIMARY KEY,
    empleado_id INTEGER REFERENCES empleados(id),
    equipo VARCHAR,
    categoria VARCHAR,
    ventas DECIMAL
);

--- termine las tablas con dependencia simples,  o sea seguimos  las que tienen mas claves foraneas----
CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    vendedor_id INTEGER REFERENCES vendedores(id),
    fecha DATE,
    importe DECIMAL,
    estado VARCHAR
);

DROP TABLE IF EXISTS linea_pedidos;

CREATE TABLE lineas_pedidos (
    id INTEGER PRIMARY KEY,
    pedido_id INTEGER REFERENCES pedidos(id),
    producto_id INTEGER REFERENCES productos(id),
    cantidad INT,
    precio_unitario DECIMAL
);

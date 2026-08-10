# Decisiones técnicas de modelado

## Contexto

El modelo entidad-relación fue construido a partir del análisis de los archivos CSV proporcionados como fuente inicial de datos.

Antes de crear las entidades definitivas se realizó una revisión de la información disponible con el objetivo de evitar redundancia, mejorar la estructura y representar correctamente la lógica del negocio.

---

# 1. Limpieza y revisión de atributos

Durante el análisis inicial se identificaron atributos que no aportaban información necesaria dentro del modelo principal.

Se eliminaron o evitaron atributos redundantes debido a que podían ser calculados posteriormente mediante consultas SQL.

Ejemplo:

- Ventas diarias.
- Ventas mensuales.

Estos atributos fueron descartados porque representan valores derivados que pueden obtenerse mediante agregaciones sobre los pedidos existentes.

Mantenerlos dentro de la base generaría duplicación de información y posibles inconsistencias.

---

# 2. Definición de entidades y atributos

Después de la revisión de los datos se definieron las entidades principales del sistema:

- Clientes
- Productos
- Categorías
- Pedidos
- Líneas de pedido
- Empleados
- Vendedores

Para cada entidad se determinaron sus atributos necesarios según la información disponible y la lógica del negocio.

---

# 3. Definición de tipos de datos

Una vez establecidos los atributos definitivos, se definieron los tipos de datos correspondientes:

Ejemplos:

- Identificadores → INTEGER
- Nombres y textos → VARCHAR
- Fechas → DATE
- Valores monetarios → DECIMAL
- Estados o categorías → VARCHAR

Esta definición permitió preparar la estructura necesaria para la posterior creación de tablas en DuckDB.

---

# 4. Definición de relaciones

Después de establecer las entidades se definieron las relaciones entre ellas mediante claves primarias y claves foráneas.

Principales relaciones:

- Clientes realizan pedidos.
- Pedidos contienen líneas de pedido.
- Productos aparecen en líneas de pedido.
- Categorías agrupan productos.
- Empleados pueden tener el rol de vendedores.
- Vendedores gestionan pedidos.

---

# 5. Decisión sobre empleados y vendedores

Los archivos originales contenían empleados sin una relación clara dentro del modelo.

Se decidió crear una relación entre ambas entidades:

Empleados (1) ---- (0..1) Vendedores

Esto representa que un vendedor es un empleado con un rol comercial específico, pero no todos los empleados tienen esa función.

Además, los pedidos se relacionaron directamente con vendedores debido a que son los responsables del proceso de venta.

---

# Resultado final

El diagrama entidad-relación obtenido representa la estructura necesaria para crear la base de datos del proyecto Retail Analytics.

Este modelo será utilizado como referencia para la implementación posterior en DuckDB.
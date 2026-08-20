# Modelo Entidad Relación

## Entidades principales

### Clientes
Entidad encargada de almacenar la información de los clientes.

Clave primaria:
- cliente_id

---

### Productos
Entidad que contiene los productos disponibles.

Clave primaria:
- producto_id

Relación:
- Pertenece a una categoría.

---

### Categorías
Agrupa los productos del catálogo.

Relación:
- Una categoría puede tener muchos productos.

---

### Pedidos
Representa las órdenes realizadas por los clientes.

Relaciones:
- Pertenece a un cliente.

---

### Líneas de pedido
Entidad utilizada para resolver la relación muchos a muchos entre pedidos y productos.

Contiene:
- Producto vendido.
- Cantidad.
- Precio.

---

### Empleados
Contiene la información general del personal.

---

### Vendedores
Representa una funcion aparte es algo que no tiene relacion alguna con nada mas

Relación:
no hay
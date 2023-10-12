-- Crear la base de datos
CREATE DATABASE restaurante;

-- Utilizar la base de datos
USE restaurante;

-- Crear la tabla Restaurante
CREATE TABLE Restaurante (
    id_restaurante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    id_compra INT,
    id_venta INT
);

-- Crear la tabla Empleado
CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    domicilio VARCHAR(50),
    dni INT,
    telefono VARCHAR(15),
    especialidad VARCHAR(50),
    id_restaurante INT,
    FOREIGN KEY (id_restaurante) REFERENCES Restaurante(id_restaurante)
);

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    dni INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(15),
    domicilio VARCHAR(50),
    id_venta INT
);

-- Crear la tabla Producto
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio_unitario DECIMAL(10, 2),
    stock INT
);

-- Crear la tabla Venta
CREATE TABLE Venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    id_producto INT,
    id_cliente INT,
    fecha_venta DATE,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    cuit INT,
    nombre VARCHAR(50),
    domicilio VARCHAR(50),
    telefono VARCHAR(15)
);

-- Crear la tabla Compra
CREATE TABLE Compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    productos_comprados TEXT,
    valor_compra DECIMAL(10, 2),
    id_proveedor INT,
    fecha_compra DATE,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

-- Crear la tabla Inventario
CREATE TABLE Inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    id_compra INT,
    stock INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra)
);


-- Crear la tabla Promoción
CREATE TABLE Promocion (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    descuento DECIMAL(5, 2),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Agregar las tablas Restaurante, Reserva, Comentario, Mesa, Movimiento_Inventario, Menú y Transacción_Financiera aquí...

ALTER TABLE Cliente
ADD CONSTRAINT fk_cliente_venta
FOREIGN KEY (id_venta)
REFERENCES Venta(id_venta);

-- Establecer restricciones de clave foránea en las columnas id_compra y id_venta
ALTER TABLE Restaurante
ADD CONSTRAINT fk_restaurante_compra
FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
ADD CONSTRAINT fk_restaurante_venta
FOREIGN KEY (id_venta) REFERENCES Venta(id_venta);



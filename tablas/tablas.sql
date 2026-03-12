CREATE TABLE Categorias (
id_categoria INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Marcas (
id_marca INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Proveedores (
id_proveedor INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100),
telefono VARCHAR(20),
correo VARCHAR(100)
);

CREATE TABLE Productos (
id_producto INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100),
precio DECIMAL(10,2),
stock INT,
id_categoria INT,
id_marca INT,
id_proveedor INT,
FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca),
FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Clientes (
id_cliente INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100),
telefono VARCHAR(20),
correo VARCHAR(100)
);

CREATE TABLE Empleados (
id_empleado INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100),
puesto VARCHAR(100)
);

CREATE TABLE Ventas (
id_venta INT PRIMARY KEY IDENTITY(1,1),
fecha DATE,
id_cliente INT,
id_empleado INT,
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE DetalleVenta (
id_detalle INT PRIMARY KEY IDENTITY(1,1),
id_venta INT,
id_producto INT,
cantidad INT,
precio DECIMAL(10,2),
FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

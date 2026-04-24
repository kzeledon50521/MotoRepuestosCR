# MotoRepuestosCR
Sistema de gestión de catálogo de repuestos para motocicletas para MotoRepuestosCR.

## Descripción general del sistema

Aplicación de escritorio desarrollada en **C# (Windows Forms)** utilizando **Visual Studio**, conectada a una base de datos **Oracle**.
El sistema permite la gestión de entidades como **Productos y Clientes**, implementando operaciones CRUD mediante **procedimientos almacenados en PL/SQL**.

---

## Arquitectura

El sistema se estructura en componentes simples:

* **Capa de Presentación (WinForms)**
  Interfaces gráficas con controles como `DataGridView`, formularios dinámicos y eventos asociados a botones.

* **Capa de Acceso a Datos (DAL)**
  Encargada de la conexión a la base de datos mediante la clase `ConexionOracle`, utilizando `OracleConnection`.

* **Base de Datos (Oracle)**

  * Tablas relacionales (PRODUCTOS, CLIENTES, etc.)
  * Secuencias (`SEQ_*`) para generación de identificadores
  * Procedimientos almacenados (`SP_*`) para encapsular la lógica de negocio

---

## Tecnologías utilizadas

* Lenguaje: C# (.NET)
* Entorno de desarrollo: Visual Studio
* Base de datos: Oracle Database Express Edition (XE)
* Herramienta de administración: Oracle SQL Developer
* Librería de acceso a datos: Oracle.ManagedDataAccess (NuGet)

---

## Configuración de Oracle

### Instalación de Oracle Database XE

Se instala Oracle Database Express Edition, configurando:

* Usuario administrador: `SYSTEM`
* Puerto por defecto: `1521`
* Servicio: `XEPDB1`

---

### Instalación de Oracle SQL Developer

Se utiliza la versión que incluye JDK, por lo que no es necesario instalar Java adicionalmente.
La herramienta permite ejecutar scripts SQL, crear objetos y administrar la base de datos.

---

### Creación de conexión en SQL Developer

Parámetros de conexión:

```
Usuario: SYSTEM o MotoRepuestosCR
Contraseña: definida durante la instalación
Host: localhost
Puerto: 1521
Servicio: XEPDB1
```

---

### Configuración de usuario

Se asignaron permisos al esquema de trabajo para permitir operaciones de escritura:

```sql
ALTER USER MotoRepuestosCR QUOTA UNLIMITED ON USERS;
```

---

## Conexión desde la aplicación

La conexión se realiza mediante la librería `Oracle.ManagedDataAccess.Client`:

```csharp
OracleConnection cn = new OracleConnection("User Id=MotoRepuestosCR;Password=1234;Data Source=localhost:1521/XEPDB1;");
cn.Open();
```

---

## Acceso a datos

Las operaciones sobre la base de datos se ejecutan exclusivamente mediante procedimientos almacenados.

Ejemplos:

* SP_LISTAR_PRODUCTOS
* SP_INSERTAR_PRODUCTO
* SP_ACTUALIZAR_PRODUCTO
* SP_ELIMINAR_PRODUCTO

Ejemplo de ejecución desde C#:

```csharp
cmd.CommandType = CommandType.StoredProcedure;
cmd.Parameters.Add("p_resultado", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
```

---

## Interfaz de usuario

* Uso de `DataGridView` para la visualización de registros
* Formularios dinámicos para la captura de datos
* Botones para operaciones CRUD (Agregar, Editar, Eliminar)
* Controles `ComboBox` para selección de datos relacionados (categoría, marca, proveedor)

---

## Consideraciones

* Oracle no utiliza columnas autoincrementales tipo `IDENTITY`; se emplean **secuencias** para la generación de identificadores.
* La lógica de acceso a datos está centralizada en procedimientos almacenados.
* Es necesario especificar el esquema al invocar procedimientos desde la aplicación:

```csharp
"MOTOREPUESTOSCR.SP_LISTAR_PRODUCTOS"
```

---

## Ejecución del sistema

1. Iniciar el servicio de Oracle Database XE
2. Abrir Oracle SQL Developer
3. Ejecutar los scripts de creación de la base de datos (tablas, secuencias y procedimientos)
4. Ejecutar la aplicación desde Visual Studio

# WebDemo

**WebDemo** es un proyecto web de demostración que utiliza **Java EE (Jakarta EE)** y **JPA (Java Persistence API)** para implementar funcionalidades básicas de una aplicación web con un enfoque en la gestión de clientes, productos, pedidos, y autenticación. Este proyecto está diseñado para mostrar las mejores prácticas en el desarrollo de aplicaciones web basadas en Java.

## Características Principales

- **Gestión de Clientes:**
  - Registro de clientes con persistencia en base de datos.
  - Inicio de sesión seguro con autenticación básica.
  - Visualización y actualización de información de los clientes.

- **Gestión de Pedidos:**
  - Visualización de pedidos asociados a un cliente específico.
  - Detalle de los productos incluidos en cada pedido.

- **Gestión de Productos:**
  - Registro de nuevos productos.
  - Visualización de todos los productos disponibles.

- **Persistencia de Datos:**
  - Uso de **JPA** para interactuar con la base de datos.
  - Ejemplo práctico de operaciones CRUD en entidades como `Cliente`, `Pedido`, y `Producto`.

- **Diseño Responsivo:**
  - Interfaz de usuario estilizada con **Bootstrap** para una experiencia moderna y amigable.

## Tecnologías Utilizadas

- **Lenguaje:** Java EE (Jakarta EE)
- **Persistencia:** JPA (Java Persistence API)
- **Base de Datos:** Puede ser configurado para bases de datos como H2, MySQL, PostgreSQL, etc.
- **Vista:** JSP (Java Server Pages) con integración de Bootstrap para estilos.
- **Servidor:** Apache Tomcat o cualquier servidor de aplicaciones compatible con Java EE.
- **Manejo de Dependencias:** Configuración directa en el proyecto.

## Estructura del Proyecto

- **DAO (Data Access Object):**
  - Clases como `ClienteDAOJPAImpl`, `PedidoDAOJPAImpl`, y `ProductoDAOJPAImpl` que gestionan la interacción con la base de datos.

- **Modelo:**
  - Entidades como `Cliente`, `Producto`, y `Pedido` representan las tablas en la base de datos.

- **Vistas:**
  - Páginas JSP que ofrecen una interfaz de usuario para la gestión de clientes, productos y pedidos.

- **Servicios:**
  - `DBService` para gestionar la conexión con la base de datos y las transacciones.

## Configuración e Instalación

1. **Clonar el Repositorio:**
   ```bash
   git clone https://github.com/profedev/WebDemo.git
   ```
2. **Configurar la Base de Datos:**
   - Edita el archivo `persistence.xml` en la carpeta `META-INF` para ajustar la configuración de la base de datos.

3. **Compilar y Desplegar:**
   - Usa un IDE como IntelliJ IDEA o Eclipse para compilar el proyecto.
   - Despliega la aplicación en un servidor como Apache Tomcat.

4. **Acceder a la Aplicación:**
   - Una vez desplegado, accede a la aplicación desde tu navegador web:
     ```
     http://localhost:8080/WebDemo
     ```

## Licencia

Este proyecto está licenciado bajo la [MIT License](LICENSE).

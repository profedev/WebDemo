<%-- 
    Document   : ClienteLogin
    Created on : 2 dic 2024, 17:03:13
    Author     : faguirre
--%>

<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page import="java.util.List" %>
<%@ page import="com.profedev.DaoJPA.DAO.*"%>
<%@ page import="com.profedev.DaoJPA.Modelo.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
        // carga la base con datos de ejemplo
        ClienteDAOJPAImpl cliented = new ClienteDAOJPAImpl();
        PedidoDAOJPAImpl pedidod = new PedidoDAOJPAImpl();
        ProductoDAOJPAImpl productod = new ProductoDAOJPAImpl();
        
        DBService.beginTransaction();

        // Crear clientes
        Cliente cliente1 = new Cliente("Juan Perez","jperez@contoso.com","password1");
        Cliente cliente2 = new Cliente("Maria Lopez","mlopez@contoso.com","password2");
        cliented.agregarCliente(cliente1);
        cliented.agregarCliente(cliente2);             
            
        // Crear productos
        Producto producto1 = new Producto("Laptop", 1500.0);
        Producto producto2 = new Producto("Mouse", 25.0);
        Producto producto3 = new Producto("Cámara IP", 33.50);
        productod.agregarProducto(producto1);
        productod.agregarProducto(producto2);
        productod.agregarProducto(producto3);

        // Crear pedidos
        Pedido pedido1 = new Pedido(cliente1);
        pedido1.setProductos(List.of(producto1, producto2));
        pedidod.agregarPedido(pedido1);
        
        Pedido pedido2 = new Pedido(cliente2);
        pedido2.setProductos(List.of(producto3));
        pedidod.agregarPedido(pedido2);

        DBService.commitTransaction();
    %>

<%
    ClienteDAOJPAImpl cd = new ClienteDAOJPAImpl();      
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String errorMessage = "";

    if (email != null && password != null) {       
        
        boolean autenticado = cd.autenticarUsuario(email, password);
        
        if (autenticado) {
            Cliente cliente = cd.obtenerClienteByEmail(email);
            session = request.getSession();
            session.setAttribute("cliente", cliente);
            response.sendRedirect("PedidosCliente.jsp");
        } else {
            errorMessage = "Credenciales inválidas. Inténtalo de nuevo.";
        }
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login del Cliente</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

    <!-- Contenedor principal del formulario -->
    <div class="card shadow p-4" style="width: 22rem;">
        <!-- Título -->
        <h2 class="text-center text-primary mb-4">Inicio de Sesión</h2>
        
        <!-- Formulario de inicio de sesión -->
        <form action="ClienteLogin.jsp" method="post">
            <!-- Campo para el correo electrónico -->
            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico:</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="ejemplo@correo.com" required>
            </div>
            
            <!-- Campo para la contraseña -->
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña:</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Contraseña" required>
            </div>
            
            <!-- Botón de envío -->
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
            </div>
        </form>

        <!-- Mensaje de error (si existe) -->
        <div class="mt-3 text-center">
            <p class="text-danger"><%= errorMessage %></p>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoBKP47kLgi2F/Ujozjw7B8bxO5UwEi0vF0CG7E0F0pwpw2" crossorigin="anonymous"></script>
</body>
</html>






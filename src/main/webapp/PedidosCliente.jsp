<%-- 
    Document   : PedidosCliente
    Created on : 2 dic 2024, 17:46:36
    Author     : faguirre
--%>
<%@ page import="java.util.List" %>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page import="java.util.List" %>
<%@ page import="com.profedev.DaoJPA.DAO.*"%>
<%@ page import="com.profedev.DaoJPA.Modelo.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("cliente") == null) {
        response.sendRedirect("ClienteLogin.jsp");
        return;
    }

    Cliente cliente = (Cliente) session.getAttribute("cliente");   
    
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedidos del Cliente</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">

    <!-- Contenedor principal -->
    <div class="container my-5">
        <!-- Título de bienvenida -->
        <div class="row">
            <div class="col text-center">
                <h2 class="text-primary">Bienvenido, <%= cliente.getNombre() %>!</h2>
                <p class="text-muted">Aquí están los detalles de sus pedidos.</p>
            </div>
        </div>

        <!-- Tabla de pedidos -->
        <div class="row">
            <div class="col">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>ID del Pedido</th>
                            <th>Producto</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Verifica si el cliente tiene pedidos
                            if (cliente.getPedidos() != null) {
                                for (Pedido pedido : cliente.getPedidos()) {
                                    for (Producto p : pedido.getProductos()) {
                        %>
                                        <tr>
                                            <td><%= pedido.getId() %></td>
                                            <td><%= p.getNombre() %></td>
                                            <td>$<%= p.getPrecio() %></td>
                                        </tr>
                        <%
                                    }
                                }
                            } else {
                        %>
                                <tr>
                                    <td colspan="3" class="text-center text-danger">No hay pedidos para mostrar.</td>
                                </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-4">
        <p class="mb-0">© 2024 Pedidos del Cliente. Todos los derechos reservados.</p>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoBKP47kLgi2F/Ujozjw7B8bxO5UwEi0vF0CG7E0F0pwpw2" crossorigin="



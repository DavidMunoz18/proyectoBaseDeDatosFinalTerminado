<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="mipk.beanDB" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tabla de Productos</title>

<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="David Muñoz">
	<meta name="description" content="Boutique alta costura">
	<title>DMPM-ProyectoBootstrap</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link href="custom.css" rel="stylesheet">



<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
    form {
        margin-bottom: 20px;
    }
    form input[type="text"] {
        padding: 8px;
        width: 200px;
    }
    form input[type="submit"] {
        padding: 8px 15px;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
</style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark p-3 bg-primary fixed-top">
        <div class="container-fluid">
            <div class="logoa">
                <a href="index.jsp"><img src="imagenes/logotipo-removebg-preview (1).png"></a>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <button id="boton-cambiar-tema" class="btn btn-light">Cambiar Modo</button> 
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-white " href="inicioSesion.jsp">Inicio de sesión</a></li>
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-white" data-bs-toggle="dropdown"
                            href="armario.jsp" role="button" aria-expanded="false">Ropa</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item " href="armario.jsp">Inicio</a></li>
                            <li><a class="dropdown-item " href="armario.jsp">Medio</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link text-white" href="admin.jsp">Panel administrador</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="ubicacion.jsp">Ubicaciones</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="formularioContacto.jsp">Incidentes</a></li>
                    <li class="nav-item"><a class="nav-link text-white bi-cart" href="carrito.jsp "></a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<br><br><br><br><br><br><br>






    <h2>Añadir productos</h2>
    <form method="post" id="productoFormulario">
    	
        <label for="nombreP">Nombre del producto:</label>
        <input type="text" id="nombreP" name="nombreP" required>
        <br>
        <label for="cantidad">Cantidad del producto:</label>
        <input type="text" id="cantidad" name="cantidad" required>
        <br>
        <label for="precio">Precio del producto:</label>
        <input type="text" id="precio" name="precio" required>
        
        <input type="submit" value="Agregar Producto">
    </form>
    <%
        
        if ( request.getParameter("nombreP") != null && request.getParameter("cantidad") != null && request.getParameter("precio") != null) {
            
            String nombreCompras = request.getParameter("nombreP");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            double precioUnitario = Double.parseDouble(request.getParameter("precio"));
            double precioTotal = cantidad * precioUnitario;
            
            
            beanDB db = new beanDB();
            db.conectarBD();
            
            String query = "INSERT INTO Productos ( nombre, cantidad , PVP ) VALUES ('"+ nombreCompras + "', '"+ cantidad + "', '"+ precioTotal +"')";
            
            
            db.insert(query);
            
            
            db.desconectarBD();
            
            
            out.println("Producto agregado.");
        }
    %>
   
   
   
   
    
    <h2>Eliminar productos</h2>
    <form method="post" id="productoFormulario">
    	<label for="idu">id del producto</label>
        <input type="text" id="idu" name="idu" required>
        
        
        <input type="submit" value = "Eliminar Producto">
    </form>
    <%
        
        if (request.getParameter("idu") != null) {
            String idu = request.getParameter("idu");
            
            beanDB dbBorrar = new beanDB();
            dbBorrar.conectarBD();
            
            String queryAEliminar = "DELETE FROM Productos WHERE id_producto = '"+ idu +"'";
            
            
            dbBorrar.delete(queryAEliminar);
            
           
            dbBorrar.desconectarBD();
            
            
            out.println("Producto eliminado.");
        }
    %>
    
    
    
   <%
    beanDB dbMostrar = new beanDB();
    
    dbMostrar.conectarBD();
    
    String queryMostrar = "SELECT * FROM Productos";
    
    String[][] resultado = dbMostrar.resConsultaSelectA3(queryMostrar);
    
    %>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Cantidad</th>
        </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < resultado.length; i++) { %>
            <tr>
                <% for (int j = 0; j < resultado[i].length; j++) { %>
                    <td><%= resultado[i][j] %></td>
                <% } %>
            </tr>
        <% } %>
    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   <script src="java.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="mipk.beanDB" %>
    
<!DOCTYPE html>

<head>
  <meta charset="UTF-8">
	
	<meta name="author" content="David Muñoz">
	<meta name="description" content="Boutique de alta costura">
	<title>DMPM-ProyectoBootstrap</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link href="custom.css" rel="stylesheet">
  
</head>


<body class="inicioS">





<div class=" login-container">
	<form method="post" class="form-login" onsubmit="return validar()">
		<ul class="login-nav">
			<li class="login-nav__item active">
				<a href="#">Registrarse</a>
			</li>
			<li class="login-nav__item">
				<a href="inicioSesion.jsp">Iniciar Sesión</a>
			</li>
		</ul>
		<label for="login-input-user" class="login__label">
			Establece el usuario
		</label>
		<input class="login__input" type="text"  name="usuario"/>
		<label for="login-input-password" class="login__label">
			Establece la contraseña
		</label>
		<input id="uno" class="login__input" type="password" name="contrasenia" />
		<label for="login-input-password" class="login__label">
			Repetir contraseña
		</label>
		<input id="dos" class="login__input" type="password" />
		<label for="login-sign-up" class="login__label--checkbox">
			<input id="sip" type="checkbox" class="login__input--checkbox" required />
			Aceptar terminos
		</label>
		<br><br>
		<button  class="login__submit text-white bg-primary "  >Registrarse </button>
	</form>
	
</div>

<%
 
  String usuario = request.getParameter("usuario");
  String contrasenia = request.getParameter("contrasenia");

  if (usuario != null && contrasenia != null) {
    beanDB db = new beanDB();  
    try {
      db.conectarBD();  
      
    
      String insertar = "INSERT INTO Usuarios (usuarios, contrasenia) VALUES ('"+ usuario +"',AES_ENCRYPT('"+ contrasenia + "', '$2b$12$' ))";

      
      db.insert(insertar);

     System.out.println("Usuario registrado exitosamente!");
    } catch (Exception e) {
      out.println("Error al registrar usuario: " + e.getMessage());
    } finally  {
      db.desconectarBD();  
    }
  } else {
    System.out.println("Faltan datos para el registro.");
  }
%>

<script src="java.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
  
</body>
</html>

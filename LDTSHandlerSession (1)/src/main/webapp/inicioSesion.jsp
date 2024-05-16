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
	<form method="post" class="form-login" action="./LoginAuthenticator">
		<ul class="login-nav">
			<li class="login-nav__item active">
				<a href="#">Iniciar Sesión</a>
			</li>
			<li class="login-nav__item">
				<a href="registrarse.jsp">Registrarse</a>
			</li>
		</ul>
		<label for="login-input-user" class="login__label">
			Usuario
		</label>
		<input id="usuario" name="usuario" class="login__input" type="text" required/>
		<label for="login-input-password" class="login__label">
			Contraseña
		</label>
		<input id="constrasenia" name="contrasenia" class="login__input" type="password" required />
		<label for="login-sign-up" class="login__label--checkbox">
			<input id="login-sign-up" type="checkbox" class="login__input--checkbox" />
			Mantener sesión iniciada
		</label>
		<button class="login__submit text-white bg-primary"  >Iniciar Sesión </button>
	</form>
	<a href="#" class="login__forgot">¿Olvidaste tu contraseña?</a>
</div>

   

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
  
</body>
</html>

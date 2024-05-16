function validar() {

	if (document.getElementById("uno").value != document.getElementById("dos").value) {
		alert("no coinciden las contraseñas")
		document.getElementById("dos").focus() /*en esto conseguimos que el cursor esté sobre el campo */
		return false
	}
	else
		alert("Se ha registrado correctamente")
	return true

}








function cerrar() {

	alert("Se ha cerrado la sesion");
}
function numero() {
	//Obtengo el valor de cada input del formulario a partir de los id.
	const cvv = document.getElementById("CV").value;
	const fechaInput = document.getElementById("fcha").value;
	const fechaActual = new Date();
	const numeroTarjeta = document.getElementById("tarjeta").value;
	const nombreTitutlar = document.getElementById("nombreUsu").value;


	//Aqui se comprueba si es un numero o no.
	if (isNaN(cvv)) {
		alert("CVV debe ser un número.");
		return false;
		//Se comprueba si contiene un numero o no.
	} else if (/\d/.test(nombreTitutlar)) {
		alert("El nombre del titular no puede contener números");
		return false;
		//Se comprueba la longitud del numero de la tarjeta.
	} else if (numeroTarjeta.length !== 16) {
		alert("El numero de la tarjeta debe tener 16 digitos");
		return false;
	}
	//Se comprueba la longitud del cvv.
	else if (cvv.length !== 3) {
		alert("CVV debe tener 3 dígitos.");
		return false;
		//Se comprueba si la fecha es anterior a la actual
	} else if (new Date(fechaInput) <= fechaActual) {
		alert("La fecha de vencimiento debe ser posterior a la actual.");
		return false;
		//Se comprueba si el numero de la tarjeta contiene numeros o no
	} else if (isNaN(numeroTarjeta)) {
		alert("El numero de la tarjeta no puede contener letras");
		return false;
	}
	// Si todo esta correcto entraria en este caso y dejaria enviar el formulario con el return true.
	else {
		alert("Datos ingresados correctamente.");
		reiniciar();
		return true;
	}
}


//Modo oscuro
document.addEventListener('DOMContentLoaded', () => {
    const botonCambiarTema = document.getElementById('boton-cambiar-tema');

    botonCambiarTema.addEventListener('click', () => {
        document.body.classList.toggle('modo-oscuro');
    });
});





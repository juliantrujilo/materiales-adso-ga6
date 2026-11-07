/* ============================================================
   main.js · Comportamiento de TechStore Pro
   Cada bloque hace UNA cosa. Si la página no tiene los elementos
   que el bloque busca, simplemente no hace nada.
   ============================================================ */

// Espera a que la página termine de cargar
document.addEventListener('DOMContentLoaded', function () {
  activarMenu();
  activarCarrito();
  validarLogin();
  validarContacto();
});

/* ---------- 1. Menú hamburguesa (móvil) ---------- */
function activarMenu() {
  const boton = document.getElementById('menuToggle');
  const menu = document.getElementById('menuPrincipal');

  if (boton && menu) {
    boton.addEventListener('click', function () {
      menu.classList.toggle('abierto');   // agrega o quita la clase
    });
  }
}

/* ---------- 2. Contador del carrito ---------- */
function activarCarrito() {
  const contador = document.getElementById('contadorCarrito');
  const botones = document.querySelectorAll('[data-agregar]');
  let cantidad = 0;

  botones.forEach(function (boton) {
    boton.addEventListener('click', function () {
      cantidad++;
      contador.textContent = cantidad;
    });
  });
}

/* ---------- 3. Ayudas para los formularios ---------- */
const patronCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

function mostrarError(idCampo, mensaje) {
  document.getElementById(idCampo).textContent = mensaje;
}

function mostrarMensaje(texto, tipo) {
  const caja = document.getElementById('mensajeFormulario');
  caja.textContent = texto;
  caja.className = 'mensaje-formulario ' + tipo;
}

/* ---------- 4. Validación del login ---------- */
function validarLogin() {
  const formulario = document.getElementById('formLogin');
  if (!formulario) return;

  formulario.addEventListener('submit', function (evento) {
    evento.preventDefault();            // evita que la página se recargue
    let valido = true;

    if (!patronCorreo.test(formulario.correo.value.trim())) {
      mostrarError('errorCorreo', 'Escribe un correo válido, por ejemplo nombre@correo.com');
      valido = false;
    } else {
      mostrarError('errorCorreo', '');
    }

    if (formulario.clave.value.length < 6) {
      mostrarError('errorClave', 'La contraseña debe tener mínimo 6 caracteres.');
      valido = false;
    } else {
      mostrarError('errorClave', '');
    }

    if (valido) {
      mostrarMensaje('Datos correctos. Más adelante este formulario se conectará al servidor.', 'ok');
    } else {
      mostrarMensaje('Revisa los campos marcados.', 'error');
    }
  });
}

/* ---------- 5. Validación del formulario de contacto ---------- */
function validarContacto() {
  const formulario = document.getElementById('formContacto');
  if (!formulario) return;

  formulario.addEventListener('submit', function (evento) {
    evento.preventDefault();
    let valido = true;

    if (formulario.nombre.value.trim().length < 3) {
      mostrarError('errorNombre', 'Escribe tu nombre (mínimo 3 letras).');
      valido = false;
    } else {
      mostrarError('errorNombre', '');
    }

    if (!patronCorreo.test(formulario.correo.value.trim())) {
      mostrarError('errorCorreo', 'Escribe un correo válido, por ejemplo nombre@correo.com');
      valido = false;
    } else {
      mostrarError('errorCorreo', '');
    }

    if (formulario.mensaje.value.trim().length < 10) {
      mostrarError('errorMensaje', 'El mensaje debe tener mínimo 10 caracteres.');
      valido = false;
    } else {
      mostrarError('errorMensaje', '');
    }

    if (valido) {
      mostrarMensaje('Gracias por escribirnos. Te responderemos pronto.', 'ok');
      formulario.reset();
    } else {
      mostrarMensaje('Revisa los campos marcados.', 'error');
    }
  });
}

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${producto.nombre}</title>
<link rel="stylesheet" href="/CSS/dashboard.css">
<link rel="stylesheet" href="/CSS/producto.css">
</head>
<body>
	<header>
        <nav>
            <div class="header">
                <c:choose>
                    <c:when test="${usuarioEnSesion != null}">
                        <p><c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">[ADMIN] </c:if>Bienvenid@, ${usuarioEnSesion.nombre}</p>
                        <a href="/logout" class="logout-button">Cerrar Sesion</a>
                        <!-- Agrega enlaces para administradores -->
                        <c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">
                            <a href="/misproductos" class="dashboard-link">Ver Mis Productos</a>
                            <a href="/subirproductos" class="dashboard-link">Subir Nuevos Productos</a>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <a href="/registrarse" class="inicioregistro">Registrarse</a><p>|</p><a href="/login" class="inicioregistro">Iniciar Sesion</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </header>
    
     <div class="columns">
        <nav class="main-nav">
            <ul>
            	<li><a href="/"><img src="/img/cropped-IMG_2592.png" alt="Tu Logo" class="logonegro"></a></li>
                <li><a href="/tratamientos">Tratamientos</a></li>
                <li><a href="/productos">Productos</a></li>
                <li><a href="/nosotros">Nosotros</a></li>      
            </ul>
        </nav>
        
        <form action="/busqueda" method="get">
		    <div class="search-bar">
		        <input type="text" placeholder="Buscar productos..." name="nombre">
		        <input type="submit" value="Buscar">
		    </div>
		</form>
        
        <div class="cart">
            <a href="/carrito"><img src="/img/carrito.png" alt="Carrito de compras"></a>
            <span>${not empty carrito ? carrito.size() : 0}</span>
        </div>
    </div>
    
    <div class="product-details">
        <div class="product-image">
            <img src="/img/${producto.imagen}" alt="${producto.nombre}">
        </div>
        <div class="product-info">
            <h1>${producto.nombre}</h1>
            <p>${producto.descripcion}</p>
            <p>Precio: $${producto.precio} CLP</p>
            <p>Disponibilidad: ${producto.stock} en stock</p>
            <!-- Otras caracter�sticas del producto -->
            <div class="product-actions">
                <!-- Bot�n para comprar -->
                <form action="/checkout/${producto.id}" method="post">
    <!-- Agrega otros campos del formulario si los necesitas -->
    				<button type="submit" class="buy-button">Comprar Ahora</button>
				</form>
                <!-- Bot�n para agregar al carrito -->
                <a href="/agregarcarrito/${producto.id}" class="cart-button">Agregar al Carrito</a>
            </div>
        </div>
    </div>
    
    <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="img/logoblanco.png" alt="Tu Logo" class="logo"></a>
            </div>
            <div class="footer-column">
                <ul>
                    <li>Macroderma estetica - All rights reserved.</li>
                    <li><img src="https://auroraestetica.cl/wp-content/uploads/2023/01/pagos.png"></li>
                    <li><img src="https://auroraestetica.cl/wp-content/uploads/2023/01/SEREMISALUDMET.png"></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Paginas Legales</h4>
                <ul>
                    <li><a href="/PyP">Politica de Privacidad</a></li>
                    <li><a href="/condiciones">Condiciones de uso</a></li>
                    <li><a href="/aviso">Aviso Legal</a></li>
                </ul>
            </div>
        </div>


		<div class="social-section">
    		<div class="social-button-container">
				<a href="https://www.instagram.com/macroderma/" target="_blank"><img src="/img/instagram.png" alt="Instagram"></a>
    		</div>
    		<div class="social-button-container">
        		<a href="https://wa.me/+56933876798" target="_blank"><img src="/img/wtsp.png" alt="WhatsApp"></a>
    		</div>
		</div>

    </footer>
</body>
</html>
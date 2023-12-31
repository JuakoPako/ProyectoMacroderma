<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Macroderma</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@1,500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@200&display=swap" rel="stylesheet">
    
    
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
                        <a href="/registrarse" class="inicioregistro">Registrarse</a><p>|</p><a href="/login" class="inicioregistro">Iniciar Sesi�n</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </header>

    <div class="columns">
        <nav class="main-nav">
            <ul>
                <li><a href="/"><img src="img/cropped-IMG_2592.png" alt="Tu Logo" class="logonegro"></a></li>
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
    <section class="hero">
        <div class="hero-content">
            <h1>Bienvenido a Macroderma</h1>
            <h2>Donde la belleza se encuentra con la excelencia<h2>
            <p>Descubre nuestra amplia gama de productos y servicios para lucir radiante y saludable todos los d�as.</p>
            <a href="/productos" class="cta-button" style="font-family: 'Raleway', sans-serif: inherit; text-shadow: none; color: #000;">Explora nuestros productos</a>
        </div>
    </section>
    <section class="feature-section">
        <div class="feature-image">
            <img src="/img/uno.png" alt="Imagen de Destacado">
        </div>

	        <div class="feature-content">
	            <h2>Descubre Nuestros Servicios de Cuidado de la Piel</h2>
	            <p>Descubre nuestra amplia gama de productos y servicios para lucir radiante y saludable todos los d�as. Nuestros expertos en cuidado de la piel est�n aqu� para ayudarte a encontrar los mejores tratamientos para tus necesidades.</p>
	            <a href="/tratamientos" class="cta-button">Ver tratamientos</a>
	        </div>
    </section>
    <section class="gallery-section">
        <h2>Galer�a de Imagenes</h2>
        <div class="image-gallery">
            <img src="/img/labios.png" alt="Tratamiento de aumento de labios con ácido hialurónico">
            <img src="/img/armonizacion.png" alt="Tratamiento de armonización facial con ácido hialurónico">
            <img src="/img/botox.png" alt="Tratamiento con toxina botulínica en frente">
            <img src="/img/criolipolisis.png" alt="Tratamiento criolipólisis">
            <img src="/img/labios2.png" alt="Tratamiento de aumento de labios con ácido hialurónico">
            <img src="/img/nariz.png" alt="Tratamiento de rinomodelación con ácido hialurónico">
            <img src="/img/depilacion.png" alt="Tratamiento de depilación, torso de hombre">
        </div>
    </section>
    
    
    <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="img/logoblanco.png" alt="Tu Logo" class="logo"></a>
            </div>
            <div class="footer-column">
                <ul>                  
                    <li><img src="/img/seremi.png" alt="Imagen Seremi" width="90%"></li>
                    <li><img src="/img/pagos.png" alt="Imagen pagos" width="90%"></li>
                	<li>Macroderma Clinic � 2023</li> 
                	<li>All rights reserved</li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>P�ginas Legales</h4>
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
<%-- 
    Document   : Contacto
    Created on : 19/11/2019, 04:47:56 PM
    Author     : fabri
--%>

<%@page import="Modelo.dao.PedidoDAO"%>
<%@page import="Modelo.bean.Usuario"%>
<%@page import="Modelo.dao.CategoriaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.bean.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%
            ArrayList<Categoria> listadoCategorias = CategoriaDAO.listarProducto();
        %>
        <title>Kathiplass</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body class="goto-here">
        <div class="py-1 bg-primary">
            <div class="container" style="background-color: #F08080;">
                <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
                    <div class="col-lg-12 d-block">
                        <div class="row d-flex">
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                                <span class="text">+51 999 999 999</span>
                            </div>
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                                <span class="text">contactos@kathiplass.com</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Kathiplass</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="index.jsp" class="nav-link">Inicio</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link"></a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="todosProductos" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Productos</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown04">
                                <%for (Categoria item : listadoCategorias) {%>
                                <a class="dropdown-item" href="categoria?id=<%=item.getIdCategoria()%>"><%=item.getNameCategoria()%></a>
                                <%}%>
                            </div>
                        </li>
                        <li class="nav-item"><a href="nosotros" class="nav-link">Nosotros</a></li>
                        <li class="nav-item"><a href="contacto" class="nav-link">Contáctanos</a></li>
                        <%
                                //para cerrar o invalidar sesión
                                //request.getSession().invalidate();
                                
                                
                                Usuario user = (Usuario) request.getSession().getAttribute("usuario");
                        %>
                        <%if(user==null){%>
                        <li class="nav-item"><a href="login" class="nav-link"><img src="images/avatar.png" width="18"></a></li>
                        <li class="nav-item cta cta-colored"><a href="carroCompras" class="nav-link"><span class="icon-shopping_cart"></span>[<spam id="counter"><spam>0</spam></spam>]</a></li>
                        <%}else{%>
                        <li class="nav-item"><a href="#" class="nav-link"><%=user.getNomb_usuario()%></a></li>
                        <li class="nav-item cta cta-colored"><a href="carroCompras" class="nav-link"><span class="icon-shopping_cart"></span>[<spam id="counter"><spam><%=PedidoDAO.cantidadPedido(user.getId_usuario())%></spam></spam>]</a></li>
                        <%}%>
                        
                    </ul>
                </div>
            </div>
        </nav>

        <div class="hero-bread" style="background-color: white ;padding: 0.1px">
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                        <h2 class="mb-4" style="font-size: 60px">Contáctanos</h2>
                    </div>
                </div>  
            </div>
        </div>

        <section class="ftco-section contact-section bg-light">
            <div class="container">
                <div class="row d-flex mb-5 contact-info">
                    <div class="w-100"></div>
                    <div class="col-md-3 d-flex">
                        <div class="info bg-white p-4">
                            <p><span>Dirección:</span> Mercado Plaza Villa Sur, puesto A-29. Villa el Salvador</p>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="info bg-white p-4">
                            <p><span>Teléfono:</span> <a href="tel://+51 999 999 999">+51 999 999 999</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="info bg-white p-4">
                            <p><span>Correo:</span> <a href="mailto:contactos@kathiplass.com">contactos@kathiplass.com</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="info bg-white p-4">
                            <p><span>Sitio web:</span> <a href="#">kathiplass.com</a></p>
                        </div>
                    </div>          
                </div>
            </div>
            <div class="col-md-6 d-flex" style="margin:auto">
                <div>
                    <h2 class="mb-4" style="text-align: center; font-weight: bold">Ubicación</h2>
                    <div style="margin: auto">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3899.5268535545656!2d-76.93586813810323!3d-12.212564423685597!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x18c3402ddaa33145!2sPlaza%20Villa%20Sur!5e0!3m2!1ses-419!2spe!4v1574200652966!5m2!1ses-419!2spe" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                    </div>               
                </div>
            </div>
        </section>
        <section>
            <div style="width: 100%">

            </div>
        </section>
        <footer class="ftco-footer ftco-section">
            <div class="container">
                <div class="row">
                    <div class="mouse">
                        <a href="#" class="mouse-icon">
                            <div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
                        </a>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Kathiplass</h2>
                            <p>Venta de productos de calidad y a un buen precio.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Menú</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">Nosotros</a></li>
                                <li><a href="#" class="py-2 d-block">Contáctanos</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">¿Alguna consulta?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">Mercado Plaza Villa Sur, puesto A-29. Villa el Salvador</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+51 999 999 999</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">contactos@kathiplass.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p>
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> Todos los derechos reservados | Página web hecha por </i><a href="#" target="_blank" style="color: #F08080;">ANFAVA</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
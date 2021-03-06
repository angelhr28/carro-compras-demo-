<%-- 
    Document   : index
    Created on : 19/11/2019, 03:00:45 PM
    Author     : fabri
--%>

<%@page import="Modelo.dao.PedidoDAO"%>
<%@page import="Modelo.bean.Usuario"%>
<%@page import="Modelo.bean.Producto"%>
<%@page import="Modelo.dao.ProductoDAO"%>
<%@page import="Modelo.dao.CategoriaDAO"%>
<%@page import="Modelo.bean.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%
            ArrayList<Categoria> listadoCategorias = CategoriaDAO.listarProducto();
            ArrayList<Producto> listadoProductos = ProductoDAO.listarProducto();
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

        <section id="home-section" class="hero">
            <div class="home-slider owl-carousel">
                <div class="slider-item" style="background-image: url(images/img1.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                            <div class="col-md-12 ftco-animate text-center">
                                <h1 class="mb-2">Productos 100% frescos &amp; de calidad</h1>
                            </div>

                        </div>
                    </div>
                </div>

        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row no-gutters ftco-services">
                    <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services mb-md-0 mb-4">
                            <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
                                <span class="flaticon-shipped"></span>
                            </div>
                            <div class="media-body">
                                <h3 class="heading">Envío Gratuito</h3>
                                <span>Compras mayores a S/100</span>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services mb-md-0 mb-4">
                            <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
                                <span class="flaticon-diet"></span>
                            </div>
                            <div class="media-body">
                                <h3 class="heading">Siempre frescos</h3>
                                <span>Productos bien empaquetados</span>
                            </div>
                        </div>    
                    </div>
                    <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services mb-md-0 mb-4">
                            <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
                                <span class="flaticon-award"></span>
                            </div>
                            <div class="media-body">
                                <h3 class="heading">Calidad Superior</h3>
                                <span>Productos de alta calidad</span>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services mb-md-0 mb-4">
                            <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
                                <span class="flaticon-customer-service"></span>
                            </div>
                            <div class="media-body">
                                <h3 class="heading">Atención al cliente</h3>
                                <span>Atención 24/7</span>
                            </div>
                        </div>      
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                        <h2 class="mb-4">Nuestros productos</h2>
                        <a href="todosProductos" class="btn btn-primary">Ver todos</a>
                    </div>
                </div>   		
            </div>
            <div class="container">
                <div class="row">
                    <%for(int i=0;i<4;i++){%>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="product">
                            <a href="producto?idProducto=<%=listadoProductos.get(i).getId_producto()%>" class="img-prod"><img class="img-fluid" src="<%=listadoProductos.get(i).getImg_producto()%>" alt="Colorlib Template">
                                <div class="overlay"></div>
                            </a>
                            <div class="text py-3 pb-4 px-3 text-center">
                                <h3><a href="producto?idProducto=<%=listadoProductos.get(i).getId_producto()%>"><%=listadoProductos.get(i).getNomb_producto()%></a></h3>
                                <p><%=listadoProductos.get(i).getCarac_producto()%></p>
                                <div class="d-flex">
                                    <div class="pricing">
                                        <p class="price"><span>S/<%=listadoProductos.get(i).getPrecio_producto()%></span></p>
                                    </div>
                                </div>
                                <div class="bottom-area d-flex px-3">
                                    <div class="m-auto d-flex">
                                        <a href="producto?idProducto=<%=listadoProductos.get(i).getId_producto()%>" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                            <span><i class="ion-ios-menu"></i></span>
                                        </a>
                                        <a href="controlador?idProducto=<%=listadoProductos.get(i).getId_producto()%>&cantidad=1" class="buy-now d-flex justify-content-center align-items-center mx-1" >
                                            <span><i class="ion-ios-cart"></i></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
        </section>
        <section class="ftco-section ftco-category ftco-no-pt">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-6 order-md-last align-items-stretch d-flex">
                                <div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(images/logo2.png); background-size: auto; margin-top: 20px;">
                                    <div class="text text-center" style="margin-bottom: 400px;">
                                        <h2>Categorías</h2>
                                        <p>Nuestros productos se encuentran en estas categorías</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">

                                <%for (int i = 0; i < listadoCategorias.size() / 2; i++) {%>
                                <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/<%=listadoCategorias.get(i).getFotoCategoria()%>);">
                                    <div class="text px-3 py-1">
                                        <h2 class="mb-0"><a href="categoria?id=<%=listadoCategorias.get(i).getIdCategoria()%>"><%=listadoCategorias.get(i).getNameCategoria()%></a></h2>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <%for (int i =listadoCategorias.size() / 2 ; i < listadoCategorias.size(); i++) {%>
                        <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/<%=listadoCategorias.get(i).getFotoCategoria()%>);">
                            <div class="text px-3 py-1">
                                <h2 class="mb-0"><a href="categoria?id=<%=listadoCategorias.get(i).getIdCategoria()%>"><%=listadoCategorias.get(i).getNameCategoria()%></a></h2>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section img">
            <div class="container">
                <div class="row justify-content-end">
                    <img src="<%=listadoProductos.get(40).getImg_producto()%>" style="width: 50%; float: left; ">
                    <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
                        <span class="subheading">Los mejores precios para ti</span>
                        <h2 class="mb-4">Producto del Día</h2>
                        <h3><a href="#"><%=listadoProductos.get(40).getNomb_producto()%></a></h3>
                        <span class="price">De S/27.00 <a href="#" style="color: #8B4513;">a tan solo S/<%=listadoProductos.get(40).getPrecio_producto()%></a></span>
                        <div id="timer" class="d-flex mt-5">
                            <div class="time" id="days"></div>
                            <div class="time pl-3" id="hours"></div>
                            <div class="time pl-3" id="minutes"></div>
                            <div class="time pl-3" id="seconds"></div>
                        </div>
                    </div>
                </div>   		
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
        <script src="js/main.js"></script>
        <script src="js/main2.js"></script>
        <script>
            $(document).ready(function(){
                $('.buy-now').click(function(){
                    var url = $(this).attr('href');
                    var idProducto = getURLParameter(url,'idProducto');
                    var cantidadProducto = getURLParameter(url,'cantidad');
                    $.ajax({
                        url:'controlador',
                        data:{
                            idProducto : idProducto,
                            cantidadProducto : cantidadProducto
                        },
                        type: 'POST',
                        success: function (response, textStatus, jqXHR) {
                            if(response==1){
                                window.location.href = 'login'
                            }else if(response==2){
                                window.location.href = 'carroCompras'
                            }else{
                                $('#counter').html(response);
                            }
                                
                            
                                
                        }
                    })
                    return false;
                })
                function getURLParameter(url, name) {
                    return (RegExp(name + '=' + '(.+?)(&|$)').exec(url)||[,null])[1];
                }
            })
        </script>
        <!--<script src="https://account.snatchbot.me/script.js"></script><script>window.sntchChat.Init(75396)</script>-->
    </body>
</html>
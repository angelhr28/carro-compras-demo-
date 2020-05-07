<%-- 
    Document   : caja
    Created on : 23/11/2019, 05:21:46 PM
    Author     : fabri
--%>

<%@page import="Modelo.dao.PedidoDAO"%>
<%@page import="Modelo.dao.CategoriaDAO"%>
<%@page import="Modelo.bean.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%
            ArrayList<Categoria> listadoCategorias = CategoriaDAO.listarProducto();
            String precioTotal = (String) request.getAttribute("preciototal");
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
                            <%if (user == null) {%>
                        <li class="nav-item"><a href="login" class="nav-link"><img src="images/avatar.png" width="18"></a></li>
                        <li class="nav-item cta cta-colored"><a href="carroCompras" class="nav-link"><span class="icon-shopping_cart"></span>[<spam id="counter"><spam>0</spam></spam>]</a></li>
                                        <%} else {%>
                        <li class="nav-item"><a href="#" class="nav-link"><%=user.getNomb_usuario()%></a></li>
                        <li class="nav-item cta cta-colored"><a href="carroCompras" class="nav-link"><span class="icon-shopping_cart"></span>[<spam id="counter"><spam><%=PedidoDAO.cantidadPedido(user.getId_usuario())%></spam></spam>]</a></li>
                                        <%}%>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="hero-wrap hero-bread" style="background-image: url(images/img1.jpg); height: 100px;">
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                        <h2 class="mb-4" style="color: white">Caja</h2>
                    </div>
                </div>   		
            </div>
        </div>

        <section class="ftco-section">
            <div class="container">
                <form action="pasarela" class="billing-form" type="post">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 ftco-animate">
                            <h3 class="mb-4 billing-heading">Detalles de Pago</h3>
                                <div class="row align-items-end">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input type="text" class="form-control" placeholder="" name="nombre">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="lastname">Apellidos</label>
                                            <input type="text" class="form-control" placeholder="" name="apellido">
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="firstname">Teléfono Celular</label>
                                            <input type="text" class="form-control" placeholder="" name="telefono1">
                                        </div>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="w-100"></div>

                                    <h3>Datos de tarjeta</h3>
                                    <div class="w-100"></div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="phone">Número de tarjeta</label>
                                            <input type="text" class="form-control" placeholder="" name="numeroTarjeta">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="emailaddress">Fecha de caducidad</label>
                                            <input type="text" class="form-control" placeholder="mm/yy" name="fechaCaducidad">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="emailaddress">CVV</label>
                                            <input type="text" class="form-control" placeholder="" name="cvv">
                                        </div>
                                    </div>
                                    <!--<div class="col-md-12">
                                        <div class="form-group mt-4">
                                            <div class="radio">
                                                <label class="mr-3"><input type="radio" name="optradio"> Create an Account? </label>
                                                <label><input type="radio" name="optradio"> Ship to different address</label>
                                            </div>
                                        </div>
                                    </div>-->
                                </div>
                        </div>
                        <div class="col-xl-5">
                            <div class="row mt-5 pt-3">
                                <div class="col-md-12 d-flex mb-5">
                                    <div class="cart-detail cart-total p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Compra</h3>
                                        <p class="d-flex">
                                            <span>Subtotal</span>
                                            <span>S/ ${preciototal}</span>
                                        </p>
                                        <!--<p class="d-flex">
                                            <span>Delivery</span>
                                            <span>$0.00</span>
                                        </p>
                                        <p class="d-flex">
                                            <span>Discount</span>
                                            <span>$3.00</span>
                                        </p>-->
                                        <hr>
                                        <p class="d-flex total-price">
                                            <span>Total</span>
                                            <span>S/ ${preciototal}</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-12" id="paypal">
                                    <div class="cart-detail p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Método de Pago</h3>
                                        <!--<div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="optradio" class="mr-2">Pago Directo</label>
                                                </div>
                                            </div>
                                        </div>-->
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="optradio" class="mr-2">Pagar con Culqi</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="" class="mr-2">He leído y aceptado los términos y condiciones</label>
                                                </div>
                                            </div>
                                        </div>
                                        <p><input type="submit" class="btn btn-primary py-3 px-4" value="Realizar Compra"></p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- .col-md-8 -->
                    </div>
                </form>
            </div>

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
            <script src="https://www.paypal.com/sdk/js?client-id=sb"></script>
            <script>paypal.Buttons().render('body');</script>

            <script>
                $(document).ready(function () {

                    var quantitiy = 0;
                    $('.quantity-right-plus').click(function (e) {

                        // Stop acting like a button
                        e.preventDefault();
                        // Get the field name
                        var quantity = parseInt($('#quantity').val());

                        // If is not undefined

                        $('#quantity').val(quantity + 1);


                        // Increment

                    });

                    $('.quantity-left-minus').click(function (e) {
                        // Stop acting like a button
                        e.preventDefault();
                        // Get the field name
                        var quantity = parseInt($('#quantity').val());

                        // If is not undefined

                        // Increment
                        if (quantity > 0) {
                            $('#quantity').val(quantity - 1);
                        }
                    });

                });
            </script>
            <script src="https://www.paypal.com/sdk/js?client-id=sb"></script>
            <script>paypal.Buttons().render('body');</script>
    </body>
</html>
<%-- 
    Document   : login
    Created on : 23/11/2019, 10:17:58 PM
    Author     : fabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%
            String mensaje = (String) request.getAttribute("mensaje");
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


            </div>
        </nav>
        <div class="login-container">
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active activo" href="#" id="login">Iniciar Sesión</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" id="register">Crear Cuenta</a>
                </li>
            </ul>
            <div class="container" style="width: 50%">
                <div id="formulario1" style="display: block">
                    <form action="inicioSesion" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Usuario</label>
                            <input name="user" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ejemplo: amorales357" style="font-size: 14px">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Contraseña</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1" style="font-size: 14px">
                        </div>
                        <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                    </form>
                        <%if(mensaje!=null){%>
                        <div class="alert alert-danger" role="alert">
                            ${mensaje}
                        </div>
                        <%}%>
                    
                </div>
                <div id="formulario2" style="display: none">
                    <form class="needs-validation" novalidate action="registro" method="post">
                        <div class="form-row">
                            <div class="col-md-6 mb-2">
                                <label for="validationCustom01">Nombres</label>
                                <input name="nombre" type="text" class="form-control" id="validationCustom01" required placeholder="Ejemplo: Carlos" style="font-size: 14px">
                                <div class="invalid-feedback">
                                    Ingrese su nombre
                                </div>
                                <div class="valid-feedback">
                                    Bien!
                                </div>
                            </div>
                            <div class="col-md-6 mb-2">
                                <label for="validationCustom02">Apellidos</label>
                                <input name="apellido" type="text" class="form-control" id="validationCustom02" required placeholder="Ejemplo: López Martínez" style="font-size: 14px">
                                <div class="invalid-feedback">
                                    Ingrese su apellido
                                </div>
                                <div class="valid-feedback">
                                    Bien!
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-2">
                                <label for="validationCustom01">Usuario</label>
                                <input name="usuario" type="text" class="form-control" id="validationCustom01" required placeholder="Ej: carlos@gmail.com" style="font-size: 14px">
                                <div class="invalid-feedback">
                                    Ingrese su usuario
                                </div>
                                <div class="valid-feedback">
                                    Bien!
                                </div>
                            </div>
                            <div class="col-md-6 mb-2">
                                <label for="validationCustom02">Contraseña</label>
                                <input name="contra" type="password" class="form-control" id="validationCustom02" required>
                                <div class="invalid-feedback">
                                    Ingrese su contraseña
                                </div>
                                <div class="valid-feedback">
                                    Bien!
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                <label class="form-check-label" for="invalidCheck">
                                    Declaro que he leído y acepto los términos y condiciones de Kathiplass.
                                </label>
                                <div class="invalid-feedback">
                                    Debes aceptar los términos y condiciones.
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">Registrarse</button>
                    </form>

                </div>
            </div>
        </div>
        <footer class="ftco-footer ftco-section">
            <div class="container">
                <!--<div class="row">
                    <div class="mouse">
                        <a href="#" class="mouse-icon">
                            <div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
                        </a>
                    </div>
                </div>-->
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
                                // Example starter JavaScript for disabling form submissions if there are invalid fields
                                (function () {
                                    'use strict';
                                    window.addEventListener('load', function () {
                                        // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                        var forms = document.getElementsByClassName('needs-validation');
                                        // Loop over them and prevent submission
                                        var validation = Array.prototype.filter.call(forms, function (form) {
                                            form.addEventListener('submit', function (event) {
                                                if (form.checkValidity() === false) {
                                                    event.preventDefault();
                                                    event.stopPropagation();
                                                }
                                                form.classList.add('was-validated');
                                            }, false);
                                        });
                                    }, false);
                                })();


                                var login = document.getElementById('login');
                                var register = document.getElementById('register');
                                if (login) {
                                    login.addEventListener('click', function (e) {
                                        if (login.classList.contains('activo'))
                                            return

                                        register.classList.remove('activo')
                                        login.classList.add('activo');
                                        document.getElementById('formulario1').style.display = 'block';
                                        document.getElementById('formulario2').style.display = 'none';

                                    })
                                }
                                if (register) {
                                    register.addEventListener('click', function (e) {
                                        if (register.classList.contains('activo'))
                                            return

                                        login.classList.remove('activo')
                                        register.classList.add('activo');
                                        document.getElementById('formulario2').style.display = 'block';
                                        document.getElementById('formulario1').style.display = 'none';

                                    })
                                }
        </script>
    </body>
</html>
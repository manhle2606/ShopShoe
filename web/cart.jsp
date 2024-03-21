<%-- 
    Document   : cart
    Created on : Jul 9, 2023, 12:50:46 AM
    Author     : chi
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>ShoeShop</title>

        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>

        <jsp:include page="header.jsp"/>
        <div class="col-lg-9">
            <div class="hero__search">
                <div class="hero__search__phone">
                    <c:if test="${sessionScope['account']!=null}">
                        <div class="hero__search__phone__text">
                            <h5>Hello, ${sessionScope['account'].fullname}</h5>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope['account']==null}">
                        <!--                        <div class="hero__search__phone__text">
                                                    <a href="login.jsp"><h5>Login</h5></a>
                                                </div>-->
                    </c:if> 

                </div>
            </div>
        </div>
        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Products</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="totalPrice" value="0" />
                                    <c:forEach var="cart" items="${sessionScope['cart'].getItems()}">
                                        <tr>
                                            <td class="shoping__cart__item">
                                                <img src="${cart.product.image}" style="width: 5rem; height: 5rem;" alt="">
                                                <a href="detail?id=${cart.product.id}">
                                                    <h5>${cart.product.name}</h5>
                                                </a>
                                            </td>
                                            <td class="shoping__cart__price">
                                                $ ${cart.product.price}
                                            </td>
                                            <td class="shoping__cart__quantity">
                                                <div class="quantity">
                                                    <div class="pro-qty">
                                                        <input type="text" value="${cart.quantity}">
                                                    </div>
                                                </div>
                                            </td>



                                            <td class="shoping__cart__total">
                                                <c:set var="totalPrice" value="${totalPrice + cart.product.price*cart.quantity}" />
                                                $ ${cart.product.price*cart.quantity}
                                            </td>
                                            <td class="shoping__cart__item__close">
                                                <a href="deletecart?pid=${cart.product.id}"> <span class="icon_close"></span> </a>
                                            </td>
                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <form action="checkout" method="post">
                    <p style="color: red;">${mess}</p>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__btns">
                                <a href="home" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="shoping__continue">
                                <div class="shoping__discount">
                                    <input type="text" name="note"placeholder="Enter your note ...">
                                    <button type="" class="site-btn">Note</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="shoping__checkout">
                                <h5>Cart Total</h5>
                                <ul>
                                    <li>Subtotal <span>$ ${totalPrice}</span></li>
                                    <li>Total <span>$ ${totalPrice}</span></li>
                                </ul>
                                <button type="submit" onclick="displaySuccessMessage()" class="primary-btn cart-btn" style="background-color: #DD2222; color: white;" value="CHECKOUT">CHECKOUT</button>
                            </div>
                        </div>
                    </div>
                </form>
                <script>
                    function displaySuccessMessage() {
                        var cart = <%= session.getAttribute("cart")%>;
                        if (cart === null || cart.items.length === 0) {
                            window.alert("Cart is empty, please add items to cart before checkout!");
                        } else {
                            window.alert("Order placed successfully!");
                        }
                    }
                </script>
            </div>
        </section>


                <!-- Footer Section Begin -->
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__about__logo">
                                <a href="./index.jsp"><img src="img/logo2.png1" alt=""></a>
                            </div>
                            <ul>
                                <li>Address: FPT university, Thach That, Thach Hoa, Ha Noi</li>
                                <li>Phone: +84  971079629</li>
                                <li>Email:manhlche176152@fpt.edu.vn</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                        <div class="footer__widget">
                            <h6>Useful Links</h6>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">About Our Shop</a></li>
                                <li><a href="#">Secure Shopping</a></li>
                                <li><a href="#">Delivery infomation</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">Who We Are</a></li>
                                <li><a href="#">Our Services</a></li>
                                <li><a href="#">Projects</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Innovation</a></li>
                                <li><a href="#">Testimonials</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="footer__widget">
                            <h6>Join Our Newsletter Now</h6>
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__widget__social">
                                <a href="#"><i class="fab fa-facebook"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright">
                            <div class="footer__copyright__text"><p><!-- Link back to Manh Le can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fas fa-heart" aria-hidden="true"></i> by <a href="https://www.facebook.com/profile.php?id=100039924710594&mibextid=ZbWKwL" target="_blank">Manh Le</a>
                                    <!-- Link back to Manh Le can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                            <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>

        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
                    window.dataLayer = window.dataLayer || [];
                    function gtag() {
                        dataLayer.push(arguments);
                    }
                    gtag('js', new Date());

                    gtag('config', 'UA-23581568-13');
        </script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816" integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw==" data-cf-beacon='{"rayId":"7e389c741c0904c9","version":"2023.4.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}' crossorigin="anonymous"></script>
    </body>
</html>
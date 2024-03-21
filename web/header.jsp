<%-- 
    Document   : header
    Created on : Jul 8, 2023, 10:41:14 PM
    Author     : chi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<header class="header">
    <html lang="zxx">

        <head>
            <meta charset="UTF-8">
            <meta name="description" content="Manh Le Template">
            <meta name="keywords" content="Manh Le, unica, creative, html">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Manh Le | Template</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

            <!-- Css Styles -->
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
            <!-- Page Preloder -->
            <div id="preloder">
                <div class="loader"></div>
            </div>

            <!-- Humberger Begin -->
            <div class="humberger__menu__overlay"></div>
            <div class="humberger__menu__wrapper">


                <div class="humberger__menu__widget">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href=""><img src="img/logoo.png" alt=""></a>
                        </div>
                    </div>


                    <nav class="humberger__menu__nav mobile-menu " >
                        <ul>
                            <li class="active"><a href="home">Home</a></li>
                            <li class="active"><a href="productlist">Product</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="viewcart">Cart</a></li>
                                        <c:if test="${sessionScope['account']!=null}">
                                        <li><a href="myorder">My Order</a></li>

                                    </c:if>

                                </ul>
                            </li>
                            <c:if test="${sessionScope['account'].getRoleId() == 'AD'}">
                                <li><a href="#">Manager</a>
                                    <ul class="header__menu__dropdown">
                                        <c:if test="${sessionScope['account'].getRoleId() == 'AD'}">
                                            <li><a href="manageProduct">Manage Product</a></li>
                                            <li><a href="manageaccount">Manage Account</a></li>
                                            <li><a href="orderscustomers">Order customer</a></li>
                                            </c:if>
                                    </ul>

                                </li>
                            </c:if>
                            <c:if test="${sessionScope['account']!=null}">
                                <li><a href="#">Edit</a>
                                    <ul class="header__menu__dropdown">
                                        <c:if test="${sessionScope['account']!=null}">
                                            <li><a href="changepassword">Change Password</a></li>
                                            <li><a href="editprofile">Edit Profile</a></li>
                                            </c:if>
                                    </ul>

                                </li>
                            </c:if> 
                            <li class="active"><a href="contact">Contact</a></li>   
                                <c:if test="${sessionScope['account']==null}">
                                <li><a href="login">Login</a></li>

                            </c:if> 
                            <c:if test="${sessionScope['account']!=null}">
                                <li><a href="logout">Logout</a></li>
                                </c:if>

                        </ul>   
                    </nav>

                    <div id="mobile-menu-wrap">
                        <div class="footer__widget">
                            <br>
                            <h6>Join Our Newsletter Now</h6>
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#">
                                <input type="text" placeholder="enter mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__widget__social">
                                <a href="#"><i class="fab fa-facebook"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-pinterest"></i></a>
                            </div>
                        </div>
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

                </div>
            </div>


            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href=""><img src="img/logoo.png" alt=""></a>
                        </div>
                    </div>

                    <div class="col-lg-9">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="home">Home</a></li>
                                <li class="active"><a href="productlist">Product</a></li>
                               
                                <li><a href="#">Pages</a>
                                    <ul class="header__menu__dropdown">
                                        <li><a href="viewcart">Cart</a></li>
                                            <c:if test="${sessionScope['account']!=null}">
                                            <li><a href="myorder">My Order</a></li>

                                        </c:if>

                                    </ul>
                                </li>

                                <c:if test="${sessionScope['account'].getRoleId() == 'AD'}">
                                    <li><a href="#">Manager</a>
                                        <ul class="header__menu__dropdown">
                                            <c:if test="${sessionScope['account'].getRoleId() == 'AD'}">
                                                <li><a href="manageProduct">Manage Product</a></li>
                                                <li><a href="manageaccount">Manage Account</a></li>
                                                <li><a href="orderscustomers">Order customer</a></li>
                                                </c:if>
                                        </ul>

                                    </li>
                                </c:if>

                                <c:if test="${sessionScope['account']!=null}">
                                    <li><a href="#">Edit</a>
                                        <ul class="header__menu__dropdown">
                                            <c:if test="${sessionScope['account']!=null}">
                                                <li><a href="changepassword">Change Password</a></li>
                                                <li><a href="editprofile">Edit Profile</a></li>
                                                </c:if>
                                        </ul>

                                    </li>
                                </c:if>           
                                    <li class="active"><a href="contact">Contact</a></li>  
                                    <c:if test="${sessionScope['account']!=null}">
                                    <li><a href="logout">Logout</a></li>

                                </c:if>
                                <c:if test="${sessionScope['account']==null}">
                                    <li><a href="login">Login</a></li>

                                </c:if>   
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fas fa-home"></i>
                </div>
            </div>
        </body>
</header>


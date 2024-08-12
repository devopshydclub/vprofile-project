<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="${contextPath}/resources/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css">
    <style>
        /* Navbar Styling */
        .navbar-custom {
            background: rgba(0, 0, 0, 0); /* Transparent background */
            border: none; /* Remove border */
        }
        .navbar-custom .navbar-brand, .navbar-custom .navbar-nav > li > a {
            color: #fff; /* White text color for contrast */
        }
        .navbar-custom .navbar-nav > li > a:hover {
            color: #007bff; /* Change link color on hover */
        }
        /* Ensure navbar is positioned correctly */
        .navbar-wrapper {
            position: absolute;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        /* Page background styling */
        body {
            background-image: url('${contextPath}/resources/Images/bg-01.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
<div class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar-custom navbar-static-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${contextPath}/index">HKH Infotech</a>
                </div>
                <div class="collapse navbar-collapse" id="navbarCollapse">

                    <ul class="nav navbar-nav navbar-right">


                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" method="POST" action="${contextPath}/login">
                <span class="login100-form-title p-b-49">
                    Login
                </span>

                <div class="wrap-input100 validate-input m-b-23" data-validate="Username is required">
                    <span class="label-input100">Username</span>
                    <input class="input100" type="text" name="username" placeholder="Type your username" required autofocus>
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100" type="password" name="password" placeholder="Type your password" required>
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>

                <div class="text-right p-t-8 p-b-31">
                    <a href="#">
                        Forgot password?
                    </a>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn">
                            Login
                        </button>
                    </div>
                </div>

                <div class="flex-col-c p-t-155">
                    <span class="txt1 p-b-17">
                        Don't have an account?
                    </span>

                    <a href="${contextPath}/registration" class="txt2">
                        Sign Up
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="${contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="${contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/resources/js/main.js"></script>

</body>
</html>

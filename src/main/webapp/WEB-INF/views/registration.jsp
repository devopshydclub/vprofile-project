<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SIGNUP</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://bootswatch.com/cosmo/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body background="${contextPath}/resources/Images/new-background.png">

<div class="mainbody container-fluid">
    <div class="row">
        <div class="navbar-wrapper">
            <div class="container-fluid">
                <div class="navbar navbar-custom navbar-static-top" role="navigation" style="background-color: #e3f2fd;">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="${contextPath}/index">HKH Infotech</a>

                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="#">Technologies</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blog</a></li>
                            </ul>
                            <div class="navbar-collapse navbar-right collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="${contextPath}">Login</a></li>
                                    <li><a href="${contextPath}/registration">Sign up</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container1">
    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading" align="center">SIGN UP</h2>
        <img class="logo" src="${contextPath}/resources/Images/new-logo1.png" />
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="userEmail">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="userEmail" class="form-control" placeholder="Email Id" autofocus="true"></form:input>
                <form:errors path="userEmail"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control" placeholder="Confirm password"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>
        <button class="btn btn-custom-LOGIN btn-lg btn-block" type="submit">SIGN UP</button>
    </form:form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <!-- Stylesheets -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/profile.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://bootswatch.com/cosmo/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
                   padding-top: 70px; /* Adjusted for fixed navbar */
                   background-image: url("${contextPath}/resources/Images/background1.jpg");
                   background-color: #cccccc;
                   background-size: cover; /* Make sure the image covers the entire area */
                   background-position: center; /* Center the image */
                   background-repeat: no-repeat; /* Prevent the image from repeating */
                   font-family: 'Poppins', sans-serif; /* Apply Poppins font */
               }

        .navbar-wrapper {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 20;
            background-color: #e3f2fd; /* Navbar background color */
            border-bottom: 2px solid #003366;
        }

        .navbar-brand {
            color: black; /* Navbar brand text color */
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: bold;
        }

        .container {
            border: 1px solid #ddd;
            background-color: #ffffff;
            width: 80%;
            margin: 0 auto; /* Center align container */
            padding: 20px; /* Add padding for better spacing */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Shadow for depth */
        }

        .table {
            background-color: #fff; /* Table background */
            margin: 20px 0; /* Spacing around the table */
        }

        .table th, .table td {
            text-align: center; /* Center align table content */
        }

        .btn-info {
            background-color: #17a2b8; /* Info button color */
            border-color: #17a2b8;
        }

        .btn-info:hover {
            background-color: #138496; /* Darker color on hover */
            border-color: #117a8b;
        }
    </style>
</head>
<body>
    <div class="mainbody container-fluid">
        <div class="row">
            <div class="navbar-wrapper">
                <div class="container-fluid">
                    <div class="navbar navbar-custom navbar-static-top" role="navigation">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="${contextPath}/index">HKH Infotech</a>
                            </div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="#technologies">Technologies</a></li>
                                    <li><a href="#about">About</a></li>
                                    <li><a href="#contact">Contact</a></li>
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
    <!-- Header -->
    <div class="container">
        <div class="table-responsive">
            <h2 align="center">Users List</h2>
            <table class="table table-bordered">
                <tr>
                    <th>User Name</th>
                    <th>User Id</th>
                </tr>
                <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.username}"/></td>
                    <td>
                        <a href="users/${user.id}" class="btn btn-info" role="button"><c:out value="${user.id}"/></a>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>

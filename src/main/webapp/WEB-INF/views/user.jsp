<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserData</title>
  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/profile.css" rel="stylesheet">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://bootswatch.com/cosmo/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body{  
  padding-top: 2cm;
  background-image: url("${contextPath}/resources/Images/background.png");
  background-color: #cccccc;
}
.container {
  border-style: solid;
  background-color:#ffffff;
  width: 80%;
  position: relative;
}
</style>
<body>
	<div class="mainbody container-fluid">
    <div class="row">
        <div class="navbar-wrapper">
            <div class="container-fluid">
                <div class="navbar navbar-custom navbar-static-top" role="navigation">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                                    class="icon-bar"></span><span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="${contextPath}/index">VISUAL PATH</a>
                            <i class="brand_network"><small><small>VProfile</small></small></i>
                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="#technologies">TECHNOLOGIES</a></li>
                                <li><a href="#about">ABOUT</a></li>
                                <li><a href="#contact">CONTACT</a></li>
                                <li><a href="#">BLOG</a></li>
                            </ul>
                            <div class="navbar-collapse navbar-right collapse">
	                            <ul class="nav navbar-nav">
	                        	 <li><a href="${contextPath}/login">LOGIN</a></li>
	                        	 <li><a href="${contextPath}/registration">SIGN UP</a></li>
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
	<h2 align="center" style="color: red">${{Result}} <a href="${contextPath}/users" class="btn btn-danger" > Back</a> </h2> 
	<h2 align="center">User Primary Details</h2>	
    <table class="table table-bordered">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Father's Name</th>
            <th>Mother's Name</th> 
            <th>Email</th>                       
            <th>Phone Number</th>
        </tr>         
      	<tr>
      	  <td>
              <c:out value="${user.id}"/> 
          </td>
          <td>
              <c:out value="${user.username}"/>
          </td>
          <td>
              <c:out value="${user.fatherName}" />
          </td>
           <td>
              <c:out value="${user.motherName}" />
          </td>
          <td>
              <c:out value="${user.userEmail}" />
          </td>
          <td>
              <c:out value="${user.phoneNumber}" />
          </td>         
     	</tr>     	
    </table>
    <h2 align="center">User Extra Details</h2>
    <table class="table table-bordered">
        <tr>
            <th>Date Of Birth</th>
            <th>Gender</th>
            <th>Marital Status</th>
            <th>Permanent Address</th>            
            <th>Temporary  Address</th>
            <th>Primary Occupation</th>
            <th>Secondary Occupation</th>
            <th>Skills</th>
            <th>Secondary PhoneNumber</th>
            <th>Nationality</th>
            <th>Language</th>
            <th>Working Experience</th>
        </tr>         
      	<tr>
      	  <td>
              <c:out value="${user.dateOfBirth}"/> 
          </td>
          <td>
              <c:out value="${user.gender}"/>
          </td>
          <td>
              <c:out value="${user.maritalStatus}" />
          </td>
          <td>
              <c:out value="${user.permanentAddress}" />
          </td>
          <td>
              <c:out value="${user.tempAddress}" />
          </td>
          <td>
              <c:out value="${user.primaryOccupation}" />
          </td>
          <td>
              <c:out value="${user.secondaryOccupation}" />
          </td>
          <td>
              <c:out value="${user.skills}" />
          </td>
          <td>
              <c:out value="${user.secondaryPhoneNumber}" />
          </td>
          <td>
              <c:out value="${user.nationality}" />
          </td>
          <td>
              <c:out value="${user.language}" />
          </td>
          <td>
              <c:out value="${user.workingExperience}" />
          </td>
     	</tr>     	
    </table>
    </div>
    </div>
</body>
</html>
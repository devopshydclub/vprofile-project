<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>allUser</title>
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
  width: 80%;
  background-color:#ffffff;
  position: relative;
}
</style>
<body>    
	<div class="container">
	<div class="table-responsive">
	<h2 align="center"> Users List</h2> 
    <table class="table table-bordered">
        <tr>
            <th>User Name</th>
            <th>User Id</th>
        </tr>
        <c:forEach items="${users}" var="user">
      	<tr>
      	  <td>
              <c:out value="${user.username}"/>
          </td>
      	  <td>
              <a href="users/${user.id}" class="btn btn-info" role="button"><c:out value="${user.id}"/> </a>
          </td> 
     	</tr>
		</c:forEach>
		
    </table>
    </div>
    </div>
</body>
</html>
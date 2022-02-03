<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>Upload File Request Page</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.panel {
    position: absolute;
    padding-top: 1cm;
    padding-bottom: 1cm;
    padding-right: 2cm;
    padding-left: 2cm;
    top: 50%;
    left: 50%;
    transform: translateX(-50%) translateY(-50%);
}
.align-center {
    text-align:center;
}
</style>
</head>
<body>
<div class="container">  
  <div class="panel panel-default">
  <h2 align="center">Upload Image </h2>
    <form action="./uploadFile?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<span>${pageContext.request.userPrincipal.name}</span> <br/>
		<div class="form-group">
	      <label for="file">Image Upload</label>
	      <input type="file" name="file" class="form-control" id="file">
    	</div>
 		<div class="form-group">
	      <label for="name">Image Name:</label>
	      <input type="text"  name="name" class="form-control" id="name">
    	</div>
		<div class="align-center">
 			<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
 			<input type="hidden"  name="userName"   value="${pageContext.request.userPrincipal.name}"/> 
			<input type="submit" class="btn btn-info" value="Upload">
		</div>
	</form>	
  </div>
</div>
	
</body>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</html>
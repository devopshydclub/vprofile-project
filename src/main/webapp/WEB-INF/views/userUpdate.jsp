<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>update user</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://bootswatch.com/cosmo/bootstrap.min.css">
    <style>
    .container {
	 margin-top:19px;
	 border: 2px solid #b38b0d;
	 margin: 0 auto;
	width: 60%; 
	padding: 10px 10px 10px 10px;
	}
    </style>
   </head>

<body>
<h2 class="form-signin-heading" align="center">Update User Profile</h2>
<div class="container">
	<div class="row">
	<div class="col-md-12 ">
    <form:form method="POST" modelAttribute="user" class="form-horizontal">
        <fieldset>      
      
		 <div class="form-group">
        	<spring:bind path="username">        
	           <form:label class="col-md-4 control-label" path="username">Name :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="username" class="form-control" placeholder="Username"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
        <div class="form-group">
        	<spring:bind path="userEmail">        
	           <form:label class="col-md-4 control-label" path="userEmail">Email :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="userEmail" class="form-control" placeholder="userEmail"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
        <div class="form-group">
        	<spring:bind path="dateOfBirth">        
	           <form:label class="col-md-4 control-label" path="dateOfBirth">Date Of Birth :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-birthday-cake"></i>
			     </div>            	
	                <form:input type="text" path="dateOfBirth" class="form-control" placeholder="eg:01/01/1998"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div> 
        <div class="form-group">
        	<spring:bind path="fatherName">        
	           <form:label class="col-md-4 control-label" path="fatherName">Father's Name :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-male" style="font-size: 20px;"></i>
			     </div>            	
	                <form:input type="text" path="fatherName" class="form-control" placeholder="Father's Name"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
         <div class="form-group">
        	<spring:bind path="motherName">        
	           <form:label class="col-md-4 control-label" path="motherName">Mother's Name :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-female" style="font-size: 20px;"></i>
			     </div>            	
	                <form:input type="text" path="motherName" class="form-control" placeholder="Mother's Name"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
       <div class="form-group">
       <spring:bind path="gender">
		  <form:label class="col-md-4 control-label" path="gender">Gender</form:label>
		  <div class="col-md-4"> 
		    <form:label class="radio-inline" path="gender">
		      <form:radiobutton  path="gender"  value="male" checked="checked" />
		      Male
		    </form:label> 
		    <form:label class="radio-inline" path="gender">
		      <form:radiobutton path="gender"  value="female" />
		      Female
		    </form:label> 
		    <form:label class="radio-inline" path="gender">
		      <form:radiobutton path="gender"  value="other" />
		      Other
		    </form:label>
		  </div>
		  </spring:bind>
		</div>
		<div class="form-group">
       <spring:bind path="maritalStatus">
		  <form:label class="col-md-4 control-label" path="maritalStatus">Marital Status:</form:label>
		  <div class="col-md-4"> 
		    <form:label class="radio-inline" path="maritalStatus">
		      <form:radiobutton  path="maritalStatus"  value="unMarried"  />
		      Married
		    </form:label> 
		    <form:label class="radio-inline" path="gender">
		      <form:radiobutton path="maritalStatus"  value="unMarried" checked="checked" />
		       Unmarried
		    </form:label>		    
		  </div>
		  </spring:bind>
		</div>
       
         <div class="form-group">
        	<spring:bind path="permanentAddress">        
	           <form:label class="col-md-4 control-label" path="permanentAddress">Permanent Address :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="permanentAddress" class="form-control" placeholder="Area,Street,Dist "
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
         <div class="form-group">
        	<spring:bind path="tempAddress">        
	           <form:label class="col-md-4 control-label" path="tempAddress">Temporary Address :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="tempAddress" class="form-control" placeholder="Area,Street,Dist"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
         <div class="form-group">
        	<spring:bind path="primaryOccupation">        
	           <form:label class="col-md-4 control-label" path="primaryOccupation">Primary Occupation :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="primaryOccupation" class="form-control" placeholder="Primary Occupation"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
         <div class="form-group">
        	<spring:bind path="secondaryOccupation">        
	           <form:label class="col-md-4 control-label" path="secondaryOccupation">Secondary Occupation :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="secondaryOccupation" class="form-control" placeholder="Secondary Occupation"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
           <div class="form-group">
        	<spring:bind path="skills">        
	           <form:label class="col-md-4 control-label" path="skills">Skills :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="skills" class="form-control" placeholder="Skills"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
           <div class="form-group">
        	<spring:bind path="phoneNumber">        
	           <form:label class="col-md-4 control-label" path="phoneNumber">Phone Number :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="phoneNumber" class="form-control" placeholder="Phone Number"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
           <div class="form-group">
        	<spring:bind path="secondaryPhoneNumber">        
	           <form:label class="col-md-4 control-label" path="secondaryPhoneNumber">Secondary PhoneNumber :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="secondaryPhoneNumber" class="form-control" placeholder="Secondary PhoneNumber"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
           <div class="form-group">
        	<spring:bind path="nationality">        
	           <form:label class="col-md-4 control-label" path="nationality">Nationality :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="nationality" class="form-control" placeholder="Nationality"
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
       <div class="form-group">
       <spring:bind path="language">
		  <form:label class="col-md-4 control-label" path="language">Mother Tongue</form:label>
		  <div class="col-md-4"> 
		    <form:label class="radio-inline" path="language">
		      <form:radiobutton  path="language"  value="english" checked="checked" />
		     English
		    </form:label> 
		    <form:label class="radio-inline" path="language">
		      <form:radiobutton path="language"  value="spanish" />
		      Spanish
		    </form:label> 
		    <form:label class="radio-inline" path="language">
		      <form:radiobutton path="language"  value="german" />
		      German 
		    </form:label>
		     <form:label class="radio-inline" path="language">
		      <form:radiobutton path="language"  value="hindi" />
		      Hindi
		    </form:label>
		     <form:label class="radio-inline" path="language">
		      <form:radiobutton path="language"  value="other" />
		      Other
		    </form:label>
		  </div>
		  </spring:bind>
		</div>
           <div class="form-group">
        	<spring:bind path="workingExperience">        
	           <form:label class="col-md-4 control-label" path="workingExperience">Work Experience :</form:label>
	            <div class="col-md-4">
	           	 <div class="input-group">
	           	 <div class="input-group-addon">
			        <i class="fa fa-user"></i>
			     </div>            	
	                <form:input type="text" path="workingExperience" class="form-control" placeholder="Work Experience "
	                            autofocus="true"></form:input>
	            </div> 
	           </div>                   
        	</spring:bind>
       </div>
       <div class="form-group">
		  <label class="col-md-4 control-label" ></label>  
		  <div class="col-md-4">        
        <button class="btn btn-success" type="submit">Update</button>
        <a href="${contextPath}/welcome" class="btn btn-danger" > Cancel</a>
        </div>
        </div>
    </fieldset>
    </form:form>
</div>
</div>
</div>
<!-- /container -->
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>

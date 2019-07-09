<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>Sign Up</title>
	<link rel="icon" href="<c:url value="/resources/pic/logo.png"/>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<style>
		.fakeimg {
		  height: 200px;
		  background: #aaa;
		}
		.mycont{
		  margin-top: 2%;
		  width: 50%;
		  margin-left: 25%;
		}
		img{
		  width: 40%;
		  margin-left: 30%;
		}
		a{
		    margin-left: 20x;
		}
		button{
		  background-color: #5f5f5f !important;
		}
	</style>
</head>
<body>
<c:if test="${err != null}">
	<div class="container alert alert-danger">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<p style="text-align: center;">${err}</p>
	</div>
</c:if>
<div class="mycont" >
    <div class="container" >
    	<img src="<c:url value="/resources/pic/logo.png"/>"></img>
    </div>
    <div class="container" >
    <f:form action="${pageContext.request.contextPath}/register" modelAttribute="commandSignup" class="was-validated">
        <div class="form-group">
	        <label for="name">Name:</label>
	        <f:input path="user_name" type="text" class="form-control" id="name" placeholder="Enter name" name="name" required="required"/>
        </div>
        <div class="form-group">
	        <label for="surname">Surname:</label>
	        <f:input path="user_surname" type="text" class="form-control" id="surname" placeholder="Enter surname" name="surname" required="required"/>
        </div>
        <div class="form-group">
	        <label for="useremail">Email:</label>
	        <f:input path="user_email" type="email" class="form-control" id="useremail" placeholder="Enter email" name="useremail" required="required"/>
        </div>
        <div class="form-group">
	        <label for="pwd">Password:</label>
	        <f:input path="user_password" type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required="required"/>
        </div>
        <br>
        <button type="submit" class="btn btn-primary" style="padding-left:25px;padding-right:25px;float: right">Sign Up</button>
        <br>
        <f:radiobutton path="role_id" value="3" checked="checked"/> Author
        <f:radiobutton path="role_id" value="2"/> Judge
        <br><br>
    </f:form>
    </div>
</div>
<script type="text/javascript" src="<c:url value="/resources/js/Message.js"/>"></script>
</body>
</html>
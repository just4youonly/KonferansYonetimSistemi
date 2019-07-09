<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>Log In</title>
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
	    margin-top: 5%;
		width: 40%;
		margin-left: 30%;
	}
	img{
		width: 40%;
		margin-left: 30%;
	}
	a{
    	margin-left: 20x;
	}
	#login, #signup{
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
<c:if test="${param.act == 'lo'}">
	<div class="container alert alert-danger">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<p style="text-align: center;">User Logout Successfully!</p>
	</div>
</c:if>
<c:if test="${param.act == 'reg'}">
	<div class="container alert alert-success">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<p style="text-align: center;">User Registered Successfully!</p>
	</div>
</c:if>
<div class="mycont" >
    <div class="container" >
      <img src="<c:url value="/resources/pic/logo.png"/>"></img>
    </div>
    <div class="container" >
    	<f:form action="${pageContext.request.contextPath}/login" method="POST" modelAttribute="commandLogin">
	        <div class="form-group">
		        <label for="username">Username:</label>
		        <f:input path="user_email" type="email" class="form-control" id="username" placeholder="Enter username" name="username" required="required"/>
	        </div>
	        <div class="form-group">
		        <label for="password">Password:</label>
		        <f:input path="user_password" type="password" class="form-control" id="password" placeholder="Enter password" name="password" required="required"/>
	        </div>
	        <f:radiobutton path="role_id" value="3" checked="checked"/> Author
	        <f:radiobutton path="role_id" value="2"/> Judge
	        <f:radiobutton path="role_id" value="1"/> OCC  <br><br>
        	<a id="signup" class="btn btn-primary" href="${pageContext.request.contextPath}/signup" style="padding-left:17px;padding-right:17px;">Sign Up</a>
	        <button id="login" type="submit" class="btn btn-primary" style="padding-left:25px;padding-right:25px;float: right">Log In</button>
	        <br><br>
        </f:form>
    </div>
</div>

<script type="text/javascript" src="<c:url value="/resources/js/Message.js"/>"></script>

</body>
</html>


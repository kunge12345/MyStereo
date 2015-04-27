
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style>
div#comment {
	border: 1px solid #000
}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Home Page</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>Welcome To My Stereo!</h1>
			<br>

			<%
				String message = (String) (request.getAttribute("message"));
			%>
			<form id="form1" action="seruserlogin" method="post">
				<table border="1" style="border-collapse: collapse;">
					<tr align="center">
						<td colspan="2">login</td>
					</tr>
					<tr>
						<td>username</td>
						<td><input type="text" name="userName" /></td>

					</tr>
					<tr>
						<td>password</td>
						<td><input type="password" name="userPassword" /> <span
							style="color: red; font-size: 13px;" id="td2"> <%
 	if (message != null)
 		out.println(message);
 %>
						</span></td>
					</tr>
					<tr align="center">
						<td colspan="2"><input type="submit" name="login" value="log" />
							<a href="http://localhost:8080/MyStereo/userregister.jsp">
								not an user yet? </a></td>
					</tr>
				</table>
			</form>
			<div class="jumbotron"></div>

			<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
			<!-- Include all compiled plugins (below), or include individual files as needed -->
			<script src="js/bootstrap.min.js"></script>
</body>
</html>
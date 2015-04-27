<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "edu.neu.cs5200.mystereo.DAO.*, edu.neu.cs5200.mystereo.models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<title>Fol-PlayDetails</title>
</head>
<body>
	<div class="container">
		<%PlayList2MusicDao dao2=new PlayList2MusicDao();
		PlayListDao dao = new PlayListDao();
		
		String iddStr  = request.getParameter("idd");
		Integer idd=null;
		if(iddStr!=null)
		idd = Integer.parseInt(iddStr);
			String action = request.getParameter("action");
			String idStr  = request.getParameter("id");
			Integer id=null;
			if(idStr!=null)
			id = Integer.parseInt(idStr);
			
					
				
			List<PlayList2Music> p2m = dao2.findMusicbyPid(id);
		%>
		<h1>
			 music
		</h1>
		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>&nbsp;</th>
			</tr>
		<%
			for(PlayList2Music play : p2m)
			{
		%>	<tr>
				<td>
					<a href="musicDetails.jsp?id=<%= play.getMusic().getMsid() %>">
					<%= play.getMusic().getName() %>
					</a>
			</tr>
		<%
			}
		%>
		</table>
		<a href=hello.jsp>return</a>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
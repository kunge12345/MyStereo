<%@page
	import="edu.neu.cs5200.mystereo.client.MusicClient,edu.neu.cs5200.mystereo.DAO.*"%>
<%@page import="edu.neu.cs5200.mystereo.models.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
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

<title>Choose Playlist</title>
</head>
<body>
	<div class="container">
		<%
		UserDao dao2 = new UserDao();
			PlayListDao dao = new PlayListDao();
		
			String message = (String)(session.getAttribute("userid"));
			Integer idd=Integer.parseInt(message);
			String idStr  = request.getParameter("id");
			List<PlayList> playlists = dao.findAllPlayLists(idd);
		%>
		<h1>You want to add it to...</h1>
		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>&nbsp;</th>
			</tr>
			<%
			for(PlayList playlist : playlists)
			{
		%>
			<tr>
				<td><a
					href="DisplaySong.jsp?musicid=<%=idStr%>&pId=<%=playlist.getpId()%>">
						<%= playlist.getTitle()%>
				</a></td>
			</tr>
			<%
			}
		%>
		</table>
	</div>
</body>
</html>
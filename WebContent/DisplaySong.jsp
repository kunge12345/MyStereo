<%@page import="edu.neu.cs5200.mystereo.client.MusicClient"%>
<%@page import="edu.neu.cs5200.mystereo.models.Music"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="edu.neu.cs5200.mystereo.DAO.*"%>
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



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Music Detail</title>
</head>

<body>
	<%
		
		String action = request.getParameter("search");
		String artist = request.getParameter("artist");
		String track = request.getParameter("track");
		
		MusicClient msc = new MusicClient();
		Music music = msc.findSongByNameAndArtist(artist, track);
		String artUrl = music.getArtist().getUrl();
		String alburl = music.getAlbum().getUrl();
	%>

	<div class="container">

		<div class="jumbotron">
			<h1><%=music.getName() %></h1>
			<button name="action" value="add" type="button" class="btn btn-primary">Add to PlayList</button>
			<p><a href=<%=artUrl%>><%=music.getArtist().getName() %></a>	</p>
			<P><a href=<%=alburl%>><%=music.getAlbum().getName() %></a></P>
			<p><%=music.getSummary() %></p>
		</div>
		

	</div>

			
	



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>

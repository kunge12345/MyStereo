<%@page
	import="org.eclipse.persistence.internal.libraries.antlr.runtime.MismatchedNotSetException"%>
<%@page import="edu.neu.cs5200.mystereo.client.AlbumClient"%>
<%@page import="edu.neu.cs5200.mystereo.client.ArtistClient"%>
<%@page import="edu.neu.cs5200.mystereo.client.MusicClient"%>
<%@page import="edu.neu.cs5200.mystereo.models.*"%>
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
		MusicDao musicdao = new MusicDao();
		AlbumDao abdao = new AlbumDao();
		ArtistDao artidao = new ArtistDao();
		Music m = new Music();
		Artist art = new Artist();
		Album b = new Album();
		String idStr = request.getParameter("id");
		Integer id = Integer.parseInt(idStr);

		m = musicdao.findMusic(id);
		b = m.getAlbum();
		art = b.getArtist();
	%>

	<div class="container">

		<div class="jumbotron">
			<form>
				<h1>music</h1>
			</form>
			<p>
				<a href=<%=m.getUrl()%>><%=m.getName()%></a>
			</p>
			<p>
				MBID:<%=m.getMbid()%></p>
					<p>
				TAG:<a href="musictag.jsp?type=<%=m.getTag()%>"><%=m.getTag()%></a></p>
			<p>
				SUMMARY:<%=m.getSummary()%></p>

		</div>


	</div>

	<div class="container">

		<div class="jumbotron">

			<div class="row">
				<div class="col-md-9">
					<h1>Album</h1>
					<a href=<%=b.getUrl()%>><%=b.getName()%></a> <br> MBID:<%=b.getMbid()%>

				</div>
				<div class="col-md-3">
					<img align="top" src="<%=b.getImage()%>"></img>
				</div>
			</div>
			<p><%=m.getSummary()%></p>

		</div>


	</div>

	<div class="container">

		<div class="jumbotron">


			<div class="row">
				<div class="col-md-9">
					<h1>Artist</h1>

						<a href=<%=art.getUrl()%>><%=art.getName()%></a><br>
					

					<p><%=art.getMbid()%></p>
				</div>
				<div class="col-md-3">
					<img align="top" src="<%=art.getImage()%>"></img>
				</div>
			</div>

			<p><%=art.getSummary()%></p>


		</div>


	</div>
	<h2>
		<a href="hello.jsp">return</a>
	</h2>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>

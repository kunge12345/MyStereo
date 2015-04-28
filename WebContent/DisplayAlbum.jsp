<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.*"%>
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
		ArtistClient asc = new ArtistClient();
		AlbumClient bsc = new AlbumClient();
		ArtistDao atidao = new ArtistDao();
		AlbumDao abdao = new AlbumDao();
		Artist art = new Artist();
		Album b = new Album();
		String alstr = "";
		String atstr = "";
		String action = request.getParameter("search");
		String artist = request.getParameter("artist");
		String album = request.getParameter("album");
		if ((artist != null) & (album != null)) {
			artist = URLEncoder.encode(artist, "UTF-8");
			album = URLEncoder.encode(album, "UTF-8");
		}
		int err  = 0;	
	
		 String FIND_ALBUM_BY_NAME_AND_ARTIST = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=14debcea4d95e934a86515e3327ee949&artist=ARTIST&album=NAME&format=json";
		 String FIND_ALBUM_BY_MBID = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=14debcea4d95e934a86515e3327ee949&mbid=MBID&format=json";
		 	String urlStr = FIND_ALBUM_BY_NAME_AND_ARTIST.replace("ARTIST", artist).replace("NAME", album);
		 			String json = bsc.getJsonStringForUrl(urlStr);
		 			json = json.substring(2, 7);
		 			if("error".equals(json))
		 				err=1;
		if (artist != null) {
			if(err==0)
			{
			b = bsc.findAlbumByNameAndArtist(album, artist);

			atstr = b.getArtist().getMbid();
			alstr = b.getMbid();
			art = asc.findArtistByMBID(atstr);
			b.setMusic(null);
			b.setArtist(null);
			art.setAlbums(null);
			if (atidao.findArtistByMb(atstr).getMbid() == null)
				atidao.createArtist(art);
			art = atidao.findArtistByMb(atstr);
			b.setArtist(art);

			if (abdao.findAlbumByMb(alstr).getMbid() == null)
				abdao.updateAlbum(null, b);
			b = abdao.findAlbumByMb(alstr);
			}
		}

		String artUrl = "";
		if(err==0)
		{
	%>

	<div class="container">

		<div class="jumbotron">
			<form>
				<h1>
					<a href="<%=b.getUrl()%>"><%=b.getName()%></a>
				</h1>
			</form>

			<p>
				<a href="<%=b.getArtist().getUrl()%>"><%=b.getArtist().getName()%></a>
			</p>
			<p>
				<img src="<%=b.getImage()%>"></img>
			</p>
			<p><%=b.getSummary()%></p>

		</div>
	</div>

	<a href="hello.jsp">return</a>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
<% }else{%><h1>sorry,have tried hard but can't find the album</h1>
<a href="hello.jsp">return</a>
<%} %>
</html>

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
		MusicClient msc = new MusicClient();
		Music m = new Music();

		PlayList2Music p2m = new PlayList2Music();
		PlayListDao playlistdao = new PlayListDao();

		PlayList2MusicDao p2mdao = new PlayList2MusicDao();
		String action1 = request.getParameter("action");
		String action = request.getParameter("search");
		String artist = request.getParameter("artist");
		String playliststr = request.getParameter("pId");
		String track = request.getParameter("track");
		Integer playlistid = null;
		if (playliststr != null)
			playlistid = Integer.parseInt(playliststr);
		String mbstr = request.getParameter("musicid");
		if (mbstr != null) {
			m = msc.findSongByMBID(mbstr);
			musicdao.createMusic(m);
			p2m.setMusic(m);
			p2m.setPlaylist(playlistdao.findPlayList(playlistid));
			p2mdao.createPlayList2Music(p2m);

		}

		String artUrl = "";

		if (artist != null) {
			m = msc.findSongByNameAndArtist(artist, track);
		}
	%>

	<div class="container">

		<div class="jumbotron">
            <form>
			<h1><%=m.getName()%></h1>
			</form>
			<p>
				<a href="chooseplaylist.jsp?id=<%=m.getMbid()%>">addtoplaylist</a>
			</p>
			<p>
				<a href=<%=m.getArtist().getUrl()%>><%=m.getArtist().getName()%></a>
			</p>
			<P>
				<a href=<%=m.getAlbum().getUrl()%>><%=m.getAlbum().getName()%></a>
			</P>
			<p><%=m.getSummary()%></p>

		</div>


	</div>






	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>

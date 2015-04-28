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
<title>Music Detail</title>
</head>
<body>
	<%
		ArtistClient asc = new ArtistClient();
		AlbumClient bsc = new AlbumClient();
		MusicDao musicdao = new MusicDao();
		ArtistDao atidao = new ArtistDao();
		AlbumDao abdao = new AlbumDao();
		MusicClient msc = new MusicClient();
		Music m = new Music();
		Artist art = new Artist();
		Album b = new Album();
		String alstr = "";
		String atstr = "";
		int k1 = 0;
		int k2 = 0;
		int k3 = 0;
		PlayList2Music p2m = new PlayList2Music();
		PlayListDao playlistdao = new PlayListDao();
		PlayList2MusicDao p2mdao = new PlayList2MusicDao();
		String action1 = request.getParameter("action");
		String action = request.getParameter("search");
		String artist = request.getParameter("artist");
		String playliststr = request.getParameter("pId");
		String track = request.getParameter("track");
		System.out.println(artist);
		System.out.println(track);
		
		int err=0;
		if ((artist != null) & (track != null)) {
			
			artist = URLEncoder.encode(artist, "UTF-8");
			track = URLEncoder.encode(track, "UTF-8");
			String FIND_SONG_BY_NAME_AND_ARTIST = "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=14debcea4d95e934a86515e3327ee949&artist=ARTIST&track=TRACK&format=json";
					 String FIND_SONG_BY_MBID = "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=14debcea4d95e934a86515e3327ee949&mbid=MBID&format=json";
					String urlStr = FIND_SONG_BY_NAME_AND_ARTIST.replace("ARTIST", artist)
								.replace("TRACK", track);
						String json = msc.getJsonStringForUrl(urlStr);
						json = json.substring(2, 7);
						if("error".equals(json))
							err=1;
						
			
		}

		System.out.println(artist);
		System.out.println(track);

		Integer playlistid = null;
		String mbid = "";
		if (playliststr != null)
			playlistid = Integer.parseInt(playliststr);
		String mbstr = request.getParameter("musicid");
		String mbs = "";







		if (artist != null) {
			
			if(err==1)
			{
				m=new Music(null,null,null,null,null,null,null,null,null);
			}
			else
			{
				m = msc.findSongByNameAndArtist(artist, track);
			mbs = m.getMbid();
			alstr = m.getAlbum().getMbid();
			b = bsc.findAlbumByMBID(alstr);
			atstr = b.getArtist().getMbid();
			b = bsc.findAlbumByMBID(alstr);
			art = asc.findArtistByMBID(atstr);
			m.setAlbum(null);
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
			m.setAlbum(b);
			if (musicdao.findMusicByMB(mbs).getMbid() == null)
				musicdao.updateMusic(null, m);
			m = musicdao.findMusicByMB(mbs);
			session.setAttribute("mbt", m.getMsid());
			}

		}

		if (mbstr != null) {
			m = musicdao.findMusicByMB(mbstr);

			p2m.setMusic(m);
			p2m.setPlaylist(playlistdao.findPlayList(playlistid));
			p2mdao.updatePlayList2Music(null, p2m);
		}

		String artUrl = "";

		// JSP codes to add a new comment 

		String useridStr = (String) session.getAttribute("userid");
		Integer uId = Integer.parseInt(useridStr);
		UserDao udao = new UserDao();
		User user = udao.findUser(uId);
		String act = request.getParameter("act");
		String name = request.getParameter("name");
		String title = request.getParameter("title");

		CommentDao cdao = new CommentDao();
		if ("create".equals(act)) {
			Integer mbt = (Integer) session.getAttribute("mbt");
			m = musicdao.findMusic(mbt);

			Comment comment = new Comment(null, title, name, user, m);
			cdao.createComment(comment);

		}

		// JSP codes to display comments
		List<Comment> comments = new ArrayList<Comment>();
		List<Comment> commentss = cdao.findAllComments();
		for (Comment c : commentss) {
			if (c.getMusic().getMsid() == m.getMsid())
				comments.add(c);
		}
if(err==0)
	
{
%>


	<div class="container">

		<div class="jumbotron">
			<form>
				<h1><%=m.getName()%></h1>
			</form>
			<p>
				<a type="button" class="btn btn-primary"
					href="chooseplaylist.jsp?id=<%=m.getMbid()%>">Add To Playlist</a>
			</p>
			<p>
				<a href=<%=m.getAlbum().getArtist().getUrl()%>>Artist: <%=m.getAlbum().getArtist().getName()%></a>
			</p>
			<P>
				<a href=<%=m.getAlbum().getUrl()%>>Album: <%=m.getAlbum().getName()%></a>
			</P>
				<p>Music Tag:<a href="musictag.jsp?type=<%=m.getTag()%>"><%=m.getTag()%></a></p>
			<p><%=m.getSummary()%></p>

		</div>

		<!-- Display comments -->
		<%
			if (comments.isEmpty() != true) {
		%>
		<div class="jumbotron">
			<%
				for (Comment cmt : comments) {
			%>
			<div id="comment">
				<h3>
					Title:
					<%=cmt.getTitle()%></h3>
				<p>
					<a href="fol-profile.jsp?id=<%=cmt.getUser().getuId()%>">Username:
						<%=cmt.getUser().getUsername()%></a>
				</p>
				<p>
					Content:
					<%=cmt.getContent()%>
				</p>
			</div>
			<br>
			<%
				}
			%>
		</div>
		<%
			}
		%>
		<!-- Add a new comment -->
		<form action="DisplaySong.jsp">
			<div class="jumbotron">
				<input type="text" name="title" placeholder="Title..."></input><br />
				<textarea rows="3" cols="100" name="name" placeholder="Comment..."></textarea>
				<br>
				<button class="btn btn-primary" type="submit" name="act"
					value="create">Submit</button>
			</div>
		</form>


	</div>

	<a href="hello.jsp">return</a>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>

<% }
else
{%><h1>sorry, have tried hard but can't find the music</h1>
<a href="hello.jsp">return</a><%}%>
</html>

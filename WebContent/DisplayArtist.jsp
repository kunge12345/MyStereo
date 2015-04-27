<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.*"%>
<%@page import="org.eclipse.persistence.internal.libraries.antlr.runtime.MismatchedNotSetException"%>
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
	   
	    ArtistDao atidao = new ArtistDao();
	   
		Artist art=new Artist();
		
		
		String atstr="";
		String artist = request.getParameter("artist");
		if((artist!=null)){
			artist = URLEncoder.encode(artist,"UTF-8");
			
		}


		
		
		
		
		
        
		if (artist != null) {
			
		
			
			art=asc.findArtistByName(artist);
			atstr=art.getMbid();
			
			art.setAlbums(null);
			if(atidao.findArtistByMb(atstr).getMbid()==null)
			atidao.createArtist(art);
			art=atidao.findArtistByMb(atstr);
		
			
	
		}
		
		
		

		
		

		

	%>

	<div class="container">

		<div class="jumbotron">
            <form>
			<h1><a href=<%=art.getUrl()%>><%=art.getName()%></a></h1>
			</form>
		
				
			<img src="<%=art.getImage()%>"></img>
			<br />
			<p><%=art.getSummary()%></p>

		</div>
		</div>

<a href="hello.jsp">return</a>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>

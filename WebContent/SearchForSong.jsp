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
<title>Search</title>
</head>
<body>


	<div class="container">
	<h3>search for song</h3>
		<form action="DisplaySong.jsp">
			<table class="table table-striped">
				<tr>
					<th>artist</th>
					<th>track</th>
					<th>&nbsp;</th>
				</tr>
				<tr>
					<td><input name="artist" class="form-control" /></td>
					<td><input name="track" class="form-control" /></td>
					<td>
						<button class="btn btn-primary" type="submit" name="action"
							value="search">Search</button>
					</td>
				</tr>
			</table>
			<h3>search for album</h3>
		</form>
				<form action="DisplayAlbum.jsp">
			<table class="table table-striped">
				<tr>
					<th>artist</th>
					<th>album</th>
					<th>&nbsp;</th>
				</tr>
				<tr>
					<td><input name="artist" class="form-control" /></td>
					<td><input name="album" class="form-control" /></td>
					<td>
						<button class="btn btn-primary" type="submit" name="action"
							value="search">Search</button>
					</td>
				</tr>
			</table>
		</form>
			<h3>search for artist</h3>
				<form action="DisplayArtist.jsp">
			<table class="table table-striped">
				<tr>
					<th>artist</th>
					
					<th>&nbsp;</th>
				</tr>
				<tr>
					<td><input name="artist" class="form-control" /></td>
					<td>
						<button class="btn btn-primary" type="submit" name="action"
							value="search">Search</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
<a href="hello.jsp">return</a>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>
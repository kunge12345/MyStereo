
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="edu.neu.cs5200.mystereo.DAO.*, edu.neu.cs5200.mystereo.models.*,java.util.*"%>
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

<title>Fol-profile</title>
</head>
<body>
	<%
	     String checkidStr=(String)session.getAttribute("userid");
	     Integer checkid=Integer.parseInt(checkidStr);
	
	
	String action = request.getParameter("action");
		UserDao dao = new UserDao();
		FollowDao dao2 = new FollowDao();
		User admin=dao.findUser(checkid);
		String idStr = request.getParameter("id");
		Integer id = Integer.parseInt(idStr);
		User user = dao.findUser(id);
		List<Follow> follows = new ArrayList<Follow>();
		follows = dao2.findFollowbyuid(id);
		List<Follow> followeds = new ArrayList<Follow>();
		followeds = dao2.findFollowedbyuid(id);
		CommentDao dao3 = new CommentDao();
		String cidStr = request.getParameter("cid");
		Integer cid = 0;
		if (cidStr != null) {
			cid = Integer.parseInt(cidStr);
		} 
		if ("deletecomment".equals(action)) {
			dao3.removeComment(cid);
		}
		List<Comment> comments = new ArrayList<Comment>();
		comments = dao3.findAllComments();
	%>
	<h1>Profiles</h1>
	<div class="container">
		<form action="Profiledetails.jsp">
			<table class="table table-striped">
				<tr>
					<th>username</th>
					<th>sex</th>
					<th>description</th>
					<th>type</th>
					<th>&nbsp;</th>
				</tr>
				<tbody>

					<tr>
						<td><%=user.getUsername()%></td>
						<td><%=user.getSex()%></td>
						<td><%=user.getDescription()%></td>
						<td><%=user.getType()%></td>
					</tr>

				</tbody>
			</table>
		</form>
	</div>
	<h1>
		Who
		<%=user.getUsername()%>
		follows...
	</h1>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th>username</th>
				<th>profile</th>
				<th>playlists</th>
			</tr>
			<tbody>

				<%
					for (Follow f : followeds) {
				%>
				<tr>
					<td><%=f.getFollowed().getUsername()%></td>
					<td><a href="fol-profile.jsp?id=<%=f.getFollowed().getuId()%>">
							profile</a></td>
					<td><a
						href="fol-playlist.jsp?id=<%=f.getFollowed().getuId()%>">
							playlist</a></td>
				</tr>
				<%
					}
				%>
			</tbody>

		</table>
	</div>
	<h1>
		who follow
		<%=user.getUsername()%>

	</h1>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th>username</th>
				<th>profile</th>
				<th>playlists</th>
			</tr>
			<tbody>

				<%
					for (Follow f : follows) {
				%>
				<tr>
					<td><%=f.getFollow().getUsername()%></td>
					<td><a href="fol-profile.jsp?id=<%=f.getFollow().getuId()%>">
							profile</a></td>
					<td><a href="fol-playlist.jsp?id=<%=f.getFollow().getuId()%>">
							playlist</a></td>
				</tr>
				<%
					}
				%>
			</tbody>

		</table>
	</div>
	<h1><%=user.getUsername()%> comments</h1>


		<%
			for (Comment comment : comments) {
				if (comment.getUser().getuId() == user.getuId()) {
		%>

		<div class="jumbotron">
			<table>
				<tr>
					<td>Music: <a
					href="musicDetails.jsp?id=<%=comment.getMusic().getMsid()%>"><%=comment.getMusic().getName()%></a></th>
				</tr>
				<tr>
					<td>
					Title:<%=comment.getTitle()%><%if(admin.getType().equals("admin"))
					{
					%><a
						href="Profiledetails.jsp?cid=<%=comment.getId()%>&action=deletecomment&id=<%=user.getuId() %>"
						type="button" class="btn btn-danger"> delete</a>
						<%} %>
						</td>
				</tr>
				<tr>
					<td>Content:<%=comment.getContent()%></td>
				</tr>
			</table>
		</div><%}} %>
		
	<a href="hello.jsp?id=<%=checkid%>">return</a>
		
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
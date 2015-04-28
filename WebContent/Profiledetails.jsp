
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
<title>Personal Profile</title>
</head>
<body>
	<%
		UserDao dao = new UserDao();
		FollowDao dao2 = new FollowDao();
		User user2 =new User(); 
		String message = (String) (session.getAttribute("userid"));
		Integer id = Integer.parseInt(message);
		if ("admin".equals(dao.findUser(id).getType())) {
			if (request.getParameter("id") != null)
				session.setAttribute("invest", request.getParameter("id"));
			id = Integer.parseInt((String) session.getAttribute("invest"));

		}
		User user = dao.findUser(id);
		String action = request.getParameter("action");
		String username1 = request.getParameter("username1");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String description = request.getParameter("description");
		user2=dao.findUserbyName(username);
	
		int error=0;
      if(user2.getUsername()==null&"add".equals(action))
    		error=1;
    	  
		if ("update".equals(action)) {
			User newuser = new User(user.getuId(), username1, password, sex,
					description, user.getPlaylists(), user.getFollows(),
					user.getFolloweds(), user.getComments(), "user");
			dao.updateUser(user.getuId(), newuser);
		}
		String fidStr = request.getParameter("fid");
		Integer fid = 0;
		if (fidStr != null) {
			fid = Integer.parseInt(fidStr);
		}
		String cidStr = request.getParameter("cid");
		Integer cid = 0;
		if (cidStr != null) {
			cid = Integer.parseInt(cidStr);
		}
		if ("delete".equals(action)) {
			dao2.removeFollow(fid);
		}
		
		if(error==0)
		{
		if ("add".equals(action)) {
			Follow newfollow = new Follow(null, user,
					dao.findUserbyName(username));
			dao2.updateFollow(null, newfollow);}
		}
		List<Follow> follows = new ArrayList<Follow>();
		follows = dao2.findFollowbyuid(id);
		List<Follow> followeds = new ArrayList<Follow>();
		followeds = dao2.findFollowedbyuid(id);
		CommentDao dao3 = new CommentDao();
		if ("deletecomment".equals(action)) {
			dao3.removeComment(cid);
		}
		List<Comment> comments = new ArrayList<Comment>();
		comments = dao3.findAllComments();
	%>
	
	<div class="container">
		<div class="container">
			<h1><%=user.getUsername()%>'s Profile
			</h1>
			<form action="Profiledetails.jsp">
				<table class="table table-striped">
					<tr>
						<th>username</th>
						<th>password</th>
						<th>sex</th>
						<th>description</th>
						<th>type</th>
						<th>&nbsp;</th>
					</tr>

					<tbody>
						
						<tr>
							<td><input name="username1" class="form-control"value=<%=user.getUsername()%>></td>
							<td><input name="password" class="form-control"value=<%=user.getPassword()%>></td>
							<td><input name="sex" class="form-control"value=<%=user.getSex()%>></td>
							<td><input name="description" class="form-control"value=<%=user.getDescription()%>></td>
							<td><%=user.getType()%></td>
							<td>
								<button class="btn btn-primary" type="submit" name="action"
									value="update">update</button>
							</td>
						</tr>      
					</tbody>
				</table>
			</form>
		</div>
		<h1>
			Who you(<%=user.getUsername()%>) follow...
		</h1>
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
							playlists</a></td>
					<td><a
						href="Profiledetails.jsp?fid=<%=f.getFid()%>&action=delete"
						type="button" class="btn btn-danger"> delete</a></td>
				
				</tr>
				<%
					}
				%>

			</tbody>

		</table>
		<div class="container">
			<form action="Profiledetails.jsp">
				<table class="table table-striped">

					<tr>
						<td><input name="username" class="form-control" /></td>
						<td>
							<button class="btn btn-primary" type="submit" name="action"
								value="add">add</button>
								<% if(error==1)
		out.println("username can't be find");%>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<h1>
			Who follows you(<%=user.getUsername()%>)...
		</h1>
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
		<h1>your comments</h1>


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
					<td>Title:<%=comment.getTitle()%><a
						href="Profiledetails.jsp?cid=<%=comment.getId()%>&action=deletecomment"
						type="button" class="btn btn-danger"> delete</a></td>
				</tr>
				<tr>
					<td>Content:<%=comment.getContent()%></td>
				</tr>
			</table>
		</div>
		<%
			}
			}
		%>

	</div>
	<a
		href="hello.jsp?id=<%=Integer.parseInt((String) session.getAttribute("userid"))%>">return</a>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
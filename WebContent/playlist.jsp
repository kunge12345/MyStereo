<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "edu.neu.cs5200.mystereo.DAO.*, edu.neu.cs5200.mystereo.models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Playlist</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<%
		UserDao dao2 = new UserDao();
			PlayListDao dao = new PlayListDao();
		
			String message = (String)(session.getAttribute("userid"));
			Integer idd=Integer.parseInt(message);
			String action = request.getParameter("action");
			String idStr  = request.getParameter("id");
			String name  = request.getParameter("name");
			Integer id=null;
			if(idStr!=null)
			id = Integer.parseInt(idStr);
			
					
			if("create".equals(action))
			{
				User user=dao2.findUser(idd);
				 PlayList play = new PlayList(null, name, user, null);
				dao.createPlayList( play); 
			}
			else if("delete".equals(action))
			{
				dao.removePlayList(id);
			}
				
			List<PlayList> playlists = dao.findAllPlayLists(idd);
		%>
		<h1>
			PlayLists
		</h1>
		<form action="playlist.jsp">
		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td><input name="name" class="form-control"/></td>
				<td>
					<button class="btn btn-primary" type="submit" name="action" value="create" name="idd" value=idd>Create</button>
				</td>
			</tr>
		<%
			for(PlayList playlist : playlists)
			{
		%>	<tr>
				<td>
					<a href="playlistDetails.jsp?id=<%= playlist.getpId() %>">
					<%= playlist.getTitle() %>
					</a>
				<td>
					<a href="playlist.jsp?action=delete&id=<%= playlist.getpId() %>" class="btn btn-danger">Delete</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
		<a href=hello.jsp>return</a>
		</form>
	</div>
</body>
</html>
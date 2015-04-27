<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "edu.neu.cs5200.mystereo.DAO.*, edu.neu.cs5200.mystereo.models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Playlist Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<%PlayList2MusicDao dao2=new PlayList2MusicDao();
		PlayListDao dao = new PlayListDao();
		
		String iddStr  = request.getParameter("idd");
		Integer idd=null;
		if(iddStr!=null)
		idd = Integer.parseInt(iddStr);
			String action = request.getParameter("action");
			String idStr  = request.getParameter("id");
			Integer id=null;
			if(idStr!=null)
			id = Integer.parseInt(idStr);
			
					
			
				
		     if("delete".equals(action))
			{
				dao2.removePlayList2Music(idd);
			}
				
			List<PlayList2Music> p2m = dao2.findMusicbyPid(id);
		%>
		<h1>
			My music
		</h1>
		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>&nbsp;</th>
			</tr>
		<%
			for(PlayList2Music play : p2m)
			{
		%>	<tr>
				<td>
					<a href="musicDetails.jsp?id=<%= play.getMusic().getMsid() %>">
					<%= play.getMusic().getName() %>
					</a>
				<td>
					<a href="playlistDetails.jsp?action=delete&id=<%= play.getPlaylist().getpId()%>&idd=<%= play.getId() %>" class="btn btn-danger">Delete</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
		<a href=hello.jsp>return</a>
	</div>
</body>
</html>
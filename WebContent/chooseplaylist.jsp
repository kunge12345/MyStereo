<%@page import="edu.neu.cs5200.mystereo.client.MusicClient,edu.neu.cs5200.mystereo.DAO.*"%>
<%@page import="edu.neu.cs5200.mystereo.models.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<%
		UserDao dao2 = new UserDao();
			PlayListDao dao = new PlayListDao();
		
			String message = (String)(session.getAttribute("userid"));
			Integer idd=Integer.parseInt(message);
			String idStr  = request.getParameter("id");
			List<PlayList> playlists = dao.findAllPlayLists(idd);
		%>
		<h1>
			PlayLists
		</h1>
		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>&nbsp;</th>
			</tr>
		<%
			for(PlayList playlist : playlists)
			{
		%>	<tr>
				<td>
					<a href="DisplaySong.jsp?musicid=<%=idStr%>&pId=<%=playlist.getpId()%>">
					<%= playlist.getTitle()%>
					</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
	</div>
</body>
</html>
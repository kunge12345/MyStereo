<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "edu.neu.cs5200.mystereo.DAO.*, edu.neu.cs5200.mystereo.models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<%
			PlayListDao dao = new PlayListDao();
			String idStr= request.getParameter("id");
			Integer idd =Integer.parseInt(idStr);
			
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
					<a href="fol-playDetails.jsp?id=<%= playlist.getpId() %>">
					<%= playlist.getTitle() %>
					</a>
			</tr>
		<%
			}
		%>
		</table>
		<a href=hello.jsp>return</a>

	</div>
</body>
</html>
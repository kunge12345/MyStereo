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
		<%MusicDao dao=new MusicDao();
		
		String type  = request.getParameter("type");

				
			List<Music> ms = dao.findAllMusics();
		%>
		<h1>
			<%=type %>  music
		</h1>
		<table class="table table-striped">
			<tr>
				<th>name</th>
				<th>&nbsp;</th>
			</tr>
		<%
for(Music play:ms){
	if(play.getTag().equals(type)){
		%>	<tr>
				<td>
					<a href="musicDetails.jsp?id=<%= play.getMsid() %>">
					<%= play.getName()%>
					</a>
					</td>
			
			</tr>
		<%
			}
			}
		%>
		</table>
		<a href=hello.jsp>return</a>
	</div>
</body>
</html>
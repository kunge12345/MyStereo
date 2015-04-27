
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "edu.neu.cs5200.mystereo.DAO.*, edu.neu.cs5200.mystereo.models.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
UserDao dao = new UserDao();
FollowDao dao2= new FollowDao();
String idStr=request.getParameter("id");
Integer id=Integer.parseInt(idStr);
User user=dao.findUser(id);
   List<Follow> follows=new ArrayList<Follow>();
   follows=dao2.findFollowbyuid(id);
   List<Follow> followeds=new ArrayList<Follow>(); followeds=dao2.findFollowedbyuid(id);
%>
<h1>
			Profiles
		</h1>
	<div class="container">
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
					<td><%= user.getUsername() %></td>
					<td><%= user.getPassword() %></td>
					<td><%= user.getSex() %></td>
					<td><%= user.getDescription() %></td>
					<td><%= user.getType() %></td>
				</tr> 
	
			</tbody>
		</table>
		</form>
	</div>
	<h1>
	who  you follow
	</h1><table>
				<tr>
				<th>username</th>
			</tr>
			<tr>
		<% 
		for(Follow f:followeds) 
		{
		%>	
				<th><%=f.getFollowed().getUsername() %></th><th><a href="fol-profile.jsp?id=<%=f.getFollowed().getuId() %>"> profile</a></th><th><a href="fol-playlist.jsp?id=<%=f.getFollowed().getuId() %>"> playlist</a></th>
		<%
		}
			%>
			</tr>
			</table>
	<h1>
	who follow you
	
	</h1><table>
				<tr>
				<th>username</th>
			</tr>
			<tr>
		<% 
		for(Follow f:follows) 
		{
		%>	
				<th><%=f.getFollow().getUsername() %></th><th><a href="fol-profile.jsp?id=<%=f.getFollow().getuId() %>"> profile</a></th><th><a href="fol-playlist.jsp?id=<%=f.getFollow().getuId() %>"> playlist</a></th>
					<%
		}
			%>
			</tr>
			</table>
	<a href="hello.jsp?id=<%= Integer.parseInt((String)session.getAttribute("userid")) %>" >return</a>   
</body>
</html>
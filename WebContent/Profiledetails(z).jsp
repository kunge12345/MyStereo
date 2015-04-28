
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
String message = (String)(session.getAttribute("userid"));
Integer id=Integer.parseInt(message);
if("admin".equals(dao.findUser(id).getType()))
		{
	if(request.getParameter("id")!=null)
	session.setAttribute("invest",  request.getParameter("id"));
	id=Integer.parseInt((String)session.getAttribute("invest"));
	
		}
User user=dao.findUser(id);
String action = request.getParameter("action");
String username  = request.getParameter("username");
String password  = request.getParameter("password");
String sex  = request.getParameter("sex");
String description  = request.getParameter("description");
	
if("update".equals(action))
{
	 User newuser = new User(user.getuId(), username,password,sex,description,user.getPlaylists(),user.getFollows(),user.getFolloweds(),user.getComments(),"user");
	dao.updateUser(user.getuId(),newuser); 
}
String fidStr  = request.getParameter("fid");
Integer fid=0;
if(fidStr!=null)
{
      	fid=Integer.parseInt(fidStr);
}
if("delete".equals(action))
{
	dao2.removeFollow(fid);
}
if("add".equals(action))
{
	 Follow newfollow = new Follow(null, user,dao.findUserbyName(username));
	dao2.updateFollow(null,newfollow); 
}
   List<Follow> follows=new ArrayList<Follow>();
   follows=dao2.findFollowbyuid(id);
   List<Follow> followeds=new ArrayList<Follow>(); followeds=dao2.findFollowedbyuid(id);
   CommentDao dao3=new CommentDao();
   List<Comment> comments=new ArrayList<Comment>();
   comments=dao3.findAllComments();
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
			<tr>
				<td><input name="username" class="form-control"/></td>
				<td><input name="password" class="form-control"/></td>
				<td><input name="sex" class="form-control"/></td>
				<td><input name="description" class="form-control"/></td>
	<td>&nbsp;</td>
				<td>
					<button class="btn btn-primary" type="submit" name="action" value="update">update</button>
				</td>
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
					<th><a href="Profiledetails.jsp?fid=<%=f.getFollowed().getuId() %>&action=delete"> delete</a></th><%
		}
			%>
			</tr>
			</table>
	<div class="container">
		<form action="Profiledetails.jsp">
		<table class="table table-striped">
		
			<tr>
				<td><input name="username" class="form-control"/></td>
								<td>
					<button class="btn btn-primary" type="submit" name="action" value="add">add</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
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
			
				<h1>
	your comment
	
	</h1><table>
			<tr>
		<% 
		for(Comment comment:comments)
		{
		      if(comment.getUser().getuId()==user.getuId())
		{%>	
		
				<tr><th>for music: <a href="musicDetails.jsp?id=<%=comment.getMusic().getMsid() %>"><%=comment.getMusic().getName() %></a></th></tr>
				<tr><th>title:<%=comment.getTitle() %></th></tr>
					<tr><th>content:<%=comment.getContent() %></th></tr><%
		}
		      }
			%>
			</table>
	<a href="hello.jsp?id=<%= Integer.parseInt((String)session.getAttribute("userid")) %>" >return</a>   
</body>
</html>
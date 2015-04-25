<% String message = (String)(request.getAttribute("message")); %>
<form id = "form1" action = "seruserlogin" method = "post">
        <table border="1" style="border-collapse:collapse;">
            <tr align = "center">
                <td colspan="2">login</td>    
            </tr>
            <tr>
                <td>username</td>
                <td>
                    <input type = "text" name = "userName"/>
                </td>
                
            </tr>
            <tr>
                <td>password</td>
                <td>
                    <input type = "password" name = "userPassword"/>        
                    <span style = "color:red; font-size:13px;" id = "td2"><%if (message!=null)
                    out.println(message);%></span>
                </td>
            </tr>
            <tr align = "center">
                <td colspan = "2">
                    <input type = "submit" name="login" value ="log"/>
                     <a href="http://localhost:8080/MyStereo/userregister.jsp">              not an user yet?                        </a>
                </td>    
            </tr>
        </table>
    </form>
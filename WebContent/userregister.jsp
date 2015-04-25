<form action="seruserregister" method="post">
            <table border="1" style="border-collapse: collapse;">
                <tr>
                    <td colspan="2">userreg</td>
                </tr>
                <tr>
                    <td>username</td>
                    <td><input type="text" name="userName" /></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><input type="password" name="userPassword" /></td>
                </tr>
                <tr>
                    <td>sex</td>
                    <td>
                        <input type="radio" name="userSex" value="male" checked="checked" />male
                        <input type="radio" name="userSex" value="female" />female
                    </td>
                </tr>
                
                <tr>
                    <td>description</td>
                    <td>
                        <textarea cols="10" rows="3" name="userDescribe"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="tdstyle" colspan="2">
                        <input type="submit" value="register" />
                    </td>
                </tr>
            </table>
    </form>
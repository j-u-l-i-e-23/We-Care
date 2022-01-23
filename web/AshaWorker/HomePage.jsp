<%-- 
    Document   : HomePage.jsp
    Created on : Sep 25, 2021, 10:40:47 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome <%=session.getAttribute("awname")%></h1>
        <ul>
            <li>
                <a href="MyProfile.jsp">My Profile</a>
                
            </li>
            <li>
                <a href="EditProfile.jsp">Edit Profile</a>
            </li>
            <li>
                <a href="changepassword.jsp">Change Password</a>
            </li>
        </ul>
    </body>
</html>

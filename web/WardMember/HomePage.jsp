<%-- 
    Document   : HomePage.jsp
    Created on : Sep 24, 2021, 3:33:51 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Welcome <%=session.getAttribute("wmname")%></h1>
        <ul>
            <li>
                <a href="MyProfile.jsp">My Profile</a>
            </li>
            <li>
                <a href="EditProfile.jsp">Edit Profile</a>
            </li>
            <li>
                <a href="changePassword.jsp">Change Password</a>
            </li>
            <li>
                <a href="ContainmentZone.jsp">Containment Zone</a>
            </li>
            <li>
                <a href="Ashaworker.jsp">Ashaworker Registration</a>
            </li>
            <li>
                <a href="NewFamilyRegistration.jsp">New Family</a>
            </li>
            <li>
                <a href="AcceptedFamily.jsp">Accepted Family</a>
            </li>
            <li>
                <a href="RejectedFamily.jsp">Rejected Family</a>
            </li>
            <li>
                <a href="ViewFamily.jsp">View Family</a>
            </li>
        </ul>
    </body>
</html>

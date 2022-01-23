<%-- 
    Document   : AcceptedFamily.jsp
    Created on : Oct 9, 2021, 11:39:45 AM
    Author     : User
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if (request.getParameter("rid")!=null)
                     {
                         String up = "update tbl_family set family_vstatus='2' where family_id='" +request.getParameter("rid")+ "'";

                         {
                             con.executeCommand(up);
                             response.sendRedirect("NewSFamilyRegistration.jsp");
                         }
                     }
                %>
        <table border="1" align='center'>
            <tr>
                <th>Sl.No</th>
                <th>House Name</th>
                <th>House Number</th>
                <th>Ration Card Number</th>
                <th>Ration Card Proof</th>
                <th>No. of Family Members</th>
                <th>Place</th>
                <th>Ward</th>
                <th>Date of Join</th>
                <th>Action</th>
            </tr>
            <%
                int i = 0;
                String sel = "select * from tbl_family f inner join tbl_wardplaces p on p.wp_id=f.wp_id inner join tbl_ward w on f.ward_id=w.ward_id where f.ward_id='"+session.getAttribute("wid")+"' and family_vstatus='1'";
                ResultSet rs = con.selectCommand(sel);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("family_hname")%></td>
                 <td><%=rs.getString("family_hno")%></td>
                 <td><%=rs.getString("family_rno")%></td>
                <td><img src="../Assets/FamilyProof/<%=rs.getString("family_rproof")%>" width="120" height="120"></td>
                <td><%=rs.getString("family_memno")%></td>
                <td><%=rs.getString("wp_name")%></td>
                <td><%=rs.getString("ward_no")%></td>
                <td><%=rs.getString("family_doj")%></td>
                <td>
                    
                    <a href="NewFamilyRegistration.jsp?rid=<%=rs.getString("family_id")%>">Reject</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

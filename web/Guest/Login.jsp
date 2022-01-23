<%-- 
    Document   : Login
    Created on : Sep 24, 2021, 3:08:51 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <%
        if(request.getParameter("btn_login")!=null)
        {
            String uname= request.getParameter("txt_uname");
            String pass=request.getParameter("txt_pass");
            
            String selU="select * from tbl_family where family_uname='"+uname+"' and family_password='"+pass+"' and family_vstatus='1'";
            ResultSet rsU=con.selectCommand(selU);
            
            String selW="select * from tbl_wardmember wm inner join tbl_wardplaces w on wm.wp_id=w.wp_id inner join tbl_ward a on a.ward_id=w.ward_id where wm_uname='"+uname+"' and wm_password='"+pass+"'";
            ResultSet rsW=con.selectCommand(selW);
            
            String selD="select * from tbl_doctor where doctor_uname='"+uname+"' and doctor_password='"+pass+"'";
            ResultSet rsD=con.selectCommand(selD);
            
            String selA="select * from tbl_admin where admin_uname='"+uname+"' and admin_password='"+pass+"'";
            ResultSet rsA=con.selectCommand(selA);
            
            String selAs="select * from tbl_ashaworker where aw_uname='"+uname+"' and aw_password='"+pass+"'";
            ResultSet rsAs=con.selectCommand(selAs);
            
            if(rsU.next())
            {
                session.setAttribute("uid",rsU.getString("family_id"));
                //session.setAttribute("fmid",rsU.getString("member_id"));
                session.setAttribute("uname",rsU.getString("family_hname"));
                response.sendRedirect("../User/HomePage.jsp");
            }
            else if(rsW.next())
                    {
                        session.setAttribute("wmid",rsW.getString("wm_id"));
                        session.setAttribute("wid",rsW.getString("ward_id"));
                        session.setAttribute("wmname",rsW.getString("wm_name"));
                        
                        response.sendRedirect("../WardMember/HomePage.jsp");
                    }
            else if(rsD.next())
                    {
                        session.setAttribute("did",rsD.getString("doctor_id"));
                        session.setAttribute("dname",rsD.getString("doctor_name"));
                        response.sendRedirect("../Doctor/HomePage.jsp");
                    }
            else if(rsA.next())
                    {
                        session.setAttribute("aid",rsA.getString("admin_id"));
                        session.setAttribute("aname",rsA.getString("admin_uname"));
                        response.sendRedirect("../Admin/HomePage.jsp");
                    }
            else if(rsAs.next())
                    {
                        session.setAttribute("awid",rsAs.getString("aw_id"));
                        session.setAttribute("awname",rsAs.getString("aw_uname"));
                        response.sendRedirect("../AshaWorker/HomePage.jsp");
                    }
            
            else
            {
                
            }
        }
        %>
    <body>
        <form method="post">
            <div align="center">
                <table border="1">
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="txt_uname" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txt_pass" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" name="btn_login" value="Login"/></td>
                       
                    </tr>

                </table>
        </form>
    </body>
</html>

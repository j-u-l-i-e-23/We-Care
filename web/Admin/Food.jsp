<%-- 
    Document   : Ribbon.jsp
    Created on : Sep 21, 2021, 10:46:32 PM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"> </jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food</title>
    </head>
    <body>
        <%
            String editId = "", editName = "", editDesc = "";

            if (request.getParameter("btn_save") != null) {
                if (request.getParameter("txt_id") != "") {
                    String up = "update tbl_food set f_name='" + request.getParameter("txt_name") + "',f_desc='" + request.getParameter("txt_desc") + "' where f_id = '" + request.getParameter("txt_id") + "'";
                    con.executeCommand(up);
                } else {
                    String sel1 = "select * from tbl_food where f_name='" + request.getParameter("txt_name") + "' or f_desc='" + request.getParameter("txt_desc") + "'";
                    ResultSet res1 = con.selectCommand(sel1);
                    System.out.println(sel1);
                    if (!res1.next()) {
                        String ins = "insert into tbl_food(f_name,f_desc)values('" + request.getParameter("txt_name") + "','" + request.getParameter("txt_desc") + "')";
                        con.executeCommand(ins);
                        response.sendRedirect("Food.jsp");
                    } else {

                        out.println("<script>alert('Already Exists!!')</script");

                    }

                }
            }
            if (request.getParameter("delid") != null) {
                String del = "delete from tbl_food where f_id='" + request.getParameter("delid") + "'";
                con.executeCommand(del);
            }
            if (request.getParameter("edid") != null) {
                String sell = "select * from tbl_food where f_id='" + request.getParameter("edid") + "'";
                ResultSet rsl = con.selectCommand(sell);
                if (rsl.next()) {
                    editId = rsl.getString("f_id");
                    editName = rsl.getString("f_name");
                    editDesc = rsl.getString("f_desc");

                }
            }


        %>
        <form method="post" name="form2">
            <table border="1" cellpadding="10" style="border-collapse: collapse;" align="center">
                <tr><td>Food Name</td>
                    <td>
                        <input type="text" name="txt_name" id="txt_name" value="<%=editName%>" pattern="[A-Za-z]*$"required>
                        <input type="hidden" name="txt_id" value="<%=editId%>" id="txt_id" >
                    </td>
                </tr>
                <tr><td> Description</td>
                    <td><textarea id="txt_desc" name="txt_desc" rows="5" cols="50" required><%=editDesc%></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" id="btn_save" value="Save"><input type="reset" name="btn_cancel" id="btn_cancel" value="Cancel"></td>
                </tr>
            </table>
            <br>
            <hr>
            <br>
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <th>S1.no</th>
                    <th>Food Name</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
                <%
                    String sel = "select * from tbl_food";
                    int i = 0;
                    ResultSet rs = con.selectCommand(sel);
                    while (rs.next()) {
                        i++;


                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("f_name")%></td>
                    <td><%=rs.getString("f_desc")%></td>
                    <td><a href="Food.jsp?delid=<%=rs.getString("f_id")%>">Delete</a>
                        <a href="Food.jsp?edid=<%=rs.getString("f_id")%>">Edit</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>


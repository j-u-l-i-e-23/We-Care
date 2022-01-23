<%-- 
    Document   : ViewContainmentZone
    Created on : Oct 2, 2021, 11:27:58 AM
    Author     : User
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Containment Zones</title>
    </head>
    <body>
        <form>
            <table border="1" align="center" cellpadding="10">
                <caption>Containment Zone</caption>
                <tr>
                    <td colspan="3">
                        Level

                        <select name="sel_level" id="sel_level" onchange="getContainment()">
                            <option value="">--select--</option>
                            <%
                                String sel1 = "select * from tbl_ribbon";
                                ResultSet rs1 = con.selectCommand(sel1);
                                while (rs1.next()) {
                            %>
                            <option value="<%=rs1.getString("ribbon_id")%>"><%=rs1.getString("ribbon_color")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                    <td colspan="2">
                        Ward

                        <select name="sel_ward" id="sel_ward" onchange="getContainment()">
                            <option value="">--select--</option>
                            <%
                                String s = "select * from tbl_ward";
                                ResultSet r = con.selectCommand(s);
                                while (r.next()) {
                            %>
                            <option value="<%=r.getString("ward_id")%>"><%=r.getString("ward_no")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>

                </tr>
            </table>
            <br>
            <table border="1" align="center" id="table-id" cellpadding="10">
                <tr>
                    <th>S1.no</th>
                    <th>Ward</th>
                    <th>Place</th>
                    <th>Level</th>
                    <th>Date</th>

                </tr>
                <%
                    String sell = "select * from tbl_containmentzone c inner join tbl_wardplaces p on p.wp_id=c.wp_id inner join tbl_ward w on w.ward_id=p.ward_id inner join tbl_ribbon r where r.ribbon_id=c.ribbon_id order by w.ward_no";
                    int i = 0;
                    ResultSet rs2 = con.selectCommand(sell);
                    while (rs2.next()) {
                        i++;


                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs2.getString("ward_no")%></td>
                    <td><%=rs2.getString("wp_name")%></td>
                    <td><%=rs2.getString("ribbon_color")%></td>
                    <td><%=rs2.getString("cntnmnt_date")%></td>

                </tr>
                <%
                    }
                %>

            </table>
        </form>
                <script src="../Assets/Jq/jquery.js"></script>
        <script>
                                    function getContainment()
                                    {

                                        var level = document.getElementById("sel_level").value;
                                        var ward = document.getElementById("sel_ward").value;

                                        if (level !== "" && ward === "")
                                        {

                                            $.ajax({
                                                url: "../Assets/AjaxPages/AjaxContainment.jsp?lid=" + level,
                                                success: function(result) {
                                                    $("#table-id").html(result);
                                                }
                                            });

                                        }
                                        else if (level === "" && ward !== "")
                                        {
                                           $.ajax({
                                                url: "../Assets/AjaxPages/AjaxContainment.jsp?wid=" + ward,
                                                success: function(result) {
                                                    $("#table-id").html(result);
                                                }
                                            });
                                        }
                                        else if (level !== "" && ward !== "")
                                        {
                                            $.ajax({
                                                url: "../Assets/AjaxPages/AjaxContainment.jsp?wid=" + ward+"&lid="+level,
                                                success: function(result) {
                                                    $("#table-id").html(result);
                                                }
                                            });
                                        }



                                    }
        </script>
    </body>
</html>

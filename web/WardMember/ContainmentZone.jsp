<%-- 
    Document   : ContainmentZone.jsp
    Created on : Oct 1, 2021, 12:40:06 PM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"> </jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Containment Zone</title>
    </head>
    <%
    if(request.getParameter("btn_save")!=null)
    {
        
        String color=request.getParameter("sel_ribbon");
        
        String wardPlace = request.getParameter("sel_place");
        
        String ins = "insert into tbl_containmentzone(wp_id,ribbon_id,cntnmnt_date)values('"+wardPlace+"','"+color+"',curdate())";
        con.executeCommand(ins);
        //out.println(ins);
        
    }
    
    
    
    %>
    <body>
        
        <form method="post" name="contaimentzone">
            <table border="1" cellpadding="10" style="border-collapse: collapse;" align="center">
                
                <tr>
                    <td>Place</td>
                    <td>
                        
                        <select name="sel_place" id="sel_place">
                            <option>--select--</option>
                            <%
                            String sel2="select * from tbl_wardplaces where ward_id='"+session.getAttribute("wid")+"'";
                             ResultSet rs3 = con.selectCommand(sel2);
                            while(rs3.next())
                            {
                             %>
                                <option value="<%=rs3.getString("wp_id")%>"><%=rs3.getString("wp_name")%></option>
                            <%
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                <td>Level</td>
                    <td>
                        <select name="sel_ribbon" id="sel_ribbon">
                            <option>--select--</option>
                            <%
                 String sel1="select * from tbl_ribbon";
                 ResultSet rs1 = con.selectCommand(sel1);
                 while(rs1.next())
                 {
                     %>
                     <option value="<%=rs1.getString("ribbon_id")%>"><%=rs1.getString("ribbon_color")%></option>
                     <%
                 }
                 %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" id="btn_save" value="Save">
                        <input type="reset" name="btn_cancel" id="btn_cancel" value="Cancel">
                    </td>
                </tr>
            </table>
             <br>
            <hr>
            <br>
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <th>S1.no</th>
                    <th>Ward</th>
                    <th>Place</th>
                    <th>Level</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
                <%
             String sell="select * from tbl_containmentzone c inner join tbl_wardplaces p on p.wp_id=c.wp_id inner join tbl_ward w on w.ward_id=p.ward_id inner join tbl_ribbon r where r.ribbon_id=c.ribbon_id";
             int i=0;
             ResultSet rs2=con.selectCommand(sell);
             while(rs2.next())
             {
              i++;
                        
                    
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs2.getString("ward_no")%></td>
                    <td><%=rs2.getString("wp_name")%></td>
                    <td><%=rs2.getString("ribbon_color")%></td>
                    <td><%=rs2.getString("cntnmnt_date")%></td>
                    <td>
                        <a href="ContainmentZone.jsp?delid=<%=rs2.getString("cntnmnt_id")%>">Delete</a>
                        <a href="ContainmentZone.jsp?edid=<%=rs2.getString("cntnmnt_id")%>">Edit</a>
                    </td>
                </tr>
                <%
             }
                %>
      
                
        </form>
        <script src="../Assets/Jq/jquery.js"></script>
<script>
function getPlace(wid)
{
   
$.ajax({
url: "../Assets/AjaxPages/AjaxPlace.jsp?wid="+wid,
 success: function(result){
$("#sel_place").html(result);
               
 }
});
}
</script>
    </body>
</html>


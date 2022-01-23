<%-- 
    Document   : DiagnosisReport
    Created on : Dec 18, 2021, 1:46:13 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"> </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diagnosis Report</title>
    </head>
    <body>
        <table border="1" align='center'>
            <tr>
                <th>Sl.No</th>
                <th>Name</th>
                <th>Symptoms</th>
                <th>Date</th>
                <th>Result</th>

            </tr>
            <%
                int i = 0;
                String sel = "select * from tbl_viraldiseasereport v inner join tbl_familymembers fm on v.member_id=fm.member_id inner join tbl_viraldisease vd on v.vd_id=vd.vd_id where v.vdr_ispandemic='1' ";
                ResultSet rs = con.selectCommand(sel);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("member_name")%></td>
                <td>
                    <%
                        int z = 0;
                        String sel3 = "select * from tbl_viraldiseasesymptoms v inner join tbl_symptoms s on v.symp_id=s.symp_id where vdr_id='" + rs.getString("vdr_id") + "' ";
                        ResultSet rs3 = con.selectCommand(sel3);
                        while (rs3.next()) {
                            z++;
                            if (z == 1) {
                                out.println(rs3.getString("symp_name"));
                            } else {
                                out.println("," + rs3.getString("symp_name"));
                            }
                        }

                    %>
                </td>
                <td><%=rs.getString("vdr_date")%></td>
                <td><%=rs.getString("vd_name")%></td>
            </tr>
            <%                    }
                    %>
        </table>
    </body>
</html>

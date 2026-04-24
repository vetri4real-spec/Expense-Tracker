<%@ page import="java.sql.*" %>
<%@ page import="controller.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Expenses</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            padding: 30px;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #0072ff;
            color: white;
        }

        tr:nth-child(even) {
            background: #f2f2f2;
        }

        a {
            display: block;
            text-align: center;
            margin: 20px;
        }
    </style>
</head>

<body>

<h2>📄 All Expenses</h2>

<table>
    <tr>
        <th>Title</th>
        <th>Amount</th>
        <th>Type</th>
    </tr>

    <%
        try {
            Connection con = DBConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM expenses");

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("title") %></td>
        <td>₹ <%= rs.getDouble("amount") %></td>
        <td><%= rs.getString("type") %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</table>

<a href="dashboard.jsp">⬅ Back to Dashboard</a>

</body>
</html>
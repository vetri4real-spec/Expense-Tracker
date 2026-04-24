<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.DBConnection" %>
<%
    double totalIncome = 0;

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
                "SELECT SUM(amount) FROM expenses WHERE type='income'"
        );

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            totalIncome = rs.getDouble(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%
    double totalExpense = 0;

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps2 = con.prepareStatement(
                "SELECT SUM(amount) FROM expenses WHERE type='expense'"
        );

        ResultSet rs2 = ps2.executeQuery();

        if (rs2.next()) {
            totalExpense = rs2.getDouble(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%
    double profit = totalIncome - totalExpense;
%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            display: flex;
            background: #f4f6f9;
        }

        /* Sidebar */
        .sidebar {
            width: 220px;
            height: 100vh;
            background: #1e293b;
            color: white;
            padding: 20px;
        }

        .sidebar h2 {
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            margin: 15px 0;
            padding: 10px;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background: #334155;
        }

        /* Main */
        .main {
            flex: 1;
            padding: 30px;
        }

        .header {
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Cards */
        .cards {
            display: flex;
            gap: 20px;
        }

        .card {
            flex: 1;
            padding: 20px;
            border-radius: 10px;
            color: white;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.2);
        }

        .income {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
        }

        .expense {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
        }

        .profit {
            background: linear-gradient(135deg, #00b09b, #96c93d);
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card p {
            font-size: 22px;
            font-weight: bold;
        }

    </style>
</head>

<body>

<div class="sidebar">
    <h2>💰 Expense App</h2>

    <a href="#">📊 Dashboard</a>
    <a href="addExpense.jsp">➕ Add Expense</a>
    <a href="viewExpenses.jsp">📄 View Expenses</a>
    <a href="login.jsp">🚪 Logout</a>
</div>

<div class="main">
    <div class="header">Welcome 👋</div>

    <div class="cards">
        <div class="card income">
            <h3>Total Income</h3>
            <p>₹ <%= totalIncome %></p>
        </div>

        <div class="card expense">
            <h3>Total Expense</h3>
            <p>₹ <%= totalExpense %></p>
        </div>

        <div class="card profit">
            <h3>Profit</h3>
            <p>₹ <%= profit %></p>
        </div>
    </div>
</div>

</body>
</html>
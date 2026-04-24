<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Expense</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.2);
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #ff4b2b;
            color: white;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<div class="box">
    <h2>➕ Add Expense</h2>

    <form action="addExpense" method="post">

        <input type="text" name="title" placeholder="Expense Title" required>

        <input type="number" name="amount" placeholder="Amount" required>

        <select name="type">
            <option value="expense">Expense</option>
            <option value="income">Income</option>
        </select>

        <button type="submit">Add</button>
    </form>
</div>

</body>
</html>
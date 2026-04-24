<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 350px;
            padding: 30px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            text-align: center;
            color: white;
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: none;
            border-radius: 8px;
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #00c6ff;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #0072ff;
            transform: scale(1.05);
        }

        .title {
            font-size: 24px;
            margin-bottom: 10px;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }

    </style>
</head>

<body>

<div class="container">
    <div class="title">💰 Expense Tracker</div>
    <h2>Login</h2>

    <form action="/BB/login" method="post">
        <input type="text" name="username" placeholder="👤 Username" required>
        <input type="password" name="password" placeholder="🔒 Password" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
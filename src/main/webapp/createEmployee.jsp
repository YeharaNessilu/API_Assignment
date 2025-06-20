<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #667eea, #764ba2); /* Blue to Purple gradient */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .employee-card {
            background-color: #ffffff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            width: 100%;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #4c51bf;
            font-weight: bold;
        }

        label {
            font-weight: 600;
            color: #333;
        }

        .btn-primary {
            background-color: #667eea;
            border: none;
        }

        .btn-primary:hover {
            background-color: #5a67d8;
        }

    </style>
</head>
<body>

<div class="employee-card">
    <h2>Create New Employee</h2>
    <form class="row g-3" method="post" action="/create">
        <div class="col-md-6">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" required name="name">
        </div>
        <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" required name="email">
        </div>
        <div class="col-md-6">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="****" required name="password">
        </div>
        <div class="col-md-6">
            <label for="role" class="form-label">Role</label>
            <select id="role" name="role" class="form-select" required>
                <option selected disabled value="">Choose...</option>
                <option value="Admin">Admin</option>
                <option value="Employee">Employee</option>
            </select>
        </div>
        <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary px-5 mt-3 me-3">Submit</button>
            <a href="admin.jsp" class="btn btn-secondary px-5 mt-3">Dashboard</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

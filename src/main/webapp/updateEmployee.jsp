<%@ page import="com.ijse.gdse.api.dto.UserDTO" %>
<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UserDTO user = UserModel.findById(request.getParameter("id"),
            (BasicDataSource) request.getServletContext().getAttribute("dataSource"));
    if (user == null) {
        response.sendRedirect("employeeList.jsp");
        return;
    }
%>

<html>
<head>
    <title>Update Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-label {
            font-weight: bold !important;
            font-size: 1rem;
        }

        body {
            background: linear-gradient(135deg, #4a90e2, #8e44ad);
            font-family: 'Segoe UI', sans-serif;
            color: white;
            padding-top: 30px;
        }

        .card {
            background-color: #ffffff;
            color: #333;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            margin: auto;
        }

        .form-control:focus {
            border-color: #8e44ad;
            box-shadow: 0 0 0 0.2rem rgba(142, 68, 173, 0.25);
        }

        .btn-info {
            background-color: #667eea;
            border: none;
            color: white;
        }

        .btn-info:hover {
            background-color: #5a67d8;
            color: white;
        }

        .btn-back {
            background: transparent;
            border: 1px solid #ccc;
            color: #333;
        }

        h2 {
            color: #4c51bf;
            font-weight: bold;
            text-align: center;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>

<div class="card p-4">
    <h2>Update Employee</h2>
    <form method="post" action="/update?id=<%=user.getId()%>" class="p-2">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" required name="name" value="<%=user.getName()%>">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" required name="email" value="<%=user.getEmail()%>">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="****" required name="password" value="<%=user.getPassword()%>">
        </div>
        <div class="mb-3">
            <label for="role" class="form-label">Role</label>
            <select class="form-select" id="role" name="role" required>
                <option disabled value="">Select Role</option>
                <option value="employee" <%= "employee".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>Employee</option>
                <option value="admin" <%= "admin".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>Admin</option>
            </select>
        </div>
        <div class="d-flex justify-content-between">
            <a href="employeeList.jsp" class="btn btn-secondary btn-back px-5 mt-3">Back</a>
            <button type="submit" class="btn btn-info px-5 mt-3">Update</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

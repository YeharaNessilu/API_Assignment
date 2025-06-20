<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.ComplaintDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ijse.gdse.api.model.ComplaintModel" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    // 🛡️ Check for logged-in user
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 🔌 Get DataSource from application context
    BasicDataSource ds = (BasicDataSource) application.getAttribute("dataSource");

    // ✅ Correct method call to fetch complaints for logged-in employee
    List<ComplaintDTO> complaints = ComplaintModel.getAllByEmployeeId(ds, userId);
%>

<html>
<head>
    <title>My Complaint List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            overflow-x: hidden;
            background: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .sidebar {
            width: 220px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background: #4e3a99;
            padding-top: 60px;
        }
        .sidebar h5 {
            text-align: center;
            color: white;
            margin-bottom: 20px;
        }
        .sidebar a {
            color: #ddd;
            padding: 15px;
            display: block;
            text-decoration: none;
            font-weight: 600;
        }
        .sidebar a:hover {
            background-color: #6a5acd;
            color: white;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
        }
        h2 {
            color: #4e3a99;
            margin-bottom: 20px;
        }
        .table {
            background-color: #fff;
            color: #333;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        thead {
            background: linear-gradient(135deg, #4a90e2, #8e44ad);
            color: white;
        }
        tbody tr:hover {
            background-color: #e0e0e0;
            color: black;
        }
        .btn {
            font-weight: 600;
        }
    </style>
</head>
<body>

<!-- 🔹 Sidebar -->
<div class="sidebar">
    <h5>Employee Portal</h5>
    <a href="employee.jsp">Dashboard</a>
    <a href="newComplaint.jsp">New Complaint</a>
    <a href="myComplaint.jsp">Complaint List</a>
    <a href="logout.jsp" style="color: darkred; font-weight: bold;">Logout</a>
</div>

<!-- 🔸 Main Content -->
<div class="content">
    <h2>My Complaint List</h2>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>Title</th>
            <th>Description</th>
            <th>Department</th>
            <th>Priority</th>
            <th>Status</th>
            <th>Create Date</th>
        </tr>
        </thead>
        <tbody>
        <% for (ComplaintDTO complaint : complaints) { %>
        <tr>
            <td><%= complaint.getId() %></td>
            <td><%= complaint.getTitle() %></td>
            <td><%= complaint.getDescription() %></td>
            <td><%= complaint.getDepartment() %></td>
            <td><%= complaint.getPriority() %></td>
            <td><%= complaint.getStatus() %></td>
            <td><%= complaint.getCreatedDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) %></td>
            <td>
                <a href="updateComplaint.jsp?id=<%= complaint.getId() %>" class="btn btn-info btn-sm">Update</a>
                <a href="deleteComplaint?id=<%= complaint.getId() %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Are you sure you want to delete this complaint?');">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

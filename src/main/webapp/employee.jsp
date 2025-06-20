<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ijse.gdse.api.model.ComplaintModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    BasicDataSource ds = (BasicDataSource) request.getServletContext().getAttribute("dataSource");

    int pendingCount = ComplaintModel.countByStatus(ds, "Pending");
    int inProgressCount = ComplaintModel.countByStatus(ds, "In Progress");
    int resolvedCount = ComplaintModel.countByStatus(ds, "Resolved");
    int rejectedCount = ComplaintModel.countByStatus(ds, "Rejected");
%>

<html>
<head>
    <title>Employee Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            overflow-x: hidden;
            background: #f8f9fa;
            color: #212529;
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
        .sidebar h4 {
            text-align: center;
            padding: 15px 0;
            border-bottom: 1px solid #a0a0a0;
            color: #ddd;
        }
        .sidebar a {
            color: #ddd;
            padding: 15px 20px;
            display: block;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .sidebar a:hover {
            background-color: #6a5acd;
            color: white;
        }
        .content {
            margin-left: 220px;
            padding: 30px 40px;
        }
        h2 {
            color: #4e3a99;
            margin-bottom: 20px;
        }
        .dashboard-overview {
            display: flex;
            gap: 20px;
            margin-bottom: 40px;
        }
        .overview-box {
            flex: 1;
            background: linear-gradient(135deg, #4a90e2, #8e44ad);
            padding: 25px 15px;
            border-radius: 12px;
            text-align: center;
            color: white;
            box-shadow: 0 8px 20px rgba(138, 43, 226, 0.3);
            transition: transform 0.3s ease;
            cursor: default;
        }
        .overview-box:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(138, 43, 226, 0.5);
        }
        .overview-box h3 {
            font-size: 40px;
            margin-bottom: 10px;
            font-weight: 700;
        }
        .overview-box p {
            font-size: 16px;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            margin: 0;
        }
        table {
            background-color: #fff;
            color: #333;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 100%;
        }
        thead {
            background-color: #4e3a99;
            color: white;
        }
        tbody tr:hover {
            background-color: #f1f1f1;
            color: #212529;
        }
        .btn {
            font-weight: 600;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4>Employee Portal</h4>
    <a href="#">Dashboard</a>
    <a href="newComplaint.jsp">New Complaint</a>
    <a href="myComplaint.jsp">My Complaints</a>
    <%-- <a href="employee.jsp">Employee List</a> --%>
    <%-- <a href="createEmployee.jsp">Create Employee</a> --%>
    <a href="logout.jsp" style="color: darkred; font-weight: bold;">Logout</a>
</div>

<!-- Main Content -->
<div class="content">

    <h2>Welcome, Employee!</h2>
    <p>Use the sidebar to navigate through the employee features.</p>
    <hr />


    <h2>Dashboard Overview</h2>
    <div class="dashboard-overview">
        <div class="overview-box">
            <h3><%= pendingCount %></h3>
            <p>Pending</p>
        </div>
        <div class="overview-box">
            <h3><%= inProgressCount %></h3>
            <p>In Progress</p>
        </div>
        <div class="overview-box">
            <h3><%= resolvedCount %></h3>
            <p>Resolved</p>
        </div>
        <div class="overview-box">
            <h3><%= rejectedCount %></h3>
            <p>Rejected</p>
        </div>
    </div>


<%--    <table class="table table-bordered table-hover">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>#</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Password</th>--%>
<%--            <th>Role</th>--%>
<%--            <th>Email</th>--%>
<%--            <th>Options</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <%--%>
<%--            BasicDataSource ds = (BasicDataSource) request.getServletContext().getAttribute("dataSource");--%>
<%--            List<UserDTO> users = UserModel.getAll(ds);--%>
<%--            for (UserDTO userDTO : users) {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td><%=userDTO.getId()%></td>--%>
<%--            <td><%=userDTO.getName()%></td>--%>
<%--            <td><%=userDTO.getPassword()%></td>--%>
<%--            <td><%=userDTO.getRole()%></td>--%>
<%--            <td><%=userDTO.getEmail()%></td>--%>
<%--            <td>--%>
<%--                <a href="updateEmployee.jsp?id=<%=userDTO.getId()%>" class="btn btn-info btn-sm">Update</a>--%>
<%--                <a href="deleteEmployee.jsp?id=<%=userDTO.getId()%>" class="btn btn-danger btn-sm">Delete</a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <% } %>--%>
<%--        </tbody>--%>
<%--    </table>--%>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

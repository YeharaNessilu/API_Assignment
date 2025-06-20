<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.UserDTO" %>
<%@ page import="com.ijse.gdse.api.model.ComplaintModel" %>
<%@ page import="java.util.List" %>
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
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            overflow-x: hidden;
            background: white;
            color: #333;
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
            color: white;
            font-weight: 700;
        }
        .sidebar a {
            color: #ddd;
            padding: 15px;
            display: block;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s, color 0.3s;
        }
        .sidebar a:hover {
            background-color: #6a5acd;
            color: white;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
        }
        .dashboard-overview {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            flex-wrap: wrap;
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
        .chart-section {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .chart-card {
            flex: 1;
            min-width: 300px;
            max-width: 600px;
        }
        .desc-card {
            flex: 1;
            min-width: 250px;
            max-width: 600px;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4>Admin Panel</h4>
    <a href="admin.jsp">Dashboard</a>
    <a href="employeeList.jsp">Employee List</a>
    <a href="createEmployee.jsp">Create Employee</a>
    <a href="allComplaints.jsp">All Complaints</a>
    <a href="logout.jsp" style="color: #ff6b6b; font-weight: 700;">Logout</a>
</div>

<!-- Main Content -->
<div class="content">
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

    <!-- Chart Section -->
    <div class="chart-section mt-4">
        <div class="card chart-card">
            <div class="card-body">
                <h5 class="card-title">Complaint Status Summary</h5>
                <canvas id="complaintPieChart" width="400" height="400"></canvas>
            </div>
        </div>

        <div class="card desc-card">
            <div class="card-body">
                <h5 class="card-title">Chart Description</h5>
                <p class="text-muted">
                    This pie chart visualizes the distribution of complaint statuses, helping administrators quickly identify how many complaints are pending, in progress, resolved, or rejected.
                </p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('complaintPieChart').getContext('2d');
    const complaintPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Pending', 'In Progress', 'Resolved', 'Rejected'],
            datasets: [{
                label: 'Complaint Status',
                data: [<%= pendingCount %>, <%= inProgressCount %>, <%= resolvedCount %>, <%= rejectedCount %>],
                backgroundColor: [
                    '#f39c12', // Pending - Orange
                    '#3498db', // In Progress - Blue
                    '#2ecc71', // Resolved - Green
                    '#e74c3c'  // Rejected - Red
                ],
                borderColor: '#fff',
                borderWidth: 2
            }]
        },
        options: {
            responsive: false,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
</script>

</body>
</html>

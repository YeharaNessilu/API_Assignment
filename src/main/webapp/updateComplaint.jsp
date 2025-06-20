<%--
  Created by IntelliJ IDEA.
  User: Shavindi
  Date: 6/18/2025
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.ComplaintDTO" %>
<%@ page import="com.ijse.gdse.api.model.ComplaintModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.*" %>

<%
  String idStr = request.getParameter("id");
  int id = Integer.parseInt(idStr);
  BasicDataSource ds = (BasicDataSource) application.getAttribute("dataSource");
  ComplaintDTO complaint = null;

  List<ComplaintDTO> all = ComplaintModel.getAllComplaints(ds);
  for (ComplaintDTO dto : all) {
    if (dto.getId() == id) {
      complaint = dto;
      break;
    }
  }
  if (complaint == null) {
    response.sendRedirect("myComplaint.jsp");
    return;
  }
%>

<html>
<head>
  <title>Update Complaint</title>
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

    /*.card-header {*/
    /*  !*background: linear-gradient(135deg, #4a90e2, #8e44ad);*!*/
    /*  color: white;*/
    /*  border-radius: 15px 15px 0 0;*/
    /*  font-size: 1.5rem;*/
    /*  text-align: center;*/
    /*}*/

    .form-control:focus {
      border-color: #8e44ad;
      box-shadow: 0 0 0 0.2rem rgba(142, 68, 173, 0.25);
    }

    .btn-primary {
      background-color: #667eea;
      border: none;
    }

    .btn-primary:hover {
      background-color: #5a67d8;
    }

    .btn-back {
      background: transparent;
      border: 1px solid #ccc;
      color: #333;
    }
    h2 {
      color: #4c51bf;
      font-weight: bold;
    }
  </style>
</head>
<body>

<div class="card p-4">
  <h2 class="mb-4 text-center">Update Complaint</h2>
  <form action="updateComplaint" method="post" class="p-2">
    <input type="hidden" name="id" value="<%= complaint.getId() %>">
    <input type="hidden" name="createdDate" value="<%= complaint.getCreatedDate() %>">

    <div class="mb-3">
      <label class="form-label">Title</label>
      <input type="text" name="title" class="form-control" value="<%= complaint.getTitle() %>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea name="description" class="form-control" rows="4" required><%= complaint.getDescription() %></textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">Department</label>
      <select name="department" class="form-control" required>
        <option value="IT" <%= complaint.getDepartment().equals("IT") ? "selected" : "" %>>IT</option>
        <option value="HR" <%= complaint.getDepartment().equals("HR") ? "selected" : "" %>>HR</option>
        <option value="Finance" <%= complaint.getDepartment().equals("Finance") ? "selected" : "" %>>Finance</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Priority</label>
      <select name="priority" class="form-control" required>
        <option value="Low" <%= complaint.getPriority().equals("Low") ? "selected" : "" %>>Low</option>
        <option value="Medium" <%= complaint.getPriority().equals("Medium") ? "selected" : "" %>>Medium</option>
        <option value="High" <%= complaint.getPriority().equals("High") ? "selected" : "" %>>High</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Status</label>
      <select name="status" class="form-control" required>
        <option value="Pending" <%= complaint.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
        <option value="In Progress" <%= complaint.getStatus().equals("In Progress") ? "selected" : "" %>>In Progress</option>
        <option value="Resolved" <%= complaint.getStatus().equals("Resolved") ? "selected" : "" %>>Resolved</option>
        <option value="Rejected" <%= complaint.getStatus().equals("Rejected") ? "selected" : "" %>>Rejected</option>
      </select>
    </div>

    <div class="d-flex justify-content-between">
      <a href="employee.jsp" class="btn btn-secondary px-5 mt-3">Back</a>
      <button type="submit" class="btn btn-primary px-5 mt-3 me-3">Update Complaint</button>
    </div>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

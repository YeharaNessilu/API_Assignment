<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Submit New Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #667eea, #764ba2); /* Blue to Purple gradient */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .complaint-card {
            background-color: #ffffff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            width: 100%;
        }

        .form-label {
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

        h2 {
            color: #4c51bf;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="complaint-card">
    <h2 class="mb-4 text-center">Submit New Complaint</h2>

    <form action="complaint" method="post" class="row g-3">

        <div class="col-md-6">
            <label for="title" class="form-label">Complaint Title</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>

        <div class="col-md-6">
            <label for="department" class="form-label">Department</label>
            <select class="form-select" id="department" name="department" required>
                <option selected disabled value="">Choose...</option>
                <option value="IT">IT</option>
                <option value="HR">HR</option>
                <option value="Finance">Finance</option>
                <option value="Admin">Admin</option>
            </select>
        </div>

        <div class="col-md-6">
            <label for="priority" class="form-label">Priority</label>
            <select class="form-select" id="priority" name="priority" required>
                <option selected disabled value="">Choose...</option>
                <option value="Low">Low</option>
                <option value="Medium">Medium</option>
                <option value="High">High</option>
            </select>
        </div>

        <div class="col-md-6">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status" required>
                <option selected disabled value="">Choose...</option>
                <option value="Pending">Pending</option>
                <option value="In Progress">In Progress</option>
                <option value="Resolved">Resolved</option>
                <option value="Closed">Rejected</option>
            </select>
        </div>

        <div class="col-12">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
        </div>

        <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary px-5 mt-3 me-3">Submit</button>
            <a href="employee.jsp" class="btn btn-secondary px-5 mt-3">Dashboard</a>
        </div>

    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

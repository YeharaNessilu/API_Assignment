<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="com.ijse.gdse.api.dto.UserDTO" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login - Complaint Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body, html {
      height: 100%;
      margin: 0;
    }
    .split-screen {
      display: flex;
      height: 100vh;
    }
    .left {
      flex: 1;
      background: linear-gradient(to right, purple, #1e90ff); /* blue to darker blue */
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .right {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 2rem;
      background-color: #f8f9fa;
    }
    .login-box {
      width: 100%;
      max-width: 400px;
      background-color: white;
      padding: 2rem;
      border-radius: 1rem;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .btn {
      border-radius: 0.5rem;
    }
    .form-label {
      font-weight: 500;
    }
  </style>
</head>
<body>

<div class="split-screen">
  <div class="left d-flex align-items-center justify-content-center">
    <h1 class="text-white fw-bold display-4">Municipal IT Division</h1>
  </div>

  <div class="right">
    <div class="login-box">

      <h3 class="text-center mb-4">Welcome Back</h3>

      <%
        String error = request.getParameter("error");
        String success = request.getParameter("success");
      %>

      <% if (error != null) { %>
      <div id="errorAlert" class="alert alert-danger" role="alert">
        Login Failed! Please check your credentials.
      </div>
      <% } else if (success != null) { %>
      <div id="successAlert" class="alert alert-success" role="alert">
        Login successful! Welcome back.
      </div>
      <% } %>

      <form method="post" action="logins">
        <div class="mb-3">
          <label for="name" class="form-label">User Name</label>
          <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name" required>
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" id="password" placeholder="******" name="password" required>
        </div>
        <div class="mb-3">
          <label for="role" class="form-label">Role</label>
          <select class="form-select" id="role" name="role" required>
            <option selected disabled value="">Select Role</option>
            <option value="employee">Employee</option>
            <option value="admin">Admin</option>
          </select>
        </div>
        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-primary">Sign In</button>
          <a href="signUp.jsp" class="btn btn-outline-secondary">Sign Up</a>
        </div>
      </form>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function hideAlertAfterDelay(alertId) {
    const alertElement = document.getElementById(alertId);
    if (alertElement) {
      setTimeout(() => {
        alertElement.style.transition = "opacity 0.5s ease";
        alertElement.style.opacity = "0";
        setTimeout(() => {
          alertElement.style.display = "none";
        }, 500);
      }, 2000);
    }
  }

  hideAlertAfterDelay("errorAlert");
  hideAlertAfterDelay("successAlert");
</script>

</body>
</html>

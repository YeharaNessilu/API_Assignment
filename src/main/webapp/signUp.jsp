<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up - Complaint Management</title>
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
        .signup-box {
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
    <div class="left">
        <h1 class="text-white fw-bold display-4">Municipal IT Division</h1>
    </div>

    <div class="right">
        <div class="signup-box">
            <h3 class="text-center mb-4">Create an Account</h3>

            <% String msg = request.getParameter("msg"); %>
            <% if ("success".equals(msg)) { %>
            <div id="successAlert" class="alert alert-success" role="alert">
                Sign-Up successful!
            </div>
            <% } else if ("fail".equals(msg)) { %>
            <div id="errorAlert" class="alert alert-danger" role="alert">
                Sign-Up failed! Please try again.
            </div>
            <% } %>

            <form class="row g-3" method="post" action="signUps">
                <div class="col-md-12">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="col-md-12">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="col-12">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="col-12">
                    <label for="role" class="form-label">Role</label>
                    <select class="form-select" id="role" name="role" required>
                        <option value="" disabled selected>Select your role</option>
                        <option value="Employee">Employee</option>
                        <option value="Admin">Admin</option>
                    </select>
                </div>
                <div class="col-12 d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Sign-Up</button>
                    <a href="index.jsp" class="btn btn-outline-secondary">Go to Login</a>
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

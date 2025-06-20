package com.ijse.gdse.api.servlet;

import java.io.*;

import com.ijse.gdse.api.dto.UserDTO;
import com.ijse.gdse.api.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.dbcp2.BasicDataSource;

    @WebServlet("/logins")
    public class LoginServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String name = req.getParameter("name");
            String password = req.getParameter("password");
            String role = req.getParameter("role");

            // Null check
            if (name == null || password == null || role == null) {
                resp.sendRedirect(req.getContextPath() + "/index.jsp?error=missing");
                return;
            }

            // Get DataSource
            BasicDataSource ds = (BasicDataSource) req.getServletContext().getAttribute("dataSource");

            // Check user credentials
            UserDTO isUserValid = UserModel.findUser(new UserDTO(name, password), role, ds);

            if (isUserValid == null) {
                // Invalid login
                resp.sendRedirect(req.getContextPath() + "/index.jsp?error=invalid");
            } else {
                // Valid login - set session attributes
                HttpSession session = req.getSession();
                session.setAttribute("user", name);
                session.setAttribute("role", role);
                session.setAttribute("userId", isUserValid.getId()); // ✅ Essential for complaint submission
                session.setAttribute("loginSuccess", "Login successful! Welcome back.");

                // Redirect by role
                if ("employee".equals(role)) {
                    resp.sendRedirect(req.getContextPath() + "/employee.jsp?id=" + isUserValid.getId());
                } else if ("admin".equals(role)) {
                    resp.sendRedirect(req.getContextPath() + "/admin.jsp?id=" + isUserValid.getId());
                } else {
                    resp.sendRedirect(req.getContextPath() + "/index.jsp?error=invalid-role");
                }
            }
        }
    }
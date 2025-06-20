package com.ijse.gdse.api.servlet;

import com.ijse.gdse.api.dto.UserDTO;
import com.ijse.gdse.api.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;

@WebServlet("/signUps")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String role = req.getParameter("role"); // ✅ Get role

        // Validate input
        if (name == null || password == null || email == null || role == null ||
                name.isBlank() || password.isBlank() || email.isBlank() || role.isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/signup.jsp?error=missing");
            return;
        }

        // Encrypt password (Optional & Recommended)
        // String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        BasicDataSource ds = (BasicDataSource) req.getServletContext().getAttribute("dataSource");

        // Send role to UserDTO
        UserDTO userDTO = new UserDTO(name, password, email, role);  // ✅ Include role
        boolean issave = UserModel.saveUser(userDTO, ds);             // ✅ Updated call

        if (issave) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp?signup=success");
        } else {
            resp.sendRedirect(req.getContextPath() + "/signup.jsp?error=exists");
        }
    }
}

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

@WebServlet("/update")
public class UpdateEmployeeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");  // important!

        String id = req.getParameter("id");

        BasicDataSource ds = (BasicDataSource) req.getServletContext().getAttribute("dataSource");
        UserDTO user = new UserDTO(name, password, email, role);

        boolean isUpdate = UserModel.updateUser(user, id, ds);

        if (isUpdate) {
            resp.sendRedirect(req.getContextPath() + "/employeeList.jsp?id=" + id);
        } else {
            resp.getWriter().write("Update failed!");
        }
    }


}

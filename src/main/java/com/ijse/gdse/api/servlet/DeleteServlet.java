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


@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        BasicDataSource ds = (BasicDataSource) req.getServletContext().getAttribute("dataSource");

        UserDTO userDTO = new UserDTO();
        userDTO.setId(Integer.parseInt(id)); // Send only ID

        boolean isDelete = UserModel.deleteUser(userDTO, ds);

        if (isDelete) {
            resp.sendRedirect(req.getContextPath() + "/employeeList.jsp?deleted=true");
        } else {
            resp.sendRedirect(req.getContextPath() + "/employeeList.jsp?deleted=false");
        }
    }
}

package com.ijse.gdse.api.servlet;

import com.ijse.gdse.api.dto.ComplaintDTO;
import com.ijse.gdse.api.model.ComplaintModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/complaint")
public class CreateComplaintServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String department = req.getParameter("department");
        String priority = req.getParameter("priority");
        String status = req.getParameter("status");
        LocalDate createdDate = LocalDate.now();

        // Get logged-in userId from session
        Integer employeeId = (Integer) req.getSession().getAttribute("userId");
        if (employeeId == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        BasicDataSource ds = (BasicDataSource) req.getServletContext().getAttribute("dataSource");

        // Create complaint DTO with employeeId
        ComplaintDTO complaint = new ComplaintDTO(title, description, department, priority, status, createdDate, employeeId);

        boolean isSaved = ComplaintModel.saveComplaint(complaint, ds);

        if (isSaved) {
            req.getSession().setAttribute("complaintSuccess", "Complaint submitted successfully!");
            resp.sendRedirect("myComplaint.jsp");
        } else {
            resp.sendRedirect("newComplaint.jsp?error=true");
        }
    }
}

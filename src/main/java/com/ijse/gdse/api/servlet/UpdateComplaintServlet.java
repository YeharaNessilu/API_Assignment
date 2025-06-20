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

@WebServlet("/updateComplaint")
public class UpdateComplaintServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            String department = req.getParameter("department");
            String priority = req.getParameter("priority");
            String status = req.getParameter("status");
            LocalDate createdDate = LocalDate.parse(req.getParameter("createdDate")); // From hidden field

            // Get the DataSource
            BasicDataSource ds = (BasicDataSource) req.getServletContext().getAttribute("dataSource");

            // Create updated DTO
            ComplaintDTO updatedComplaint = new ComplaintDTO(id, title, description, department, priority, status, createdDate);

            boolean isUpdated = ComplaintModel.updateComplaint(updatedComplaint, ds);

            if (isUpdated) {
                req.getSession().setAttribute("complaintUpdated", "Complaint updated successfully!");
                resp.sendRedirect("allComplaints.jsp");
            } else {
                resp.sendRedirect("updateComplaint.jsp?id=" + id + "&error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("allComplaints.jsp?error=exception");
        }
    }
}

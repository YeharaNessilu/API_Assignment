package com.ijse.gdse.api.servlet;

import com.ijse.gdse.api.model.ComplaintModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;

@WebServlet("/deleteComplaint")
public class DeleteComplaintServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");

        if (idStr == null || idStr.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/allComplaints.jsp?error=missing-id");
            return;
        }

        int complaintId;
        try {
            complaintId = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/allComplaints.jsp?error=invalid-id");
            return;
        }

        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("dataSource");

        boolean deleted = ComplaintModel.deleteComplaint(complaintId, ds);

        if (deleted) {
            resp.sendRedirect(req.getContextPath() + "/allComplaints.jsp?success=deleted");
        } else {
            resp.sendRedirect(req.getContextPath() + "/allComplaints.jsp?error=delete-failed");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp); // allow GET to be handled by doPost logic
    }

}
package com.ijse.gdse.api.model;

import com.ijse.gdse.api.dto.ComplaintDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ComplaintModel {

    // Retrieve all complaints (Admin view)
    public static List<ComplaintDTO> getAllComplaints(BasicDataSource ds) {
        List<ComplaintDTO> list = new ArrayList<>();
        String query = "SELECT * FROM complaints";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ComplaintDTO complaint = new ComplaintDTO(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("department"),
                        rs.getString("priority"),
                        rs.getString("status"),
                        rs.getDate("create_date").toLocalDate(),
                        rs.getInt("employee_id")
                );
                list.add(complaint);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Retrieve all complaints by a specific employee
    public static List<ComplaintDTO> getAllByEmployeeId(BasicDataSource ds, int employeeId) {
        List<ComplaintDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM complaints WHERE employee_id = ?";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, employeeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ComplaintDTO complaint = new ComplaintDTO(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("department"),
                        rs.getString("priority"),
                        rs.getString("status"),
                        rs.getDate("create_date").toLocalDate(),
                        rs.getInt("employee_id")
                );
                list.add(complaint);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Save a new complaint
    public static boolean saveComplaint(ComplaintDTO complaint, BasicDataSource ds) {
        String sql = "INSERT INTO complaints (title, description, department, priority, status, create_date, employee_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, complaint.getTitle());
            ps.setString(2, complaint.getDescription());
            ps.setString(3, complaint.getDepartment());
            ps.setString(4, complaint.getPriority());
            ps.setString(5, complaint.getStatus());
            ps.setDate(6, java.sql.Date.valueOf(complaint.getCreatedDate()));
            ps.setInt(7, complaint.getEmployeeId());  // Save employeeId here

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Update an existing complaint
    public static boolean updateComplaint(ComplaintDTO dto, BasicDataSource ds) {
        String sql = "UPDATE complaints SET title = ?, description = ?, department = ?, priority = ?, status = ?, create_date = ?, employee_id = ? " +
                "WHERE id = ?";

        try (Connection con = ds.getConnection();
             PreparedStatement stm = con.prepareStatement(sql)) {

            stm.setString(1, dto.getTitle());
            stm.setString(2, dto.getDescription());
            stm.setString(3, dto.getDepartment());
            stm.setString(4, dto.getPriority());
            stm.setString(5, dto.getStatus());
            stm.setDate(6, Date.valueOf(dto.getCreatedDate()));
            stm.setInt(7, dto.getEmployeeId());
            stm.setInt(8, dto.getId());

            return stm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean deleteComplaint(int complaintId, BasicDataSource dataSource) {
        String sql = "DELETE FROM complaints WHERE id = ?";
        try (
                Connection conn = dataSource.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            System.out.println("Deleting complaint with ID: " + complaintId);
            stmt.setInt(1, complaintId);
            int result = stmt.executeUpdate();
            System.out.println("Rows affected: " + result);
            return result > 0;
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
            return false;
        }

    }

    public static int countByStatus(BasicDataSource ds, String status) throws SQLException {
        try (Connection con = ds.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM complaints WHERE status = ?")) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        }
    }


//    public static List<ComplaintDTO> getAll(BasicDataSource dataSource) {
//        List<ComplaintDTO> complaintList = new ArrayList<>();
//
//        String sql = "SELECT * FROM complaints";
//
//        try (
//                Connection connection = dataSource.getConnection();
//                PreparedStatement stmt = connection.prepareStatement(sql);
//                ResultSet rs = stmt.executeQuery()
//        ) {
//            while (rs.next()) {
//                ComplaintDTO complaint = new ComplaintDTO(
//                        rs.getInt("id"),
//                        rs.getString("title"),
//                        rs.getString("description"),
//                        rs.getString("department"),
//                        rs.getString("priority"),
//                        rs.getString("status"),
//                        rs.getDate("create_date").toLocalDate()  // <-- Fixed this line
//                );
//                complaintList.add(complaint);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return complaintList;
//    }


}

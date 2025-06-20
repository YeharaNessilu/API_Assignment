<%--
  Created by IntelliJ IDEA.
  User: Shavindi
  Date: 6/19/2025
  Time: 12:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.ijse.gdse.api.dto.ComplaintDTO" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>

<%
    BasicDataSource ds = (BasicDataSource) application.getAttribute("dataSource");
    List<ComplaintDTO> complaints = com.ijse.gdse.api.model.ComplaintModel.getAllComplaints(ds);
%>

<html>
<head><title>Complaint List</title></head>
<body>
<h2>Complaints</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th><th>Title</th><th>Description</th><th>Action</th>
    </tr>
    </thead>
    <tbody>
    <% for (ComplaintDTO c : complaints) { %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getTitle() %></td>
        <td><%= c.getDescription() %></td>
        <td>
            <form action="deleteComplaint" method="post" onsubmit="return confirm('Are you sure you want to delete this complaint?');">
                <input type="hidden" name="id" value="<%= c.getId() %>"/>
                <input type="submit" value="Delete"/>
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>

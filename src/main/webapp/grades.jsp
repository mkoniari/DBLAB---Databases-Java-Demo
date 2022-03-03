<%@ page import="com.demo.GradeService" %>
<%@ page import="com.demo.Grade" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    GradeService gradeService = new GradeService();
    List<Grade> grades = null;
    try {
        grades = gradeService.getGrades();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Grades Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container">
    <div class="row" id="row">
        <div class="col-md-12">
            <div class="card" id="card-container">
                <div class="card-body" id="card">
                    <% if (grades.size() == 0) { %>
                    <h1 style="margin-top: 5rem;">No Grades found!</h1>
                    <% } else { %>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Course Name</th>
                                <th>Grade</th>
                                <th>Student ID</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                            int index = 0;
                            for (Grade grade : grades) { %>
                            <tr>
                                <td><%= ++index %></td>
                                <td><%= grade.getCourseName() %></td>
                                <td><%= grade.getGrade() %></td>
                                <td><%= grade.getStudentID() %></td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>

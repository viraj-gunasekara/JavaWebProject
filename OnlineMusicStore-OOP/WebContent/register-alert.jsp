<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
</head>
<body>
<%
    String message = (String) request.getAttribute("RegError");
    if (message != null) {
%>
    <script>
        alert("<%= message %>");
        window.location.href = "index.jsp"; // redirect after alert is dismissed
    </script>
<%
    }
%>
</body>
</html>

<%@ page import="java.util.*" %>

<%
    String name = request.getParameter("username");
    String timeStr = request.getParameter("time");

    if (name != null && timeStr != null) {

        int minutes = Integer.parseInt(timeStr);

        // Store data in session
        session.setAttribute("user", name);

        // Set session expiry (convert minutes → seconds)
        session.setMaxInactiveInterval(minutes * 60);
    }

    String user = (String) session.getAttribute("user");
%>

<html>
<body>

<%
    if (user != null) {
%>
        <h2>Hello <%= user %>!</h2>
        <p>Session is active.</p>

        <a href="check.jsp">Click here to check session status</a>
<%
    } else {
%>
        <h2>Session Expired!</h2>
<%
    }
%>

</body>
</html>
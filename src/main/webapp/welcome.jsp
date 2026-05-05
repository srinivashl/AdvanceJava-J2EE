<%@ page import="java.util.*" %>

<%
    String name = request.getParameter("username");

    // If user submits name, create/update session
    if (name != null) {
        session.setAttribute("user", name);

        // Set session timeout = 60 seconds
        session.setMaxInactiveInterval(60);
    }

    String user = (String) session.getAttribute("user");
%>

<html>
<body>

<%
    if (user != null) {
%>
        <h2>Hello <%= user %>!</h2>
        <p>Session will expire in 1 minute.</p>
        <p>Session ID: <%= session.getId() %></p>
<%
    } else {
%>
        <h2>Session Expired!</h2>
        <p>Please enter your name again.</p>
<%
    }
%>

</body>
</html>
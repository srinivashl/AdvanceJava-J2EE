<%@ page import="java.io.*" %>
<%
    String name = request.getParameter("username");

    // If name is entered, create session
    if (name != null) {
        session.setAttribute("user", name);

        // Set session expiry to 60 seconds
        session.setMaxInactiveInterval(60);
    }

    // Get session value
    String user = (String) session.getAttribute("user");
%>

<html>
<body>

<%
    if (user != null) {
%>
        <h2>Hello <%= user %>!</h2>
        <p>Session will expire in 1 minute.</p>
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
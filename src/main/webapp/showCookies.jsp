<%@ page import="javax.servlet.http.*,java.net.*" %>

<html>
<body>

<h2>Active Cookie List</h2>

<%
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie c : cookies) {

            String name = c.getName();
            String value = URLDecoder.decode(c.getValue(), "UTF-8");

%>
            <p>
                <b>Name:</b> <%= name %> <br>
                <b>Value:</b> <%= value %> <br>
                <b>Max Age:</b> <%= c.getMaxAge() %>
            </p>
            <hr>
<%
        }
    } else {
%>
        <p>No Cookies Found</p>
<%
    }
%>

</body>
</html>
<%@ page import="javax.servlet.http.*,java.net.*" %>

<%
    String name = request.getParameter("cname");
    String domain = request.getParameter("cdomain");
    int age = Integer.parseInt(request.getParameter("cage"));

    // Encode name to avoid invalid characters
    String encodedName = URLEncoder.encode(name, "UTF-8");

    Cookie cookie = new Cookie("user", encodedName);

    cookie.setDomain(domain);   // set domain
    cookie.setMaxAge(age);      // set expiry

    response.addCookie(cookie);
%>

<html>
<body>

<h2>Cookie Added Successfully!</h2>

<p><b>Name:</b> <%= name %></p>
<p><b>Domain:</b> <%= domain %></p>
<p><b>Max Age:</b> <%= age %> seconds</p>

<br>
<a href="showCookies.jsp">Go to Active Cookie List</a>

</body>
</html>
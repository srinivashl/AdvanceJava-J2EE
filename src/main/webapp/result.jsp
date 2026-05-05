<%
    String roll = (String) request.getAttribute("roll");
    String name = (String) request.getAttribute("name");

    int s1 = (Integer) request.getAttribute("s1");
    int s2 = (Integer) request.getAttribute("s2");
    int s3 = (Integer) request.getAttribute("s3");
    int s4 = (Integer) request.getAttribute("s4");
    int s5 = (Integer) request.getAttribute("s5");

    double avg = (Double) request.getAttribute("average");
    String result = (String) request.getAttribute("result");
%>

<html>
<body>

<h2>Student Result</h2>

<p><b>Roll No:</b> <%= roll %></p>
<p><b>Name:</b> <%= name %></p>

<p>Sub1: <%= s1 %></p>
<p>Sub2: <%= s2 %></p>
<p>Sub3: <%= s3 %></p>
<p>Sub4: <%= s4 %></p>
<p>Sub5: <%= s5 %></p>

<p><b>Average:</b> <%= avg %></p>
<p><b>Result:</b> <%= result %></p>

<br>
<a href="index.jsp">Go Back</a>

</body>
</html>
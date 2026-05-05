<html>
<head>
    <title>Student Result Form</title>

    <script>
        function validateForm() {

            let roll = document.forms["myForm"]["rollno"].value;
            let name = document.forms["myForm"]["name"].value;

            let s1 = document.forms["myForm"]["sub1"].value;
            let s2 = document.forms["myForm"]["sub2"].value;
            let s3 = document.forms["myForm"]["sub3"].value;
            let s4 = document.forms["myForm"]["sub4"].value;
            let s5 = document.forms["myForm"]["sub5"].value;

            if (roll == "" || name == "" || s1 == "" || s2 == "" || s3 == "" || s4 == "" || s5 == "") {
                alert("All fields are required!");
                return false;
            }

            // Check marks range
            let subjects = [s1, s2, s3, s4, s5];
            for (let i = 0; i < subjects.length; i++) {
                if (subjects[i] < 0 || subjects[i] > 100) {
                    alert("Marks should be between 0 and 100");
                    return false;
                }
            }

            return true;
        }
    </script>
</head>

<body>

<h2>Student Marks Form</h2>

<form name="myForm" action="ResultServlet" method="post" onsubmit="return validateForm()">

    Roll No: <input type="text" name="rollno"><br><br>
    Name: <input type="text" name="name"><br><br>

    Sub1: <input type="text" name="sub1"><br><br>
    Sub2: <input type="text" name="sub2"><br><br>
    Sub3: <input type="text" name="sub3"><br><br>
    Sub4: <input type="text" name="sub4"><br><br>
    Sub5: <input type="text" name="sub5"><br><br>

    <input type="submit" value="Calculate Result">

</form>

</body>
</html>
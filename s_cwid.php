<html>
    <head>
        <title> Student Database </title>
    </head>
    <p> <strong> Student Database </strong> </p>

        <?php

        $link = mysqli_connect('mariadb', 'cs332f2', 'A0oGxizj', 'cs332f2');
        if (!$link) {
            die('Could not connect: ' . mysql_error());
        }

        $CWID = $_POST["CWID"];

        $query = "SELECT    C.TITLE, C.CNUM, E.GRADE
                  FROM      Course C, Course_Section CS, Enroll E, Student S
                  WHERE     $CWID = S.CWID AND S.CWID = E.ECWID AND E.ECSNUM = CS.CSNUM AND E.ESNUM = CS.SNUM AND CS.CSNUM = C.CNUM
                  GROUP BY  C.TITLE";

        $result = $link->query($query);
        $nor = $result->num_rows;

        echo "Student CWID: ", $CWID, "<br>";
        echo "---------------------------------------------", "<br>";

        for($i = 0; $i != $nor; $i++) {
            $row = $result->fetch_assoc();
            echo "Title: ", $row["TITLE"], "<br>";
            echo "Course: ", $row["CNUM"], "<br>";
            echo "Grade: ", $row["GRADE"], "<br>";
            echo "---------------------------------------------", "<br>";
        }

        $result->free_result();
        $link->close();

        ?>

        <p style = "color:blue;"> Press the 'Return to Homepage' button to return to the homepage. </p>

        <!-- Once the button is pressed, it will return to the homepage with all of the input fields cleared.-->
        <form action = "http://ecs.fullerton.edu/~cs332f2/index.html">
            <button type = "submit"> Return to Homepage </button>
        </form>

    <body>
<html>

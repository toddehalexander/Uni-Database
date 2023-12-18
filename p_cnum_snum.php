<html>
    <head>
        <title> Professor's Database </title>
    </head>
    <p> <strong> Professor's Database </strong> </p>

        <?php

        $link = mysqli_connect('mariadb', 'cs332f2', 'A0oGxizj', 'cs332f2');
        if (!$link) {
            die('Could not connect: ' . mysql_error());
        }

        $CNUM = $_POST["CNUM"];
        $SNUM = $_POST["SNUM"];

        $query = "SELECT    E.ECWID, E.GRADE, COUNT(*) AS GRADE_COUNT
                  FROM      Enroll E, Course_Section CS
                  WHERE     $CNUM = CS.CSNUM AND $SNUM = CS.SNUM AND E.ECSNUM = CS.CSNUM AND E.ESNUM = CS.SNUM
                  GROUP BY  E.GRADE";

        $result = $link->query($query);
        $nor = $result->num_rows;

        echo "Course Number: ", $CNUM, "<br>";
        echo "Section Number: ", $SNUM, "<br>";
        echo "---------------------------------------------", "<br>";

        for($i = 0; $i != $nor; $i++) {
            $row = $result->fetch_assoc();
            echo "Grade: ", $row["GRADE"], "<br>";
            echo "Number of students: ", $row["GRADE_COUNT"], "<br>";
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

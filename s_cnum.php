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

        $CNUM = $_POST["CNUM"];

        $query = "SELECT    CS.CSNUM, CS.SNUM, CS.CLASSROOM, CS.MEETING_DAYS, CS.START_TIME, CS.END_TIME, COUNT(*) AS COUNT_SEATS
                  FROM      Enroll E, Course C, Course_Section CS
                  WHERE     C.CNUM = $CNUM AND C.CNUM = CS.CSNUM AND C.CNUM = E.ECSNUM AND CS.SNUM = E.ESNUM
                  GROUP BY  E.ECSNUM, E.ESNUM";

        $result = $link->query($query);
        $nor = $result->num_rows;

        echo "Course Number: ", $CNUM, "<br>";
        echo "---------------------------------------------", "<br>";

        for($i = 0; $i != $nor; $i++) {
            $row = $result->fetch_assoc();
            echo "Course Section: ", $row["SNUM"], "<br>";
            echo "Classroom: ", $row["CLASSROOM"], "<br>";
            echo "Meeting Days: ", $row["MEETING_DAYS"], "<br>";
            echo "Times: ", $row["START_TIME"], "~", $row["END_TIME"], "<br>";
            echo "Number of Students Enrolled: ", $row["COUNT_SEATS"], "<br>";
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

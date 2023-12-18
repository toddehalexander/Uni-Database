<html>
    <head>
        <title> Professor's Database </title>
    </head>
    <p> <strong> Professor's Database </strong> </p>

        <?php

        $link = mysqli_connect('mariadb', 'cs332f2','A0oGxizj', 'cs332f2');
        if (!$link) {
            die('Could not connect: ' . mysql_error());
        }

        $SSN = $_POST["SSN"];

        $query = "SELECT C.TITLE, CS.CLASSROOM, CS.MEETING_DAYS, CS.START_TIME, CS.END_TIME
                  FROM   Professor P, Course_Section CS, Course C
                  WHERE  P.PSSN = $SSN AND P.PSSN = CS.CS_PSSN AND CS.CSNUM = C.CNUM";

        $result = $link->query($query);
        $nor = $result->num_rows;

        echo "Professor's SSN: ", $SSN, "<br>";
        echo "---------------------------------------------", "<br>";

        for($i = 0; $i != $nor; $i++) {
            $row = $result->fetch_assoc();
            echo "Title: ", $row["TITLE"], "<br>";
            echo "Classroom: ", $row["CLASSROOM"], "<br>";
            echo "Meeting Days: ", $row["MEETING_DAYS"], "<br>";
            echo "Times: ", $row["START_TIME"], " ~ ", $row["END_TIME"], "<br>";
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

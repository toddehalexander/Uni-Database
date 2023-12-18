CREATE TABLE Professor(
    PSSN numeric(9) NOT NULL,
    TITLE varchar(20),
    NAME varchar(20),
    ADDRESS varchar(30),
    CITY varchar(20),
    STATE char(2),
    ZIP_CODE numeric(5),
    AREA_CODE numeric(3),
    PPHONE numeric(7),
    SEX enum ('M', 'F'),
    SALARY varchar(10),
    PRIMARY KEY (PSSN)
);

CREATE TABLE Department(
    DNUM char(4) NOT NULL,
    DNAME varchar(50),
    DPHONE numeric(10),
    OFFICE_LOCATION varchar(50),
    CSSN numeric(9),
    PRIMARY KEY (DNUM),
    FOREIGN KEY (CSSN) REFERENCES Professor(PSSN)
);

CREATE TABLE Course(
    CNUM numeric(5) NOT NULL,
    TITLE varchar(30),
    TEXTBOOK varchar(60),
    UNITS tinyint,
    CDNUM char(4) NOT NULL,
    PRIMARY KEY (CNUM),
    FOREIGN KEY (CDNUM) REFERENCES Department(DNUM)
);

CREATE TABLE Student(
    CWID numeric(9) NOT NULL,
    FNAME varchar(20),
    LNAME varchar(20),
    ADDRESS varchar(50),
    SPHONE numeric(10),
    SDNUM char(4),
    PRIMARY KEY (CWID),
    FOREIGN KEY (SDNUM) REFERENCES Department(DNUM)
);

CREATE TABLE Course_Section(
    CSNUM numeric(5) NOT NULL,
    SNUM numeric(2) NOT NULL,
    CLASSROOM varchar(5),
    MEETING_DAYS varchar(5),
    START_TIME varchar(8),
    END_TIME varchar(8),
    NUM_OF_SEATS numeric(2),
    CS_PSSN numeric(9) NOT NULL,
    PRIMARY KEY (CSNUM, SNUM),
    FOREIGN KEY (CSNUM) REFERENCES Course(CNUM),
    FOREIGN KEY (CS_PSSN) REFERENCES Professor(PSSN)
);

CREATE TABLE Enroll(
    ECWID numeric(9) NOT NULL,
    ECSNUM numeric(5) NOT NULL,
    ESNUM numeric(2) NOT NULL,
    GRADE varchar(2),
    PRIMARY KEY (ECWID, ECSNUM, ESNUM),
    FOREIGN KEY (ECWID) REFERENCES Student(CWID),
    FOREIGN KEY (ECSNUM, ESNUM) REFERENCES Course_Section(CSNUM, SNUM)
);

CREATE TABLE Minor(
    MDNUM char(4) NOT NULL,
    MCWID numeric(9) NOT NULL,
    PRIMARY KEY (MDNUM, MCWID),
    FOREIGN KEY (MDNUM) REFERENCES Department(DNUM),
    FOREIGN KEY (MCWID) REFERENCES Student(CWID)
);

CREATE TABLE Prerequisite(
    PCNUM numeric(5) NOT NULL,
    PRIMARY KEY (PCNUM),
    FOREIGN KEY (PCNUM) REFERENCES Course(CNUM)
);

CREATE TABLE Professor_Degree(
    DPSSN numeric(9) NOT NULL,
    DEGREE varchar(10),
    PRIMARY KEY (DPSSN, DEGREE),
    FOREIGN KEY (DPSSN) REFERENCES Professor(PSSN)
);

INSERT INTO Professor VALUES
(123456789,'Dr.','John Smith','123 Main St','Anytown','CA',12345,123,9876543,'M','$80,000'),
(987654321,'Professor','Emily Lee','456 Elm St','Smallville','CA',54321,456,1234567,'F','$90,000'),
(246810123,'Assistant Professor','Micheal Brown','789 Oak St','Big City','CA',67890,789,2345678,'M','$100,000');

INSERT INTO Department VALUES
('EGCE','Mechanical Engineering',6572783014,'E-101',987654321), 
('CPSC','Computer Science',6572783700,'CS-429',123456789);

INSERT INTO Course VALUES
(74829,'Dynamics','Vector Mechanics for Engineers 12th Edition',3,'EGCE'),
(24578,'Mechanics of Materials','Mastering Engineering with Pearson EText 10th Edition',3,'EGCE'),
(12397,'Swift Programming','Develop in Swift Fundamentals XCode 13',3,'CPSC'),
(25356,'Artificial Intelligence','Artificial Intelligence : A Modern Approach 4th Edition',3,'CPSC');

INSERT INTO Student VALUES
(332123456,'Andrew','Davis','7 Willow Lane, Redwood City, CA 94061',5551234567,'CPSC'),
(332234567,'Jessica','Brown','25 Maplewood Ave., Springfield, IL 62701',5552345678,'CPSC'),
(332345678,'David','Miller','13 Meadowbrook Dr., Orlando, FL 32801',5553456789,'CPSC'),
(332456789,'Michael','Smith','30 Parkside Terrace, Seattle, WA 98109',5554567890,'CPSC'),
(332567890,'Jay','Leno','18 Riverbend Road, Austin, TX 78701',5555678901,'EGCE'),
(332678901,'Lebron','James','55 Oakwood Drive, Portland, OR 97201',5556789012,'EGCE'),
(332789012,'Blake','Griffin','8 Willowbrook Lane, Denver, CO 80202',5557890123,'EGCE'),
(376485648,'Chris','Paul','42 Cedar Lane, Pittsburgh, PA 15201',5558901234,'EGCE');

INSERT INTO Course_Section VALUES
(74829,04,'EC121','T','6:00 PM','7:45 PM',35,123456789),
(74829,03,'EC202','M/W','5:30 PM','6:45 PM',35,123456789),
(12397,03,'CS101','T/Th','3:15 PM','4:45 PM',35,123456789),
(12397,02,'CS408','M/W','2:00 PM','3:15 PM',35,987654321),
(24578,03,'E101','M/W/F','2:30 PM','3:45 PM',30,987654321),
(24578,02,'E101','M/W','8:30 AM','9:45 AM',30,987654321),
(25356,02,'EC049','T/Th','1:00 PM','2:15 PM',30,246810123),
(25356,01,'H412','M/W','7:00 AM','8:15 AM',30,246810123);

INSERT INTO Enroll VALUES
(332123456,74829,04,'A'),
(332234567,74829,04,'C'),
(332345678,74829,04,'B'),
(332456789,74829,04,'B+'),
(332123456,74829,03,'B-'),
(332234567,74829,03,'D'),
(332345678,24578,03,'F'),
(332456789,24578,03,'D-'),
(332123456,24578,02,'C+'),
(332234567,24578,02,'A-'),
(332345678,24578,02,'A+'),
(332456789,24578,02,'D+'),
(332567890,12397,03,'C'),
(332678901,12397,03,'A-'),
(332789012,12397,03,'B-'),
(376485648,12397,03,'B'),
(332567890,12397,02,'A'),
(332678901,12397,02,'A+'),
(332789012,25356,02,'C'),
(376485648,25356,02,'D'),
(332567890,25356,01,'A-'),
(332678901,25356,01,'B+'),
(332789012,25356,01,'C+'),
(376485648,25356,01,'C-');
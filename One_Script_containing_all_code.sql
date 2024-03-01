/*
Name: Vamshi krishna Chittaloori
Course: IFT / 530
Purpose: Project
Date: 11/28/2023
*/

-- This script can be executed all at once.

IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'VAMSH233')
BEGIN
    CREATE DATABASE VAMSH233;
    PRINT 'Database VAMSH233 created.';
END
ELSE
BEGIN
    PRINT 'Database VAMSH233 already exists.';
END

GO

use VAMSH233

GO


-- Create Students table
CREATE TABLE Students (
    STUDENT_ID INT PRIMARY KEY IDENTITY(1,1),
    NAME VARCHAR(100),
    DATEOFBIRTH DATETIME,
    COUNTRY VARCHAR(40),
    MG_BALANCE MONEY,
    GENDER VARCHAR(10)
);
PRINT 'Students table created'

-- Create University table
CREATE TABLE University (
    UNIVERSITY_CODE INT PRIMARY KEY IDENTITY(1,1),
    RANKING INT,
    FEES MONEY,
    OFFERINGS VARCHAR(100),
    FACULTY VARCHAR(100),
    STUDENT_PAYMENT VARCHAR(100),
    LOCATION VARCHAR(20)
);
PRINT 'University table created'


-- Create Courses table
CREATE TABLE Courses (
    COURSE_NUMBER INT PRIMARY KEY IDENTITY(1,1),
    COURSE_CREDIT INT,
    COURSE_TITLE VARCHAR(40),
    UNIVERSITY_CODE INT,
    FOREIGN KEY (UNIVERSITY_CODE) REFERENCES University(UNIVERSITY_CODE)
);
PRINT 'Courses table created'



-- Create Profile table
CREATE TABLE Profile (
    PROFILE_ID INT PRIMARY KEY IDENTITY(1,1),
    NAME VARCHAR(20),
    STUDENT_ID INT,
    FOREIGN KEY (STUDENT_ID) REFERENCES Students(STUDENT_ID),
    WORK_EXPERIENCE INT,
    DEGREE VARCHAR(90),
    REGISTRATION_ID INT
);

PRINT 'Profile table created'


-- Create Major table
CREATE TABLE Major (
    MAJOR_NAME VARCHAR(100),
    STUDENT_ID INT,
    FOREIGN KEY (STUDENT_ID) REFERENCES Students(STUDENT_ID)
);
PRINT 'Major table created'




-- Create Financial Transactions Fact Table
CREATE TABLE FinancialTransactions (
    TRANSACTION_ID INT PRIMARY KEY IDENTITY(1,1),
    STUDENT_ID INT,
    TRANSACTION_DATE DATETIME,
    AMOUNT MONEY,
    TRANSACTION_TYPE VARCHAR(20),
    FOREIGN KEY (STUDENT_ID) REFERENCES Students(STUDENT_ID)
);
PRINT 'FinancialTransactions table created'


-- Create Course Enrollments Fact Table
CREATE TABLE CourseEnrollments (
    ENROLLMENT_ID INT PRIMARY KEY IDENTITY(1,1),
    STUDENT_ID INT,
    COURSE_NUMBER INT,
    ENROLLMENT_DATE DATETIME,
    GRADE VARCHAR(5),
    FOREIGN KEY (STUDENT_ID) REFERENCES Students(STUDENT_ID),
    FOREIGN KEY (COURSE_NUMBER) REFERENCES Courses(COURSE_NUMBER)
)
PRINT 'CourseEnrollments table created'


-- Create Login table
CREATE TABLE Login (
    ID INT PRIMARY KEY IDENTITY(1,1),
    EMAIL VARCHAR(30),
    PASSWORD VARCHAR(30),
	STUDENT_ID INT,
	FOREIGN KEY (STUDENT_ID) REFERENCES Students(STUDENT_ID)
);
PRINT 'Login table created'


GO



-- Populate Students table with 10 rows
INSERT INTO Students (NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER)
VALUES
    ('John Doe', '1995-03-15', 'USA', 500.00, 'Male'),
    ('Jane Smith', '1998-07-22', 'USA', 700.00, 'Female'),
    ('Alice Johnson', '1990-12-05', 'UK', 300.00, 'Female'),
    ('Bob Williams', '1993-05-18', 'USA', 600.00, 'Male'),
    ('Eva Davis', '1997-09-10', 'Germany', 800.00, 'Female'),
    ('Michael Brown', '1992-02-28', 'USA', 400.00, 'Male'),
    ('Sophia Miller', '1996-11-20', 'Spain', 550.00, 'Female'),
    ('Ryan Wilson', '1994-04-07', 'USA', 750.00, 'Male'),
    ('Olivia Davis', '1999-08-14', 'Brazil', 350.00, 'Female'),
    ('Daniel Lee', '1991-01-25', 'Japan', 900.00, 'Male');

-- Print a message
PRINT 'Populated Students table with 10 rows';

-- Show the contents of the Login table
SELECT * FROM Students;

-- Populate University table with 10 rows
INSERT INTO University (RANKING, FEES, OFFERINGS, FACULTY, STUDENT_PAYMENT, LOCATION)
VALUES
    (1, 15000.00, 'Computer Science, Mathematics, Business', 'Engineering, Business, Science', 'Due on 1st of each month', 'New York'),
    (2, 12000.00, 'Business, Arts', 'Business, Arts', 'Due on 5th of each month', 'Toronto'),
    (3, 13000.00, 'Engineering, Medicine, Arts', 'Engineering, Medicine, Arts', 'Due on 10th of each month', 'London'),
    (4, 11000.00, 'Medicine, Law, Psychology', 'Medicine, Law, Psychology', 'Due on 15th of each month', 'Sydney'),
    (5, 10000.00, 'Arts, Engineering', 'Arts, Engineering', 'Due on 20th of each month', 'Berlin'),
    (6, 14000.00, 'Law, Business', 'Law, Business', 'Due on 25th of each month', 'Paris'),
    (7, 16000.00, 'Engineering, Medicine, Chemistry', 'Engineering, Medicine, Chemistry', 'Due on 1st of each month', 'Madrid'),
    (8, 12500.00, 'Electronics, Psychology', 'Electronics, Psychology', 'Due on 5th of each month', 'Rome'),
    (9, 13500.00, 'Psychology, Chemistry, Engineering', 'Psychology, Chemistry, Engineering', 'Due on 10th of each month', 'Brasília'),
    (10, 14500.00, 'Science, Business', 'Science, Business', 'Due on 15th of each month', 'Tokyo');

-- Print a message
PRINT 'Populated University table with 10 rows';

-- Show the contents of the Login table
SELECT * FROM University;


	-- Populate Courses table with 10 rows
INSERT INTO Courses (COURSE_CREDIT, COURSE_TITLE, UNIVERSITY_CODE)
VALUES
    (3, 'Computer Science Fundamentals', 1),
    (4, 'Business Analytics', 2),
    (3, 'Mathematics for Engineers', 1),
    (5, 'Medicine Basics', 1),
    (2, 'Introduction to Fine Arts', 5),
    (4, 'Advanced Engineering Principles', 3),
    (3, 'Introduction to Law', 4),
    (4, 'Electronics for Beginners', 8),
    (5, 'Psychology in Society', 9),
    (3, 'Chemistry 101', 9);

-- Print a message
PRINT 'Populated Courses table with 10 rows';

-- Show the contents of the Login table
SELECT * FROM Courses;


-- Populate Profile table with 10 rows
INSERT INTO Profile (NAME, STUDENT_ID, WORK_EXPERIENCE, DEGREE, REGISTRATION_ID)
VALUES
    ('John Doe', 1, 2, 'Bachelor of Science', 123456),
    ('Jane Smith', 2, 3, 'Bachelor of Business Administration', 789012),
    ('Alice Johnson', 3, 5, 'Master of Mathematics', 345678),
    ('Bob Williams', 4, 1, 'Bachelor of Medicine', 901234),
    ('Eva Davis', 5, 4, 'Master of Arts', 567890),
    ('Michael Brown', 6, 6, 'Master of Engineering', 123456),
    ('Sophia Miller', 7, 2, 'Bachelor of Law', 789012),
    ('Ryan Wilson', 8, 3, 'Bachelor of Engineering', 345678),
    ('Olivia Davis', 9, 1, 'Master of Psychology', 901234),
    ('Daniel Lee', 10, 4, 'Master of Science', 567890);

-- Print a message
PRINT 'Populated Profile table with 10 rows';

-- Show the contents of the Profile table
SELECT * FROM Profile;


-- Populate Major table with 10 rows
INSERT INTO Major (MAJOR_NAME, STUDENT_ID)
VALUES
    ('Computer Science', 1),
    ('Business Administration', 2),
    ('Mathematics', 3),
    ('Medicine', 4),
    ('Fine Arts', 5),
    ('Engineering', 6),
    ('Law', 7),
    ('Electronics', 8),
    ('Psychology', 9),
    ('Chemistry', 10);

-- Print a message
PRINT 'Populated Major table with 10 rows';

-- Show the contents of the Major table
SELECT * FROM Major;



-- Populate FinancialTransactions table with 20 rows
INSERT INTO FinancialTransactions (STUDENT_ID, TRANSACTION_DATE, AMOUNT, TRANSACTION_TYPE)
VALUES
    (1, '2023-01-01', 1000.00, 'Tuition'),
    (2, '2023-01-02', 800.00, 'Tuition'),
    (3, '2023-01-03', 1200.00, 'Tuition'),
    (4, '2023-01-04', 1500.00, 'Fee'),
    (5, '2023-01-05', 900.00, 'Fee'),
    (6, '2023-01-06', 1100.00, 'Tuition'),
    (7, '2023-01-07', 950.00, 'Fee'),
    (8, '2023-01-08', 1300.00, 'Tuition'),
    (9, '2023-01-09', 750.00, 'Fee'),
    (10, '2023-01-10', 800.00, 'Tuition'),
    (1, '2023-02-01', 1200.00, 'Fee'),
    (2, '2023-02-02', 1000.00, 'Tuition'),
    (3, '2023-02-03', 800.00, 'Tuition'),
    (4, '2023-02-04', 1300.00, 'Fee'),
    (5, '2023-02-05', 950.00, 'Fee'),
    (6, '2023-02-06', 1100.00, 'Tuition'),
    (7, '2023-02-07', 900.00, 'Tuition'),
    (8, '2023-02-08', 1200.00, 'Fee'),
    (9, '2023-02-09', 700.00, 'Tuition'),
    (10, '2023-02-10', 850.00, 'Fee');

-- Print a message
PRINT 'Populated FinancialTransactions table with 20 rows';

-- Show the contents of the FinancialTransactions table
SELECT * FROM FinancialTransactions;


-- Populate CourseEnrollments table with 20 rows
INSERT INTO CourseEnrollments (STUDENT_ID, COURSE_NUMBER, ENROLLMENT_DATE, GRADE)
VALUES
    (1, 1, '2023-01-01', 'A'),
    (2, 2, '2023-01-02', 'B'),
    (3, 3, '2023-01-03', 'A'),
    (4, 4, '2023-01-04', 'C'),
    (5, 5, '2023-01-05', 'B'),
    (6, 6, '2023-01-06', 'A'),
    (7, 7, '2023-01-07', 'B'),
    (8, 8, '2023-01-08', 'A'),
    (9, 9, '2023-01-09', 'C'),
    (10, 10, '2023-01-10', 'B'),
    (1, 2, '2023-02-01', 'B'),
    (2, 3, '2023-02-02', 'A'),
    (3, 4, '2023-02-03', 'B'),
    (4, 5, '2023-02-04', 'C'),
    (5, 6, '2023-02-05', 'A'),
    (6, 7, '2023-02-06', 'C'),
    (7, 8, '2023-02-07', 'B'),
    (8, 9, '2023-02-08', 'A'),
    (9, 10, '2023-02-09', 'B'),
    (10, 1, '2023-02-10', 'C');

-- Print a message
PRINT 'Populated CourseEnrollments table with 20 rows';
-- Show the contents of the CourseEnrollments table
SELECT * FROM CourseEnrollments;


-- Populate Login table with 20 rows
INSERT INTO Login (EMAIL, PASSWORD, STUDENT_ID)
VALUES
    ('john.doe@email.com', 'password123',1),
    ('jane.smith@email.com', 'pass456',2),
    ('alice.johnson@email.com', 'secure789',3),
    ('bob.williams@email.com', 'pass1234',4),
    ('eva.davis@email.com', 'pass5678',5),
    ('michael.brown@email.com', 'secure987',6),
    ('sophia.miller@email.com', 'password4321',7),
    ('ryan.wilson@email.com', 'passabcd',8),
    ('olivia.davis@email.com', 'secure8765',9),
    ('daniel.lee@email.com', 'pass4321',10),
    ('user1@email.com', 'user1pass',1),
    ('user2@email.com', 'user2pass',2),
    ('user3@email.com', 'user3pass',3),
    ('user4@email.com', 'user4pass',4),
    ('user5@email.com', 'user5pass',5),
    ('user6@email.com', 'user6pass',6),
    ('user7@email.com', 'user7pass',7),
    ('user8@email.com', 'user8pass',8),
    ('user9@email.com', 'user9pass',9),
    ('user10@email.com', 'user10pass',10);

-- Print a message
PRINT 'Populated Login table with 20 rows';
-- Show the contents of the Login table
SELECT * FROM Login;

GO

CREATE VIEW StudentInfo_USA_View AS
SELECT * FROM Students
WHERE COUNTRY = 'USA';

GO

select * from StudentInfo_USA_View
GO
-- View 2: Courses offered by the University with code 4
CREATE VIEW CoursesByUniversity4_View AS
SELECT C.COURSE_TITLE, U.OFFERINGS
FROM Courses C
JOIN University U ON C.UNIVERSITY_CODE = U.UNIVERSITY_CODE
WHERE U.UNIVERSITY_CODE = 4;

GO

select * from CoursesByUniversity4_View

GO

-- View 3: Students with more than 2 years of work experience
CREATE VIEW ExperiencedStudents_View AS
SELECT P.*, S.DATEOFBIRTH
FROM Profile P
JOIN Students S ON P.STUDENT_ID = S.STUDENT_ID
WHERE P.WORK_EXPERIENCE > 2;

Go

select * from ExperiencedStudents_View
GO

-- Create Audit table for Students
CREATE TABLE Student_Audit (
    AUDIT_ID INT PRIMARY KEY IDENTITY(1,1),
    STUDENT_ID INT,
    NAME VARCHAR(20),
    DATEOFBIRTH DATETIME,
    COUNTRY VARCHAR(40),
    MG_BALANCE MONEY,
    GENDER VARCHAR(10),
    ACTION VARCHAR(10), -- Insert, Update, Delete
    CHANGE_DATE DATETIME
);

GO

-- Insert Trigger
CREATE TRIGGER tr_Students_Insert
ON Students
AFTER INSERT
AS
BEGIN
    INSERT INTO Student_Audit (ACTION, CHANGE_DATE, STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER)
    SELECT 'INSERT', GETDATE(), STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER
    FROM inserted;
END;
GO

-- Update Trigger
CREATE TRIGGER tr_Students_Update
ON Students
AFTER UPDATE
AS
BEGIN
    INSERT INTO Student_Audit (ACTION, CHANGE_DATE, STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER)
    SELECT 'UPDATE', GETDATE(), STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER
    FROM deleted;
END;
GO

-- Delete Trigger
CREATE TRIGGER tr_Students_Delete
ON Students
AFTER DELETE
AS
BEGIN
    INSERT INTO Student_Audit (ACTION, CHANGE_DATE, STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER)
    SELECT 'DELETE', GETDATE(), STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER
    FROM deleted;
END;
GO

-- Test insert
SET IDENTITY_INSERT Students ON;
INSERT INTO Students (STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER)
VALUES (100, 'John Doe', '1990-01-01', 'USA', 100.00, 'Male');
SET IDENTITY_INSERT Students OFF;

-- Test update
UPDATE Students SET NAME = 'Updated Name' WHERE STUDENT_ID = 100;

-- Test delete
DELETE FROM Students WHERE STUDENT_ID = 100;


select * from Student_Audit

GO

-- Stored Procedure 1: Insert Student

-- Create stored procedure to insert a new student
CREATE PROCEDURE InsertStudent
    @Name VARCHAR(20),
    @DateOfBirth DATETIME,
    @Country VARCHAR(40),
    @MGBalance MONEY,
    @Gender VARCHAR(10)
AS
BEGIN
    INSERT INTO Students (NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER)
    VALUES (@Name, @DateOfBirth, @Country, @MGBalance, @Gender);
END;

GO
-- Test stored procedure to insert a new student
EXEC InsertStudent
    @Name = 'Procedure_Student',
    @DateOfBirth = '1990-01-01',
    @Country = 'USA',
    @MGBalance = 100.00,
    @Gender = 'Male';



select * from Students WHERE NAME = 'Procedure_Student';

GO


-- Create stored procedure to insert a new course
CREATE PROCEDURE InsertCourse
    @CourseCredit INT,
    @CourseTitle VARCHAR(40),
    @UniversityCode INT
AS
BEGIN
    INSERT INTO Courses (COURSE_CREDIT, COURSE_TITLE, UNIVERSITY_CODE)
    VALUES (@CourseCredit, @CourseTitle, @UniversityCode);
END;

GO






-- Test stored procedure to insert a new course
EXEC InsertCourse
    @CourseCredit = 3,
    @CourseTitle = 'Introduction to SQL',
    @UniversityCode = 1;

Select * from Courses where COURSE_TITLE = 'Introduction to SQL'

GO


-- Create a stored procedure with two cursors
CREATE PROCEDURE usp_GetStudentAndCourseDetails
AS
BEGIN
    -- Declare variables
    DECLARE @StudentID INT, @Name VARCHAR(20), @DateOfBirth DATETIME, @Country VARCHAR(40), @MGBalance MONEY, @Gender VARCHAR(10);
    DECLARE @CourseNumber INT, @CourseCredit INT, @CourseTitle VARCHAR(40);

    -- Declare a cursor for Students
    DECLARE student_cursor CURSOR FOR
    SELECT STUDENT_ID, NAME, DATEOFBIRTH, COUNTRY, MG_BALANCE, GENDER
    FROM Students;

    -- Open the Students cursor
    OPEN student_cursor;

    -- Fetch the first row from the Students cursor
    FETCH NEXT FROM student_cursor INTO @StudentID, @Name, @DateOfBirth, @Country, @MGBalance, @Gender;

    -- Loop through the Students cursor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Print or use the student data
        PRINT 'Student ID: ' + CONVERT(VARCHAR, @StudentID) + ', Name: ' + @Name;

        -- Declare a cursor for Courses associated with the current student
        DECLARE course_cursor CURSOR FOR
        SELECT ce.COURSE_NUMBER, c.COURSE_CREDIT, c.COURSE_TITLE
        FROM CourseEnrollments ce
        INNER JOIN Courses c ON ce.COURSE_NUMBER = c.COURSE_NUMBER
        WHERE ce.STUDENT_ID = @StudentID;

        -- Open the Courses cursor
        OPEN course_cursor;

        -- Fetch the first row from the Courses cursor
        FETCH NEXT FROM course_cursor INTO @CourseNumber, @CourseCredit, @CourseTitle;

        -- Loop through the Courses cursor
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Print or use the course data
            PRINT 'Course Number: ' + CONVERT(VARCHAR, @CourseNumber) + ', Title: ' + @CourseTitle;

            -- Fetch the next row from the Courses cursor
            FETCH NEXT FROM course_cursor INTO @CourseNumber, @CourseCredit, @CourseTitle;
        END;

        -- Close and deallocate the Courses cursor
        CLOSE course_cursor;
        DEALLOCATE course_cursor;

        -- Fetch the next row from the Students cursor
        FETCH NEXT FROM student_cursor INTO @StudentID, @Name, @DateOfBirth, @Country, @MGBalance, @Gender;
    END;

    -- Close and deallocate the Students cursor
    CLOSE student_cursor;
    DEALLOCATE student_cursor;
END;
GO



EXEC usp_GetStudentAndCourseDetails;

GO





-- Drop Insert Trigger if it exists
-- DROP statements

-- Drop Insert Trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'tr_Students_Insert')
BEGIN
    DROP TRIGGER tr_Students_Insert;
    PRINT 'Insert Trigger dropped.';
END
ELSE
BEGIN
    PRINT 'Insert Trigger does not exist.';
END
GO

-- Drop Update Trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'tr_Students_Update')
BEGIN
    DROP TRIGGER tr_Students_Update;
    PRINT 'Update Trigger dropped.';
END
ELSE
BEGIN
    PRINT 'Update Trigger does not exist.';
END
GO

-- Drop Delete Trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'tr_Students_Delete')
BEGIN
    DROP TRIGGER tr_Students_Delete;
    PRINT 'Delete Trigger dropped.';
END
ELSE
BEGIN
    PRINT 'Delete Trigger does not exist.';
END
GO

IF OBJECT_ID('StudentInfo_USA_View', 'V') IS NOT NULL
BEGIN
    DROP VIEW StudentInfo_USA_View;
	PRINT 'StudentInfo_USA_View View dropped'
END
GO

IF OBJECT_ID('CoursesByUniversity4_View', 'V') IS NOT NULL
BEGIN
    DROP VIEW CoursesByUniversity4_View;
	PRINT 'CoursesByUniversity4_View View dropped'
END
GO

IF OBJECT_ID('ExperiencedStudents_View', 'V') IS NOT NULL
BEGIN
    DROP VIEW ExperiencedStudents_View;
	PRINT 'ExperiencedStudents_View View dropped'
END
GO

-- Drop Procedures
IF OBJECT_ID('InsertStudent', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE InsertStudent;
	PRINT 'InsertStudent Procedure dropped'
END
GO

IF OBJECT_ID('InsertCourse', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE InsertCourse;
	PRINT 'InsertCourse Procedure dropped'
END
GO


IF OBJECT_ID('usp_GetStudentAndCourseDetails', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE usp_GetStudentAndCourseDetails;
	PRINT 'usp_GetStudentAndCourseDetails Procedure dropped'
END

GO



-- Drop tables
IF OBJECT_ID('Major', 'U') IS NOT NULL
BEGIN
    DROP TABLE Major;
	PRINT 'Major Table dropped'

END

IF OBJECT_ID('Profile', 'U') IS NOT NULL
BEGIN
    DROP TABLE Profile;
	PRINT 'Profile Table dropped'

END

IF OBJECT_ID('Student_Audit', 'U') IS NOT NULL
BEGIN
    DROP TABLE Student_Audit;
	PRINT 'Student_Audit Table dropped'

END

IF OBJECT_ID('CourseEnrollments', 'U') IS NOT NULL
BEGIN
    DROP TABLE CourseEnrollments;
	PRINT 'CourseEnrollments Table dropped'

END

IF OBJECT_ID('FinancialTransactions', 'U') IS NOT NULL
BEGIN
    DROP TABLE FinancialTransactions;
	PRINT 'FinancialTransactions Table dropped'

END

IF OBJECT_ID('Courses', 'U') IS NOT NULL
BEGIN
    DROP TABLE Courses;
	PRINT 'Courses Table dropped'

END

IF OBJECT_ID('University', 'U') IS NOT NULL
BEGIN
    DROP TABLE University;
	PRINT 'University Table dropped'

END



IF OBJECT_ID('Login', 'U') IS NOT NULL
BEGIN
    DROP TABLE Login;
	PRINT 'Login Table dropped'

END

IF OBJECT_ID('Student_Audit', 'U') IS NOT NULL
BEGIN
    DROP TABLE Student_Audit;
	PRINT 'Student_Audit Table dropped'

END

IF OBJECT_ID('Students', 'U') IS NOT NULL
BEGIN
    DROP TABLE Students;
	PRINT 'Students Table dropped'

END

/*
-- Drop the database if it exists
USE master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'VAMSH233')
BEGIN
    DROP DATABASE VAMSH233;
	PRINT 'VAMSH233 Database dropped'
END 
*/

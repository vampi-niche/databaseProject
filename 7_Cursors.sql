/*
Name: Vamshi krishna Chittaloori
Course: IFT / 530
Purpose: Project - Cursors
Date: 11/28/2023
*/

USE VAMSH233
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



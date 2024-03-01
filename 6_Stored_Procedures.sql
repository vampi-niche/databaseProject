/*
Name: Vamshi krishna Chittaloori
Course: IFT / 530
Purpose: Project - Stored Procedures
Date: 11/28/2023
*/

USE VAMSH233
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

-- Stored Procedure 2: Insert Course
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
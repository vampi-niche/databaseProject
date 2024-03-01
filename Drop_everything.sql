/*
Name: Vamshi krishna Chittaloori
Course: IFT / 530
Purpose: Project - Delete Everything
Date: 11/28/2023
*/

USE VAMSH233;
GO
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
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'VAMSH233')
BEGIN
    DROP DATABASE VAMSH233;
	PRINT 'DATABASE VAMSH233 dropped'
END
*/

/*
Name: Vamshi krishna Chittaloori
Course: IFT / 530
Purpose: Project - create tables
Date: 11/28/2023
*/

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
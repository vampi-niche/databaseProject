/*
Name: Vamshi krishna Chittaloori
Course: IFT / 530
Purpose: Project - Trigger
Date: 11/28/2023
*/

USE VAMSH233

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
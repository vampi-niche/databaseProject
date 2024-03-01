
/*
Name: Vamshi krishna Chittaloori
Course: IFT / 530
Purpose: Project - Views
Date: 11/28/2023
*/

USE VAMSH233
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
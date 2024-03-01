
/*
Name: Vamshi krishna Chittaloori
Course: IFT / 530
Purpose: Project - Populate Tables with data
Date: 11/28/2023
*/

USE VAMSH233
Go

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
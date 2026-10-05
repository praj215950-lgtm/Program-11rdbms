-- Lab Program 11
-- Create the StudentDetails view.
--
-- The view must display:
-- StudentName
-- CourseName
-- DepartmentName
--
-- Required view name:
-- StudentDetails

USE CollegeDB;

-- Write your solution below.

-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert Department values
INSERT INTO Department VALUES
(1, 'CSE'),
(2, 'IT'),
(3, 'ECE');

-- Insert Student values
INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Divya', 2),
(103, 'Karthik', 1),
(104, 'Nisha', 3);

-- Insert Course values
INSERT INTO Course VALUES
(201, 'DBMS'),
(202, 'Web Technology'),
(203, 'Python');

-- Insert Enrollment values
INSERT INTO Enrollment VALUES
(1, 101, 201),
(2, 101, 202),
(3, 102, 203),
(4, 103, 201),
(5, 104, 202);

-- Create the View
CREATE VIEW StudentDetails AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
JOIN Department
    ON Student.DepartmentID = Department.DepartmentID
JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
JOIN Course
    ON Enrollment.CourseID = Course.CourseID;

-- Display the View
SELECT * FROM StudentDetails;

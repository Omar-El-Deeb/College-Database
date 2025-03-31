create database DEPI_DB
use DEPI_DB
select *from DEPI_DB

-- Create Tables

-- Table: Topic
CREATE TABLE Topic (
    Top_Id INT PRIMARY KEY not null,
    Top_Name NVARCHAR(50)
);

-- Table: Course
CREATE TABLE Course (
    Crs_Id INT PRIMARY KEY not null,
    Crs_Name NVARCHAR(50),
    Crs_Duration INT,
    Top_Id INT,
    FOREIGN KEY (Top_Id) REFERENCES Topic(Top_Id)
);

-- Table: Department
CREATE TABLE Department (
    Dept_Id INT PRIMARY KEY not null,
    Dept_Name NVARCHAR(50),
    Dept_Desc NVARCHAR(100),
    Dept_Location NVARCHAR(50),
    Dept_Manager INT,
    Manager_HireDate DATE,
);

-- Table: Instructor
CREATE TABLE Instructor (
    Ins_Id INT PRIMARY KEY not null,
    Ins_Name NVARCHAR(50),
    Degree NVARCHAR(50),
    Salary DECIMAL(10, 2),
    Dept_Id INT,
    FOREIGN KEY (Dept_Id) REFERENCES Department(Dept_Id)
);

-- Table: Student
CREATE TABLE Student (
    St_Id INT PRIMARY KEY not null,
    St_Fname NVARCHAR(50),
    St_Lname NVARCHAR(50),
    St_Address NVARCHAR(100),
    St_Age INT,
    Dept_Id INT,
    St_Super INT,
    FOREIGN KEY (Dept_Id) REFERENCES Department(Dept_Id),
    FOREIGN KEY (St_Super) REFERENCES Instructor(Ins_Id)
);


-- Table: Ins_Course
CREATE TABLE Ins_Course (
    Ins_Id INT not null,
    Crs_Id INT not null,
    Evaluation NVARCHAR(50),
    PRIMARY KEY (Ins_Id, Crs_Id),
    FOREIGN KEY (Ins_Id) REFERENCES Instructor(Ins_Id),
    FOREIGN KEY (Crs_Id) REFERENCES Course(Crs_Id)
);

-- Table: Stud_Course
CREATE TABLE Stud_Course (
    St_Id INT not null,
    Crs_Id INT not null,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (St_Id, Crs_Id),
    FOREIGN KEY (St_Id) REFERENCES Student(St_Id),
    FOREIGN KEY (Crs_Id) REFERENCES Course(Crs_Id)
);


-- Insert Data

-- Insert Data into Topic
INSERT INTO Topic (Top_Id, Top_Name) VALUES
(1, 'Programming'),
(2, 'DB'),
(3, 'Web'),
(4, 'Operating System'),
(5, 'Design');

-- Insert Data into Course
INSERT INTO Course (Crs_Id, Crs_Name, Crs_Duration, Top_Id) VALUES
(100, 'HTML', 20, 3),
(200, 'C Programming', 60, 1),
(300, 'OOP', 80, 1),
(400, 'Unix', 50, 4),
(500, 'SQL Server', 60, 2);

-- Insert Data into Department
INSERT INTO Department (Dept_Id, Dept_Name, Dept_Desc, Dept_Location, Dept_Manager, Manager_HireDate)
VALUES 
(10, 'SD', 'System Development', 'Cairo', NULL, '2000-01-01'),
(20, 'EL', 'E-Learning', 'Mansoura', NULL, '2002-10-02'),
(30, 'Java', 'Java', 'Cairo', NULL, '2008-05-04'),
(40, 'MM', 'Multimedia', 'Alex', NULL, '2009-01-01'),
(50, 'Unix', 'Unix', 'Alex', NULL, NULL),
(60, 'NC', 'Network', 'Cairo', NULL, NULL),
(70, 'EB', 'E-Business', 'Alex', NULL, NULL);

-- Insert Data into Instructor
INSERT INTO Instructor (Ins_Id, Ins_Name, Degree, Salary, Dept_Id) VALUES
(1, 'Ahmed', 'Master', NULL, 10),
(2, 'Hany', 'Master', NULL, 10),
(3, 'Reham', 'Master', NULL, 10),
(4, 'Yasmin', 'PHD', NULL, 10),
(5, 'Amany', 'PHD', NULL, 10),
(6, 'Eman', 'Master', NULL, 10),
(7, 'Saly', NULL, NULL, 10),
(8, 'Amr', NULL, NULL, 30),
(9, 'Hussien', NULL, NULL, 50),
(10, 'Khalid', NULL, NULL, 30),
(11, 'Salah', NULL, NULL, 70);

-- Insert Data into Student
INSERT INTO Student (St_Id, St_Fname, St_Lname, St_Address, St_Age, Dept_Id, St_Super) VALUES
(1, 'Ahmed', 'Hassan', 'Cairo', 20, 10, NULL),
(2, 'Amr', 'Magdy', 'Cairo', 21, 10, 1),
(3, 'Mona', 'Saleh', 'Cairo', 22, 10, 1),
(4, 'Ahmed', 'Mohamed', 'Alex', 23, 10, 1),
(5, 'Khalid', 'Mohamed', 'Alex', 24, 10, 1),
(6, 'Heba', 'Farouk', 'Mansoura', 25, 20, NULL),
(7, 'Ali', 'Hussien', 'Cairo', 25, 20, 6),
(8, 'Mohamed', 'Fars', 'Alex', 28, 20, 6);

-- Insert Data into Ins_Course
INSERT INTO Ins_Course (Ins_Id, Crs_Id, Evaluation) VALUES
(1, 100, 'Good'),
(1, 200, 'Good'),
(1, 300, 'Good'),
(2, 400, 'VGood'),
(2, 500, 'Good'),
(3, 200, 'Distinct'),
(3, 100, 'VGood'),
(3, 300, 'Good'),
(4, 200, 'Good'),
(4, 300, 'Good');

-- Insert Data into Stud_Course
INSERT INTO Stud_Course(Crs_Id, St_Id, Grade) VALUES
(100, 1, 100),
(100, 2, 90),
(100, 3, 80),
(100, 4, 70),
(100, 5, 100),
(100, 6, 90),
(200, 1, 90),
(200, 2, 90),
(200, 3, 80),
(200, 4, 80);

-- Update Salaries in Instructor
UPDATE Instructor
SET Salary = CASE 
    WHEN Ins_Id = 1 THEN 5000.00
    WHEN Ins_Id = 2 THEN 5200.00
    WHEN Ins_Id = 3 THEN 4800.00
    WHEN Ins_Id = 4 THEN 7000.00
    WHEN Ins_Id = 5 THEN 7500.00
    WHEN Ins_Id = 6 THEN 5300.00
    WHEN Ins_Id = 7 THEN 4500.00
    WHEN Ins_Id = 8 THEN 6000.00
    WHEN Ins_Id = 10 THEN 5900.00
    WHEN Ins_Id = 11 THEN 5600.00
END
WHERE Salary IS NULL;

--Display all the data in each Table
select *from Department
select *from Ins_Course
select *from Instructor
select *from Stud_Course
select *from Student
select *from Topic
select *from Course

 -- The number of students who have a value in their age.
select count(*) as 'number of students' from Student where St_Age is not null;

--	Get all instructors Names without repetition
select Distinct Ins_Name from Instructor 

--	Display student with the Recommended Format
select  s.St_Id as 'Student Id', s.St_Fname+' '+ s.St_Lname as 'Student Full Name',
d.Dept_Name as 'Department Name'
from Student s
join Department d on s.Dept_Id=d.Dept_Id

--	Display instructor Name and Department Name
select i.Ins_Name, d.Dept_Name from Instructor i
left join Department d on i.Dept_Id=d.Dept_Id

--	Display student full name and the name of the course he is taking For only courses which have a grade
select s.St_Fname+' '+ s.St_Lname as 'Student Full Name',
c.Crs_Name
from Student s
join Course c 
join Stud_Course SD on c.Crs_Id=SD.Crs_Id
on s.St_Id=SD.St_Id where SD.Grade is not null;

--	Display number of courses for each topic name
select count (c.Crs_Id) as 'Number of Courses',t.Top_Name from Course c
join Topic t
on c.Top_Id=t.Top_Id
group by t.Top_Name
--	Max and min salary for instructors
select max(Salary) from Instructor
select min(Salary) from Instructor

--	Instructors who have salaries less than the average salary of all instructors
select Ins_Name, Salary from Instructor where salary< (Select AVG(Salary) from Instructor)

--	The Department name that contains the instructor who receives the minimum salary
Select d.Dept_Name from Instructor i 
join department d on i.Dept_Id=d.Dept_Id
where i.salary= (select min(salary) from Instructor)

--	Max two salaries in instructor table.
SELECT DISTINCT TOP 2 Salary FROM Instructor ORDER BY Salary DESC;

--	Instructor name and his salary but if there is no salary display NA keyword instead. “use coalesce Function”
SELECT Ins_Name AS 'Instructor Name', COALESCE(CAST(Salary AS NVARCHAR(50)), 'NA') AS Salary
FROM Instructor;

--	Average Salary for instructors
Select Format(AVG(Salary),'0.00') as 'Average Salary' from Instructor

-- Student first name and the data of his supervisor
Select s.St_Fname as 'Students First name',su.* from Student s
join Instructor su 
on s.St_Super=su.Ins_Id 

-- Procedure to retrieve number of students for specific department name. 
CREATE PROCEDURE Student_Count_By_Department
    @DeptName NVARCHAR(50)
AS BEGIN SELECT COUNT(s.St_Id) AS NumberOfStudents
FROM Student s
JOIN Department d ON s.Dept_Id = d.Dept_Id
WHERE d.Dept_Name = @DeptName;
END;
EXEC Student_Count_By_Department @DeptName = 'EL';

-- View that contains Student Name and his Courses that he takes
CREATE VIEW StudentCoursesView AS
SELECT s.St_Fname + ' ' + s.St_Lname AS StudentName,
c.Crs_Name AS CourseName
FROM Student s
JOIN Stud_Course sc ON s.St_Id = sc.St_Id
JOIN Course c ON sc.Crs_Id = c.Crs_Id;
SELECT * FROM StudentCoursesView;

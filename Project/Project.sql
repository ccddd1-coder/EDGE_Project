Create DATABASE Geological_Field_Work_Management_System;




Creating the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);



-- Creating the StudentGroups table
CREATE TABLE StudentGroups (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(100)
);




-- Creating the StudentGroupMembers table
CREATE TABLE StudentGroupMembers (
    GroupMemberID INT PRIMARY KEY,
    StudentID INT,
    GroupID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (GroupID) REFERENCES StudentGroups(GroupID)
);



-- Creating the Teachers table
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
	City Varchar(30),
	Designation VARCHAR(30)
);




-- Creating the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


-- Creating the Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

--Creating the samplelocation table
CREATE TABLE SampleLocations (
    LocationID INT PRIMARY KEY,
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6),
    Description TEXT,
    CollectedDate DATE
);




---- Creating the RockSamples table
CREATE TABLE RockSamples (
    SampleID INT PRIMARY KEY,
    LocationID INT,
    RockType VARCHAR(100),
    SampleWeight FLOAT,
    CollectedBy INT,
    FOREIGN KEY (LocationID) REFERENCES SampleLocations(LocationID),
    FOREIGN KEY (CollectedBy) REFERENCES Students(StudentID)
);



-- Creating the MineralAnalysis table
CREATE TABLE MineralAnalysis (
    AnalysisID INT PRIMARY KEY,
    SampleID INT,
    MineralType VARCHAR(100),
    Percentage FLOAT,
    AnalysisDate DATE,
    FOREIGN KEY (SampleID) REFERENCES RockSamples(SampleID)
);


-- Creating the FieldNotes table
CREATE TABLE FieldNotes (
    NoteID INT PRIMARY KEY,
    LocationID INT,
    NoteDate DATE,
    NoteText TEXT,
    FOREIGN KEY (LocationID) REFERENCES SampleLocations(LocationID)
);



-- Creating the Committees table
CREATE TABLE Committees (
    CommitteeID INT PRIMARY KEY,
    CommitteeName VARCHAR(100),
    CommitteeType VARCHAR(100)
);



-- Creating the CommitteeMembers table
CREATE TABLE CommitteeMembers (
    CommitteeMemberID INT PRIMARY KEY,
    CommitteeID INT,
    MemberID INT,
    Role VARCHAR(100),
    FOREIGN KEY (CommitteeID) REFERENCES Committees(CommitteeID)
);




-- Creating the FieldBudgets table
CREATE TABLE FieldBudgets (
    BudgetID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Description TEXT
);



-- Creating the MoneyCollections table
CREATE TABLE MoneyCollections (
    CollectionID INT PRIMARY KEY,
    StudentID INT,
    Amount DECIMAL(10, 2),
    CollectedDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);




-- Inserting values into Students
INSERT INTO Students (StudentID, Name, Email, Phone) VALUES
(1, 'John Doe', 'johndoe@example.com', '123-456-7890'),
(2, 'Jane Smith', 'janesmith@example.com', '098-765-4321'),
(3, 'Alice Johnson', 'alicejohnson@example.com', '555-555-5555');


-- Inserting values into StudentGroups
INSERT INTO StudentGroups (GroupID, GroupName) VALUES
(1, 'Group A'),
(2, 'Group B'),
(3, 'Group C');


-- Inserting values into StudentGroupMembers
INSERT INTO StudentGroupMembers (GroupMemberID, StudentID, GroupID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);


-- Inserting values into Teachers
INSERT INTO Teachers (TeacherID, Name, Email, Phone, City, Designation) VALUES
(1, 'Dr. Smith', 'drsmith@example.com', '111-222-3333' , 'Barishal' , 'Associate Professsor'),
(2, 'Prof. Johnson', 'profjohnson@example.com', '444-555-6666' , 'Dhaka' , 'Professor'),
(3, 'Dr. Williams', 'drwilliams@example.com', '777-888-9999' 'Rangpur' , 'Lecturer');


-- Inserting values into Courses
INSERT INTO Courses (CourseID, CourseName, Credits, TeacherID) VALUES
(1, 'Geology 101', 3, 1),
(2, 'Mineralogy', 4, 2),
(3, 'Petrology', 3, 3);



-- Inserting values into Enrollments
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade) VALUES
(1, 1, 1, 'A'),
(2, 2, 2, 'B'),
(3, 3, 3, 'A');


-- Inserting values into SampleLocations using converted decimal degrees
INSERT INTO SampleLocations (LocationID, Latitude, Longitude, Description, CollectedDate) VALUES
(1, 40.4461, -79.9822, 'Observation point 1', '2024-01-01'),
(2, 34.0522, -118.2437, 'Observation point 2', '2024-02-01'),  
(3, 51.5074, -0.1278, 'Observation point 3', '2024-03-01');



-- Inserting values into RockSamples
INSERT INTO RockSamples (SampleID, LocationID, RockType, SampleWeight, CollectedBy) VALUES
(1, 1, 'Granite', 5.5, 1),
(2, 2, 'Sandstone', 2.3, 2),
(3, 3, 'Claystone', 4.1, 3);



-- Inserting values into MineralAnalysis
INSERT INTO MineralAnalysis (AnalysisID, SampleID, MineralType, Percentage, AnalysisDate) VALUES
(1, 1, 'Quartz', 60.0, '2024-04-01'),
(2, 2, 'Feldspar', 25.0, '2024-05-01'),
(3, 3, 'Mica', 15.0, '2024-06-01');



-- Inserting values into FieldNotes
INSERT INTO FieldNotes (NoteID, LocationID, NoteDate, NoteText) VALUES
(1, 1, '2024-01-01', 'Observed granite formations.'),
(2, 2, '2024-02-01', 'Sandy area with some quartz grains.'),
(3, 3, '2024-03-01', 'Claystone samples collected.');



-- Inserting values into Committees
INSERT INTO Committees (CommitteeID, CommitteeName, CommitteeType) VALUES
(1, 'Food Committee', 'Food'),
(2, 'Core Committee', 'Core'),
(3, 'Transport Committee', 'Transport');


-- Inserting values into CommitteeMembers
INSERT INTO CommitteeMembers (CommitteeMemberID, CommitteeID, MemberID, Role) VALUES
(1, 1, 1, 'Member'),
(2, 2, 2, 'Member'),
(3, 3, 3, 'Member');




-- Inserting values into FieldBudgets
INSERT INTO FieldBudgets (BudgetID, Amount, Description) VALUES
(1, 10000.00, 'Budget for food and accommodation.'),
(2, 5000.00, 'Budget for transport.'),
(3, 3000.00, 'Budget for equipment.');



-- Inserting values into MoneyCollections
INSERT INTO MoneyCollections (CollectionID, StudentID, Amount, CollectedDate) VALUES
(1, 1, 100.00, '2024-01-01'),
(2, 2, 150.00, '2024-02-01'),
(3, 3, 200.00, '2024-03-01');

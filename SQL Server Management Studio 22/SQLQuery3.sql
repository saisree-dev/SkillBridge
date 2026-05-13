USE SkillBridgeDB;
GO

-- Create Roles table
CREATE TABLE Roles (
    RoleId INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(100) NOT NULL
);

-- Create Skills table
CREATE TABLE Skills (
    SkillId INT PRIMARY KEY IDENTITY(1,1),
    SkillName NVARCHAR(100) NOT NULL
);

-- Create Bridge table for Many-to-Many relationship
CREATE TABLE RoleSkills (
    RoleSkillId INT PRIMARY KEY IDENTITY(1,1),
    RoleId INT FOREIGN KEY REFERENCES Roles(RoleId),
    SkillId INT FOREIGN KEY REFERENCES Skills(SkillId)
);

-- Insert Sample Data
INSERT INTO Roles (RoleName) VALUES ('Frontend Developer'), ('Backend Developer');
INSERT INTO Skills (SkillName) VALUES ('HTML'), ('CSS'), ('JavaScript'), ('C#'), ('SQL');

-- Map Frontend (Role 1) to HTML (1), CSS (2), JS (3)
INSERT INTO RoleSkills (RoleId, SkillId) VALUES (1,1), (1,2), (1,3);

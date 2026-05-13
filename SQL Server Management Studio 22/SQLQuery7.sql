-- 1. DELETE the unwanted skills
DELETE FROM dbo.Skills 
WHERE SkillName IN ('C#', 'SQL');

-- 2. INSERT the new skills
INSERT INTO dbo.Skills (SkillName) 
VALUES 
('React'), 
('Node.js'), 
('DSA'), 
('C'), 
('Microcontrollers');

-- 3. VIEW the updated list
SELECT * FROM dbo.Skills;

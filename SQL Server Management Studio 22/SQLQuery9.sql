-- 1. Clear old data from RoleSkills to start fresh
DELETE FROM dbo.RoleSkills;

-- 2. Link Frontend Developer to React
INSERT INTO dbo.RoleSkills (RoleId, SkillId)
SELECT r.RoleId, s.SkillId 
FROM dbo.Roles r, dbo.Skills s 
WHERE r.RoleName = 'Frontend Developer' AND s.SkillName = 'React';

-- 3. Link Backend Developer to Node.js and DSA
INSERT INTO dbo.RoleSkills (RoleId, SkillId)
SELECT r.RoleId, s.SkillId 
FROM dbo.Roles r, dbo.Skills s 
WHERE r.RoleName = 'Backend Developer' AND s.SkillName IN ('Node.js', 'DSA');

-- 4. Link Embedded Developer to C, Microcontrollers, and DSA
INSERT INTO dbo.RoleSkills (RoleId, SkillId)
SELECT r.RoleId, s.SkillId 
FROM dbo.Roles r, dbo.Skills s 
WHERE r.RoleName = 'Embedded Developer' AND s.SkillName IN ('C', 'Microcontrollers', 'DSA');

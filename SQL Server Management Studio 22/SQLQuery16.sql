-- Link the existing HTML, CSS, and JavaScript skills to Frontend Developer
INSERT INTO dbo.RoleSkills (RoleId, SkillId)
SELECT r.RoleId, s.SkillId 
FROM dbo.Roles r, dbo.Skills s 
WHERE r.RoleName = 'Frontend Developer' 
AND s.SkillName IN ('HTML', 'CSS', 'JavaScript');

-- Verify the Frontend Developer's full skill list
SELECT 
    r.RoleName AS [Job Role], 
    s.SkillName AS [Linked Skill]
FROM dbo.RoleSkills rs
JOIN dbo.Roles r ON rs.RoleId = r.RoleId
JOIN dbo.Skills s ON rs.SkillId = s.SkillId
WHERE r.RoleName = 'Frontend Developer';

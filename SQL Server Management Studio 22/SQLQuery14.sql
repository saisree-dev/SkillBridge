SELECT 
    rs.RoleSkillId,
    r.RoleName AS [Job Role], 
    s.SkillName AS [Required Skill]
FROM dbo.RoleSkills rs
JOIN dbo.Roles r ON rs.RoleId = r.RoleId
JOIN dbo.Skills s ON rs.SkillId = s.SkillId
ORDER BY r.RoleName;

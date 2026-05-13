-- This adds the new role
INSERT INTO dbo.Roles (RoleName) 
VALUES ('Embedded Developer');

-- This shows you the updated list immediately after
SELECT * FROM dbo.Roles;

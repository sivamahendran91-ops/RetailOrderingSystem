-- Get your user's Id first from AspNetUsers table, then:
INSERT INTO AspNetUserRoles (UserId, RoleId)
SELECT u.Id, r.Id FROM AspNetUsers u, AspNetRoles r
WHERE u.Email = 'youremail@example.com' AND r.Name = 'Admin';

INSERT INTO Categories (Name) VALUES ('Pizza'),('Cold Drinks'),('Breads'),('Snacks');
INSERT INTO Brands (Name) VALUES ('Home Brand'),('Premium'),('Local');
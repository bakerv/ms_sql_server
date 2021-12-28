SELECT FirstName, LastName, Title,
CONVERT(date, BirthDate) AS BirthDate
FROM Employees
ORDER BY BirthDate
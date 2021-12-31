SELECT CustomerID, CompanyName, Region
FROM Customers
ORDER BY
case when Region IS NULL then 1 else 0 end,
Region,
CustomerID
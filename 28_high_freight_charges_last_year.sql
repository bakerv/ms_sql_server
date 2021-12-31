SELECT TOP 3 ShipCountry, AVG(Freight) AS 'AverageFreight'
FROM Orders
WHERE OrderDate 
BETWEEN DATEADD(YEAR, -1, (SELECT MAX(OrderDate) FROM Orders))
AND (SELECT MAX(OrderDate) FROM Orders)
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
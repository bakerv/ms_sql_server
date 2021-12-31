SELECT TOP 3 shipCountry, AVG(Freight) AS 'AverageFreight'
FROM Orders
GROUP BY shipCountry
ORDER BY 'AverageFreight' DESC


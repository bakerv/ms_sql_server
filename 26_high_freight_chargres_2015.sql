SELECT TOP 3 ShipCountry, AVG(freight) AS 'AverageFreight'
FROM Orders
WHERE YEAR(OrderDate) = '2015'
GROUP BY ShipCountry
ORDER BY 'AverageFreight' DESC

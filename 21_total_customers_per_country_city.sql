SELECT Country, City, COUNT(CustomerID) AS 'Number of Customers'
FROM Customers
GROUP BY Country, City
ORDER BY 'Number of Customers' DESC
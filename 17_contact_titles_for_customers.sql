SELECT ContactTitle,
COUNT(ContactTitle) AS 'Quantity'
FROM Customers
GROUP BY ContactTitle
ORDER BY Quantity DESC
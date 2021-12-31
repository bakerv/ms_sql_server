SELECT Top 10 OrderID, COUNT(OrderID) AS LineItems
FROM OrderDetails
GROUP BY OrderID
Order BY LineItems DESC
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount
FROM OrderDetails
WHERE OrderID IN (SELECT Distinct OrderID
                  FROM OrderDetails
                  WHERE Quantity >= 60
                  GROUP BY OrderID, Quantity
                  HAVING COUNT(OrderID) > 1)
ORDER BY OrderID;

WITH DuplicateOrders AS (
SELECT OrderID
FROM OrderDetails
WHERE Quantity >= 60
GROUP BY OrderID, Quantity
HAVING COUNT(OrderID) > 1)

SELECT OrderID, ProductID, UnitPrice, Quantity, Discount
FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM DuplicateOrders);
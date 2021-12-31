Select OrderDetails.OrderID ,ProductID ,UnitPrice ,Quantity ,Discount
From OrderDetails
 Join (Select DISTINCT OrderID
       From OrderDetails
       Where Quantity >= 60
       Group By OrderID, Quantity
       Having Count(*) > 1 ) AS PotentialProblemOrders
 on PotentialProblemOrders.OrderID = OrderDetails.OrderID
 Order by OrderID, ProductID

 
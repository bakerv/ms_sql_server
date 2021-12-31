SELECT Categories.CategoryName, COUNT(Products.CategoryID) AS 'Product Quantity'
FROM Categories JOIN Products ON (Categories.CategoryID = Products.CategoryID)
GROUP BY Categories.CategoryName
ORDER BY 'Product Quantity' DESC
/* Shopify Data Challenge - Winter 2021 */
/* Question 2 */

/* PART A */

SELECT COUNT(*)
FROM orders o
LEFT JOIN shippers s 
    ON o.ShipperID = s.ShipperID
WHERE s.ShipperName = 'Speedy Express';

/* Answer: 54*/


/* PART B */

SELECT e.LastName
FROM Orders o
LEFT JOIN Employees e
    ON e.EmployeeID = o.EmployeeID
GROUP BY o.EmployeeID
ORDER BY COUNT(o.EmployeeID) DESC
LIMIT 1;

/* Answer: Peacock*/

/* PART C */
/* assuming that 'ordered most' implies total quantity ordered, and not just how many orders it was a part of */

SELECT p.ProductName, SUM(od.Quantity) AS TotalOrdered
FROM Orders o
LEFT JOIN Customers c
    ON c.CustomerID = o.CustomerID
LEFT JOIN OrderDetails od
    ON od.OrderID = o.OrderID
JOIN Products p
    ON p.ProductID = od.ProductID
WHERE c.Country = 'Germany'
GROUP BY p.ProductID
ORDER BY SUM(od.Quantity) DESC
LIMIT 1;

/* Answer: Boston Crab Meat with 160 ordered */
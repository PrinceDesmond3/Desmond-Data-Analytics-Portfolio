-- Total Customers per Countries --
select Country, count(CustomerId) as Total_Customers from customer
group by Country
order by Total_Customers desc;

-- Total Revenue by Country --
select c.Country, round(sum(i.Total), 2) as Total_Revenue
from customer as c
join invoice as i
on c.CustomerId = i.CustomerId
group by c.Country
order by Total_Revenue desc;

-- Top Music Genres by Revenue --
select g.Name as Genre,
	round(sum(il.UnitPrice * il.Quantity), 2) as Total_Revenue
from invoiceline as il
join track as t
on il.TrackId = t.TrackId
join genre as g
on t.GenreId = g. GenreId
group by g.Name
order by Total_Revenue desc;

-- Top 10 Customers by Spending --
SELECT 
    c.CustomerId,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    c.Country,
    ROUND(SUM(i.Total), 2) AS Total_Spent
FROM customer AS c
JOIN invoice AS i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Country
ORDER BY Total_Spent DESC;

-- Top Billing Countries(Revenue + Purchase) --
SELECT c.Country,
       COUNT(i.InvoiceId) AS Total_Invoices
FROM customer AS c
JOIN invoice AS i
ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY Total_Invoices DESC;


-- Top Artists by Sales --
SELECT 
    ar.Name AS Artist,
    ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Total_Revenue
FROM invoiceline AS il
JOIN track AS t ON il.TrackId = t.TrackId
JOIN album AS a ON t.AlbumId = a.AlbumId
JOIN artist AS ar ON a.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY Total_Revenue DESc;




SELECT 
    c.CustomerId,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    c.Country,
    ROUND(SUM(i.Total), 2) AS Total_Spent
FROM customer AS c
JOIN invoice AS i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Country
ORDER BY Total_Spent DESC;





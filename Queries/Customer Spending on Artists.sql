WITH best_selling_artist AS (
    SELECT Ar.artist_id, Ar.name, SUM(IL.unit_price * IL.quantity) AS total_spent 
    FROM invoice_line IL
    JOIN track TR ON IL.track_id = TR.track_id
    JOIN album A ON A.album_id = TR.album_id
    JOIN artist Ar ON Ar.artist_id = A.artist_id
    GROUP BY Ar.artist_id
    ORDER BY total_spent DESC  
)

SELECT bst.artist_id, bst.name as Artist_name ,Cus.first_name as Customer_name,
SUM(InvL.unit_price * InvL.quantity) AS total_spent_on_artist 
FROM customer Cus
JOIN invoice Inv ON Inv.customer_id = Cus.customer_id
JOIN invoice_line InvL ON InvL.invoice_id = Inv.invoice_id
JOIN track Tra ON Tra.track_id = InvL.track_id
JOIN album Alb ON Alb.album_id = Tra.album_id
JOIN best_selling_artist bst ON bst.artist_id = Alb.artist_id
GROUP BY bst.artist_id, Cus.first_name, Cus.last_name, bst.name
ORDER BY total_spent_on_artist DESC;
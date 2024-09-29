with highest_purchase as (
select count(INVL.quantity)as ct, INV.billing_country as country, Gr.name,   
DENSE_RANK() OVER (PARTITION BY billing_country ORDER BY count(INVL.quantity)  DESC) AS ranking
from invoice INV
JOIN invoice_line INVL on INVL.invoice_id = INV.invoice_id
JOIN track TR on TR.track_id = INVL.track_id
JOIN genre Gr on Gr.genre_id = TR.genre_id
GROUP BY INV.billing_country,Gr.name




)
select country, ct
from highest_purchase
where ranking=1
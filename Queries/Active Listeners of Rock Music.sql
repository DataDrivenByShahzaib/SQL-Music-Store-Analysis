select distinct first_name, last_name, email 
from customer Cu
join invoice I on I.customer_id = Cu.customer_id
join invoice_line IL on IL.invoice_id = I.invoice_id
join track TR on TR.track_id = IL.track_id
join genre Ge on Ge.genre_id = Tr.genre_id
where Ge.name = 'Rock'  


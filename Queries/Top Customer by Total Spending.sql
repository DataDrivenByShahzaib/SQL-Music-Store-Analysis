select CUS.customer_id, CUS.first_name, CUS.last_name,sum(INV.total) 
from customer CUS
join invoice INV on INV.customer_id = CUS.customer_id
group by CUS.customer_id
order by sum(INV.total) desc
limit 1
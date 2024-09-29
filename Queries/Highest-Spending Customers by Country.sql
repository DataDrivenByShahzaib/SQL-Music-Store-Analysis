with highest_rank as(

select INV.billing_country as country,
INV.customer_id,Cu.first_name as Customer_name,sum(INV.total) as spending,
dense_rank()over(partition by INV.billing_country order by sum(INV.total) DESC) as ranking 
from invoice INV
join customer Cu on Cu.customer_id = INV.customer_id
GROUP by 1,2,3
ORDER by 4 desc

)
select * from highest_rank where ranking=1
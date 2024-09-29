
select CUS.first_name, sum(INV.total)as spending, 
max(INV.invoice_date) as last_purchase_date
 from invoice INV
join customer CUS on CUS.customer_id = INV.customer_id
group by CUS.first_name, CUS.customer_id
having extract(year from max(INV.invoice_date))!=(
select max(distinct (extract( year from INV.invoice_date))) as yer
from invoice INV
)
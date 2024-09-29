select INV.billing_country as country, count(INV.invoice_id)as invoices
from invoice INV
group by 1
order by 2 desc
limit 1
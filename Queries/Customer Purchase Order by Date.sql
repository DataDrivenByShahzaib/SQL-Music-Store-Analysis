with multiple_purchase as(
select INV.customer_id, count(INV.invoice_id) from track TR
join invoice_line ILV on ILV.track_id = TR.track_id
join invoice INV on INV.invoice_id = ILV.invoice_id
group by INV.customer_id
HAVING  count(INV.invoice_id)>1

)


select CUS.first_name, TR.name as Track_name, INV.invoice_date, 
row_number() over(partition by CUS.first_name order by INV.invoice_date asc) 
as purchase_number 

from track TR
join invoice_line ILV on ILV.track_id = TR.track_id
join invoice INV on INV.invoice_id = ILV.invoice_id
join customer CUS ON CUS.customer_id = INV.customer_id
JOIN multiple_purchase MP on MP.customer_id=CUS.customer_id 
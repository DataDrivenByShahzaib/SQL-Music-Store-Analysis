with genre_purchase as (
select INV.customer_id as customerid, GN.name as Genre_name from track Tr
join genre GN on GN.genre_id = Tr.genre_id
join invoice_line ILV on ILV.track_id = Tr.track_id
join invoice INV on INV.invoice_id = ILV.invoice_id
group by INV.customer_id, GN.name)
select  GP1.Genre_name as Genre1,GP2.Genre_name as Genre2,
count(distinct GP1.customerid) as total_purchases from genre_purchase GP1
join genre_purchase GP2
on GP1.customerid=GP2.customerid and GP1.Genre_name !=GP2.Genre_name
group by 1,2
order by 3 desc
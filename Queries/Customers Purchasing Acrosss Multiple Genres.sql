select CUS.first_name, count(distinct(GN.genre_id)) as purchased_from_genre,
sum(ILV.quantity*ILV.unit_price) as total_spending from track TR
join genre GN on GN.genre_id = TR.genre_id
join invoice_line ILV on ILV.track_id = TR.track_id
join invoice INV on INV.invoice_id = ILV.invoice_id
join Customer CUS on CUS.customer_id = INV.customer_id
group by 1
having count(distinct(GN.genre_id))>3
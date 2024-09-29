select AR.name as Artist_name,extract(Quarter from INV.invoice_date) as Quarter,
extract(year from INV.invoice_date) as year_of_purchase,
sum(ILV.quantity*ILV.unit_price ) as revenue from invoice_line ILV
join invoice INV on INV.invoice_id = ILV.invoice_id
join track TR on TR.track_id = ILV.track_id
join album ALB on ALB.album_id = TR.album_id
join artist AR on AR.artist_id = ALB.artist_id
group by 1,2,3
order by 4 desc
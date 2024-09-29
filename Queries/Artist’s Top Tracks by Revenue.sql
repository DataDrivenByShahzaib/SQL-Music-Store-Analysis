with best_track as (select ART.name as Artist_Name,TR.name as Track_Name, sum(INVL.quantity*INVL.unit_price) as Total_Revenue, 
row_number() over(partition by ART.name order by sum(INVL.quantity*INVL.unit_price) desc ) as ranking
from track TR
join invoice_line INVL on INVL.track_id = TR.track_id
join album ALB on ALB.album_id = TR.album_id
join artist ART on ART.artist_id = ALB.artist_id
group by ART.name, TR.name
order by ART.name
)
select Artist_Name, 
    Track_Name, 
    Total_Revenue from best_track where ranking=1
    
    
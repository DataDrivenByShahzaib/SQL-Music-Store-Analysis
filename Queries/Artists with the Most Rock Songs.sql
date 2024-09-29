select A.name as artist_name, count(A.name) as total_rock_music
from artist A
join album Ab on Ab.artist_id = A.artist_id
join track Tr on Tr.album_id = Ab.album_id
join genre Gr on Gr.genre_id = Tr.genre_id
where Gr.name='Rock'
group by A.name
order by total_rock_music desc
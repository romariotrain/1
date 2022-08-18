select genres.name, count(*) from genres
left join genres_artists on genres.id = genres_artists.genre_id  
group by genres.name;

select count(*) from tracks 
left join albums on tracks.album_id = albums.id
where album_year = 2019 or album_year = 2020;

select albums.name, avg(duration) from tracks 
left join albums on tracks.album_id = albums.id
group by albums.name

select distinct artists.name from artists
join artists_albums on artists_albums.artist_id = artists.id
join albums on albums.id = artists_albums.album_id
where album_year != 2020



select distinct collections.name from collections
join collections_tracks on collections_tracks.collection_id = collections.id
join tracks on tracks.id = collections_tracks.track_id
join albums on tracks.album_id = albums.id 
join artists_albums on artists_albums.album_id = albums.id
join artists on artists_albums.artist_id = artists.id
where artists.name = 'vika';



select albums.name, genres_artists.artist_id from albums 
join artists_albums on artists_albums.album_id = albums.id
join artists on artists_albums.artist_id = artists.id
join genres_artists on genres_artists.artist_id = artists.id
join genres on genres.id = genres_artists.genre_id
group by albums.name, genres_artists.artist_id
having genres_artists.artist_id in (select artist_id from genres_artists group by artist_id having count(*) > 1)


select name, id from tracks
left join collections_tracks on collections_tracks.track_id = tracks.id 
where collections_tracks.track_id IS null

select artists.name from artists
join artists_albums on artists_albums.artist_id = artists.id
join albums on albums.id = artists_albums.album_id
join tracks on tracks.album_id = albums.id
where tracks.duration = (select min(duration) from tracks);


select albums.name from albums
join tracks on tracks.album_id = albums.id
group by albums.name
HAVING COUNT(*) = (SELECT COUNT(*) FROM tracks
JOIN albums ON albums.id = tracks.album_id
GROUP BY albums.name
ORDER BY COUNT(tracks.album_id)
LIMIT 1);

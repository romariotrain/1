create table if not exists Genres (
id SERIAL primary key,
name VARCHAR(60) not null);

create table if not exists Artists (
id SERIAL primary key,
name VARCHAR(60) not null);

create table if not exists genres_artists (
artist_id INTEGER references Artists(id),
genre_id INTEGER references Genres(id),
constraint pk primary key (genre_id, artist_id));

create table if not exists Albums (
id SERIAL primary key,
name VARCHAR(60) not null,
album_year INTEGER not null);

create table if not exists artists_albums (
artist_id INTEGER references Artists(id),
album_id INTEGER references Albums(id),
constraint pk1 primary key (album_id, artist_id));

create table if not exists Tracks (
id SERIAL primary key,
name VARCHAR(60) not null,
duration numeric not null,
album_id INTEGER references albums(id));

create table if not exists Collections (
id SERIAL primary key,
name VARCHAR(60) not null,
collection_year INTEGER not null);

create table if not exists collections_tracks (
track_id INTEGER references Tracks(id),
collection_id INTEGER references Collections(id),
constraint pk2 primary key (collection_id, track_id));
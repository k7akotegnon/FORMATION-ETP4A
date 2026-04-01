-- Tous les albums
SELECT * FROM albums;

-- Albums contenant "Great"
SELECT * FROM albums WHERE title LIKE '%Great%';

-- Nombre total d’albums
SELECT COUNT(*) FROM albums;

-- Supprimer albums contenant "music"
DELETE FROM albums WHERE title LIKE '%music%';

-- Albums écrits par AC/DC
SELECT * FROM albums
JOIN artists ON albums.artist_id = artists.id
WHERE artists.name = 'AC/DC';

-- Titres des albums de AC/DC
SELECT tracks.name FROM tracks
JOIN albums ON tracks.album_id = albums.id
JOIN artists ON albums.artist_id = artists.id
WHERE artists.name = 'AC/DC';

-- Titres de l’album "Let There Be Rock"
SELECT tracks.name FROM tracks
JOIN albums ON tracks.album_id = albums.id
WHERE albums.title = 'Let There Be Rock';

-- Prix et durée totale de l’album "Let There Be Rock"
SELECT albums.price, SUM(tracks.duration) AS total_duration
FROM albums
JOIN tracks ON albums.id = tracks.album_id
WHERE albums.title = 'Let There Be Rock';

-- Coût de la discographie de "Deep Purple"
SELECT SUM(albums.price) FROM albums
JOIN artists ON albums.artist_id = artists.id
WHERE artists.name = 'Deep Purple';

-- Créer un album pour ton artiste favori
INSERT INTO artists (name) VALUES ('Youssou N\'Dour');
INSERT INTO albums (title, artist_id, price) VALUES ('Best of Youssou', 1, 15.99);
INSERT INTO tracks (name, album_id, duration) VALUES ('Birima', 1, 240);

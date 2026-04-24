-- =============================================================
-- REQUÊTES SQL - PROJET MUSIQUE (S5J2)
-- Base de données : Chinook
-- =============================================================

-- 1. Récupérer tous les albums
SELECT * FROM albums;

-- 2. Récupérer tous les albums dont le titre contient "Great"
-- Le symbole % permet de chercher "Great" n'importe où dans le texte [2]
SELECT * FROM albums WHERE Title LIKE '%Great%';

-- 3. Donner le nombre total d'albums contenus dans la base
-- On utilise COUNT(*) pour compter toutes les lignes de la table [2]
SELECT COUNT(*) AS total_albums FROM albums;

-- 4. Supprimer tous les albums dont le titre contient "music"
-- Attention : cette commande retire définitivement les données [2]
DELETE FROM albums WHERE Title LIKE '%music%';

-- 5. Récupérer tous les albums écrits par AC/DC
-- On utilise JOIN pour lier les albums aux artistes via leur ArtistId commun [2]
SELECT albums.* FROM albums JOIN artists ON albums.ArtistId = artists.ArtistId WHERE artists.Name = 'AC/DC';

-- 6. Récupérer uniquement les TITRES des albums de AC/DC
SELECT Title FROM albums JOIN artists ON albums.ArtistId = artists.ArtistId WHERE artists.Name = 'AC/DC';

-- 7. Récupérer la liste des titres de l'album "Let There Be Rock"
-- Ici, on joint la table 'tracks' (chansons) à la table 'albums' [3]
SELECT tracks.Name FROM tracks JOIN albums ON tracks.AlbumId = albums.AlbumId WHERE albums.Title = 'Let There Be Rock';

-- 8. Afficher le prix de cet album ainsi que sa durée totale
-- SUM additionne les valeurs. Milliseconds est la durée en MS, UnitPrice est le prix [4]
SELECT SUM(UnitPrice) AS prix_total, SUM(Milliseconds) AS duree_totale_ms FROM tracks JOIN albums ON tracks.AlbumId = albums.AlbumId WHERE albums.Title = 'Let There Be Rock';

-- 9. Afficher le coût de l'intégralité de la discographie de "Deep Purple"
-- Double jointure : on relie tracks -> albums -> artists [2]
SELECT SUM(tracks.UnitPrice) AS cout_total_deep_purple FROM tracks JOIN albums ON tracks.AlbumId = albums.AlbumId JOIN artists ON albums.ArtistId = artists.ArtistId WHERE artists.Name = 'Deep Purple';

-- 10. Créer l'album de ton artiste favori (Exemple : "The Beatles - Abbey Road")
-- Note : Il faut normalement trois étapes pour renseigner les trois tables [5]

-- a) Ajouter l'artiste
INSERT INTO artists (Name) VALUES ('The Beatles');

-- b) Ajouter l'album (en utilisant l'id de l'artiste créé)
INSERT INTO albums (Title, ArtistId) VALUES ('Abbey Road', (SELECT ArtistId FROM artists WHERE Name = 'The Beatles'));

-- c) Ajouter une chanson à cet album (en utilisant l'id de l'album créé)
INSERT INTO tracks (Name, AlbumId, MediaTypeId, Milliseconds, UnitPrice) VALUES ('Come Together', (SELECT AlbumId FROM albums WHERE Title = 'Abbey Road'), 1, 259000, 0.99);
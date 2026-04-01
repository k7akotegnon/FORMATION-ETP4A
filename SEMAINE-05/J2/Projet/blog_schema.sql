-- Table des utilisateurs
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT, -- identifiant unique
  name TEXT                             -- nom du user
);

-- Table des articles
CREATE TABLE articles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,                           -- titre de l’article
  body TEXT,                            -- contenu de l’article
  user_id INTEGER,                      -- clé étrangère vers users
  FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Table des catégories
CREATE TABLE categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT                            -- titre de la catégorie
);

-- Table des tags
CREATE TABLE tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,                           -- titre du tag
  color TEXT                            -- couleur du tag
);

-- Table de jointure articles ↔ categories
CREATE TABLE articles_categories (
  article_id INTEGER,
  category_id INTEGER,
  FOREIGN KEY(article_id) REFERENCES articles(id),
  FOREIGN KEY(category_id) REFERENCES categories(id)
);

-- Table de jointure categories ↔ tags
CREATE TABLE categories_tags (
  category_id INTEGER,
  tag_id INTEGER,
  FOREIGN KEY(category_id) REFERENCES categories(id),
  FOREIGN KEY(tag_id) REFERENCES tags(id)
);

-- Exemple d’insertion
INSERT INTO users (name) VALUES ('Ibrahima');
INSERT INTO articles (title, body, user_id) VALUES ('Mon premier article', 'Bienvenue sur mon blog !', 1);
INSERT INTO categories (title) VALUES ('Programmation');
INSERT INTO tags (title, color) VALUES ('Ruby', 'red');
INSERT INTO articles_categories (article_id, category_id) VALUES (1, 1);
INSERT INTO categories_tags (category_id, tag_id) VALUES (1, 1);

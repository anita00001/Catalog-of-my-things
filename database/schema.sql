CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE author (
     id SERIAL PRIMARY KEY,
     first_name VARCHAR(255),
     last_name VARCHAR(255)
);

CREATE TABLE source (
     id SERIAL PRIMARY KEY,
     name VARCHAR(255)
);

CREATE TABLE item (
       id SERIAL PRIMARY KEY,
       genre_id INT,
       author_id INT,
       source_id INT,
       label_id INT,
       publish_date DATE,
       archived BOOLEAN,
       FOREIGN KEY (genre_id) REFERENCES genres(id),
       FOREIGN KEY (author_id) REFERENCES authors(id),
       FOREIGN KEY (source_id) REFERENCES sources(id),
       FOREIGN KEY (label_id) REFERENCES labels(id),
       CHECK (publish_date IS NOT NULL),
       CHECK (publish_date <= CURRENT_DATE),
       CHECK (archived IN (TRUE, FALSE))
);

CREATE TABLE music_album (
      id SERIAL PRIMARY KEY,
      item_id INT UNIQUE,
      on_spotify BOOLEAN,
      FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE movie (
        id SERIAL PRIMARY KEY,
        item_id INT UNIQUE,
        silent BOOLEAN,
        FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE game (
       id SERIAL PRIMARY KEY,
       item_id INT UNIQUE,
       multiplayer BOOLEAN,
       last_played_at DATE,
       FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE book (
       id SERIAL PRIMARY KEY,
       item_id INT UNIQUE,
       publisher VARCHAR(255),
       cover_state VARCHAR(255),
       FOREIGN KEY (item_id) REFERENCES items(id)
);


CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255)
);

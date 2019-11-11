-- DROP TABLE vet_assign;
-- DROP TABLE human_assign;
DROP TABLE animals;
DROP TABLE vets;
DROP TABLE humans;
DROP TABLE notes;

CREATE TABLE vets(
  id            SERIAL4 PRIMARY KEY,
  name          VARCHAR(255),
  role          VARCHAR(255),
  fav_colour    VARCHAR(255),
  profile_image VARCHAR(255)
);

CREATE TABLE humans(
  id         SERIAL4 PRIMARY KEY,
  name       VARCHAR(255),
  email      VARCHAR(255),
  address    TEXT,
  phone      VARCHAR(255),
  fav_colour VARCHAR(255)
);

CREATE TABLE animals(
  id            SERIAL4    PRIMARY KEY,
  name          VARCHAR(255),
  date_of_birth VARCHAR(255),
  type          VARCHAR(255),
  fav_colour    VARCHAR(255),
  human_id      INT4 REFERENCES humans(id),
  vet_id        INT4 REFERENCES vets(id),
  age           INT4
);

CREATE TABLE notes(
  id        SERIAL4 PRIMARY KEY,
  animal_id INT4 REFERENCES animals(id),
  vet_id    INT4,
  body      TEXT,
  date      VARCHAR(255)
);

-- CREATE TABLE vet_assign(
--   id        SERIAL4 PRIMARY KEY,
--   vet_id    INT4 REFERENCES vets(id),
--   animal_id INT4 REFERENCES animals(id)
-- );

-- CREATE TABLE human_assign(
--   id        SERIAL4 PRIMARY KEY,
--   human_id    INT4 REFERENCES humans(id),
--   animal_id INT4 REFERENCES animals(id)
-- );

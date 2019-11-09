DROP TABLE vets;
DROP TABLE animals;
DROP TABLE humans;

CREATE TABLE vets(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  role VARCHAR(255),
  fav_colour VARCHAR(255),
  profile_image VARCHAR(255)
);

CREATE TABLE animals(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth VARCHAR(255),
  type VARCHAR(255),
  fav_colour VARCHAR(255),
  age INT4
);

CREATE TABLE humans(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  address TEXT,
  phone VARCHAR(255),
  fav_colour VARCHAR(255)
);

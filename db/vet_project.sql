DROP TABLE vets;

CREATE TABLE vets(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  role VARCHAR(255),
  fav_colour VARCHAR(255),
  profile_image VARCHAR(255)
);

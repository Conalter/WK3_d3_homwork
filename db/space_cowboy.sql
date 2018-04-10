
DROP TABLE space_cowboys;

CREATE TABLE space_cowboys(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  value INT,
  danger_level VARCHAR(255),
  fav_weapon VARCHAR(255),
  cashed_in VARCHAR(255),
  collected_by VARCHAR(255)
);

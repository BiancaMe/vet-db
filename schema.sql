/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id INT PRIMARY KEY NOT NULL,
   name CHAR NOT NULL,
   date_of_birth DATE,
   escape_attempts INT,
   neutered BOOL,
   weight_kg DECIMAL(5,2)
);

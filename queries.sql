/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth >= '01/01/2016' AND date_of_birth <= '31/12/2019';

SELECT name FROM animals WHERE neutered = 'TRUE' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Pikachu' OR name = 'Agumon';

SELECT name, escape_attempts FROM animals WHERE weight_kg >= 10.5;

SELECT * FROM animals WHERE neutered = 'TRUE';

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals  WHERE weight_kg >= 10.4 AND weight_kg <= 17.3 ;

/* Transitions */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01/01/2022';
SAVEPOINT delete_after;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO delete_after;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg  < 0;
COMMIT;
SELECT * FROM animals;

/* Answers */
SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT SUM(weight_kg) /   count(*) FROM animals;
SELECT CASE WHEN SUM(CASE WHEN neutered = TRUE THEN escape_attempts END ) > SUM(CASE WHEN neutered = FALSE THEN escape_attempts END )   THEN 'Neutered'  WHEN SUM(CASE WHEN neutered = TRUE THEN escape_attempts END ) = SUM(CASE WHEN neutered = FALSE THEN escape_attempts END )   THEN 'Neutered and Not Neutered'   ELSE 'Not Neutered' END FROM animals; 
SELECT species, MAX(weight_kg) , MIN(weight_kg) FROM animals WHERE species = 'digimon'   GROUP BY species UNION SELECT species , MAX(weight_kg) , MIN(weight_kg) FROM animals WHERE species = 'pokemon' GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '01/01/1990' AND  date_of_birth <= '01/01/2000'  GROUP BY species;



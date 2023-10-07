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

/* Quesries usign JOIN */
SELECT name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE O.full_name = 'Melody Pond';
SELECT A.name FROM animals A JOIN species S ON A.species_id = S.id WHERE S.name = 'Pokemon';
SELECT O.full_name, A.name FROM owners  O LEFT JOIN animals A ON A.owner_id = O.id;
SELECT S.name, COUNT(*) FROM animals A  JOIN species S ON A.species_id = S.id GROUP BY S.name; 
SELECT A.name FROM animals A JOIN owners O ON  A.owner_id = O.id JOIN species S ON A.species_id = S.id WHERE O.full_name = 'Jennifer Orwell' AND S.name= 'Digimon';
SELECT A.name FROM animals A JOIN owners O ON  A.owner_id = O.id WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;
SELECT O.full_name, COUNT(*) FROM owners O JOIN animals A ON A.owner_id = O.id GROUP BY O.full_name ORDER BY COUNT(*) DESC LIMIT 1;

/* Visits */
SELECT A.name FROM animals A JOIN visits V ON A.id = V.animals_id JOIN vets VI ON V.vet_id = VI.id WHERE VI.name = 'Vet William Tatcher' ORDER BY V.visit DESC LIMIT 1;
SELECT COUNT(DISTINCT V.animals_id) FROM visits V JOIN vets VETS ON V.vet_id = VETS.id WHERE VETS.name = 'Vet Stephanie Mendez';
SELECT VETS.name, CASE WHEN S.species_id = 1 THEN 'Pokemon' WHEN  S.species_id = 2 THEN 'Digimon' ELSE 'N/A' END FROM vets VETS LEFT JOIN specializations S ON VETS.id = S.vet_id ORDER BY VETS.name;
SELECT A.name FROM animals A JOIN visits V ON A.id = V.animals_id JOIN vets VETS ON V.vet_id = VETS.id WHERE VETS.name = 'Vet Stephanie Mendez' AND V.visit BETWEEN '01-04-2020' AND '30-08-2020';
SELECT A.name, COUNT(*) AS counter FROM animals A JOIN visits V ON A.id = V.animals_id GROUP BY A.name ORDER BY counter DESC LIMIT 1;
SELECT A.name, V.vet_id, V.visit, VET.name FROM visits V JOIN animals A ON A.id = V.animals_id JOIN vets VET ON V.vet_id = VET.id WHERE vet_id = '2' ORDER BY V.visit LIMIT 1;
SELECT A.name AS animal, A.date_of_birth, A.escape_attempts, A.neutered,  A.weight_kg, V.vet_id, V.visit, VET.name, VET.age, VET.date_of_graduation FROM visits V JOIN animals A ON A.id = V.animals_id JOIN vets VET ON V.vet_id = VET.id ORDER BY V.visit LIMIT 1;
SELECT  COUNT(*) FROM visits V JOIN animals a ON V.animals_id = A.id JOIN species S ON A.species_id = S.id JOIN vets VET ON V.vet_id = VET.id LEFT JOIN specializations SPE ON V.vet_id = SPE.vet_id AND S.id = SPE.species_id WHERE SPE.vet_id IS NULL ;
SELECT COUNT(*) as counter, S.name AS specialty_name   FROM visits V JOIN animals A ON A.id = V.animals_id JOIN species S ON S.id = A.species_id WHERE vet_id = '2' GROUP BY species_id, S.name ORDER BY counter DESC LIMIT 1 ;





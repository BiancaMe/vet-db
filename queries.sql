/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth >= '01/01/2016' AND date_of_birth <= '31/12/2019';

SELECT name FROM animals WHERE neutered = 'TRUE' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Pikachu' OR name = 'Agumon';

SELECT name, escape_attempts FROM animals WHERE weight_kg >= 10.5;

SELECT * FROM animals WHERE neutered = 'TRUE';

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals  WHERE weight_kg >= 10.4 AND weight_kg <= 17.3 ;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '02-03-2020', 0, TRUE, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Gabumon', '15-11-2018', 2, TRUE, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Pikachu', '07-01-2021', 1, FALSE, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Devimon', '12-5-2020', 5, TRUE, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Charmander', '08-02-2020', 0, FALSE, -11), ( 'Plantmon', '15-11-2021', 2, TRUE, -5.7), ( 'Squirtle', '02-04-1993', 3, FALSE, -12.13), ( 'Angemon', '12-06-2005', 1, TRUE, -45), ( 'Boarmon', '07-06-2005', 7, TRUE, 20.4), ( 'Blossom', '13-10-1998', 3, TRUE, 17), ( 'Ditto', '14-05-2022',4 , TRUE, 22);

/* Add data owners */ 
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
/* Add data species */
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
/* Add data animals */
UPDATE animals SET species_id = CASE WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon') ELSE (SELECT id FROM species WHERE name = 'Pokemon' ) END;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon'; 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu'; 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon'; 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom' ; 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon' ; 



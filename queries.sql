SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016/01/01' AND date_of_birth <= '2019/31/12';
SELECT * FROM animals WHERE neutered is true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

SELECT A1.name, A1.owner_id FROM animals A1 WHERE A1.owner_id = 4;
--     name    | owner_id 
-- ------------+----------
--  Blossom    |        4
--  Charmander |        4
--  Squirtle   |        4

SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
--    name    |  name   
-- ------------+---------
--  Pikachu    | Pokemon
--  Blossom    | Pokemon
--  Charmander | Pokemon
--  Squirtle   | Pokemon
--  Ditto      | Pokemon
SELECT owners.full_name, animals.name FROM owners LEFT OUTER JOIN animals ON owners.id = animals.owner_id;
--     full_name    |    name    
-- -----------------+------------
--  Sam Smith       | Agumon
--  Jennifer Orwell | Gabumon
--  Jennifer Orwell | Pikachu
--  Bob             | Plantmon
--  Bob             | Devimon
--  Melody Pond     | Squirtle
--  Melody Pond     | Charmander
--  Melody Pond     | Blossom
--  Dean Winchester | Angemon
--  Dean Winchester | Boarmon
--  Jodie Whittaker | 
SELECT species.name, COUNT(animals.name) FROM animals RIGHT JOIN species ON animals.species_id = species.id GROUP BY species.name;
--   name   | count 
-- ---------+-------
--  Pokemon |     5
--  Digimon |     6
SELECT animals.name, species.name FROM animals INNER JOIN species ON animals.species_id=species.id WHERE animals.owner_id = 2 AND animals.species_id = 2;
--   name   |  name   
-- ---------+---------
--  Gabumon | Digimon
SELECT owners.full_name, animals.name, animals.escape_attempts FROM owners LEFT JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
--  full_name | name | escape_attempts 
-- -----------+------+-----------------
SELECT owners.full_name, COUNT(animals.name) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT DESC;
--     full_name    | count 
-- -----------------+-------
--  Melody Pond     |     3
--  Dean Winchester |     2
--  Bob             |     2
--  Jennifer Orwell |     2
--  Sam Smith       |     1

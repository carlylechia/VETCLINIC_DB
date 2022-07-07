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

SELECT animals.name, visits.visit_date FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = 1 ORDER BY visits.visit_date DESC LIMIT 1;
--    name   | visit_date 
-- ----------+------------
--  Blossom  | 2021-01-11
SELECT COUNT(DISTINCT animal_id) FROM visits WHERE vet_id = 3;
--  count 
-- -------
--      4
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON specializations.species_id = species.id;
      name       |  name   
------------------+---------
 William Tatcher  | Pokemon
 Stephanie Mendez | Digimon
 Stephanie Mendez | Pokemon
 Jack Harkness    | Digimon
 Maisy Smith      | 
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = 3 AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';
--   name   | visit_date 
-- ---------+------------
--  Agumon  | 2020-07-22
--  Blossom | 2020-05-24
SELECT animals.name, COUNT(visits.animal_id) FROM animals LEFT JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT DESC LIMIT 1;
--     name    | count 
-- ------------+-------
--  Boarmon    |     4
SELECT animals.name, visits.visit_date FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = 2 ORDER BY visits.visit_date ASC LIMIT 1;
--    name   | visit_date 
-- ----------+------------
--  Boarmon  | 2019-01-24
SELECT * FROM visits ORDER BY visit_date DESC LIMIT 1;
--  animal_id | vet_id | visit_date 
-- -----------+--------+------------
--          4 |      3 | 2021-05-04
SELECT vets.name, COUNT(vets.name) AS num_of_visits FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id JOIN visits ON vets.id = visits.vet_id WHERE specializations.species_id IS NULL GROUP BY vets.name ORDER BY COUNT(vets.name) DESC;

SELECT species.name AS expected_specialty FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(DISTINCT animals.name) DESC LIMIT 1;
--  expected_specialty 
-- --------------------
--  Digimon

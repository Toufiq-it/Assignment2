-- Table 1: Rangers
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

INSERT INTO rangers (name, region) VALUES
('Amina Das', 'North Valley'),
('Rohan Mehta', 'Eastern Hills'),
('Sarah Liu', 'River Edge'),
('David Kim', 'South Forest');


-- Table 2: Species
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Shadow Leopard', 'Panthera pardus', '1891-03-15', 'Vulnerable'),
('Great Indian Bustard', 'Ardeotis nigriceps', '1878-11-02', 'Critically Endangered'),
('Asian Elephant', 'Elephas maximus', '1758-06-01', 'Endangered'),
('Sloth Bear', 'Melursus ursinus', '1791-09-18', 'Vulnerable'),
('Indian Pangolin', 'Manis crassicaudata', '1822-04-09', 'Endangered');


-- Table 3: Sightings
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NOT NULL REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INTEGER NOT NULL REFERENCES species(species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150) NOT NULL,
    notes TEXT
);

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 3, '2025-05-12 07:15:00', 'Riverbend Clearing', 'Elephant herd crossing the river.'),
(2, 1, '2025-05-14 18:47:00', 'Rocky Ridge', 'Shadow Leopard seen briefly at dusk.'),
(3, 2, '2025-05-15 06:30:00', 'Open Grassland', 'One bustard spotted during morning patrol.'),
(4, 4, '2025-05-16 09:05:00', 'South Trail', 'Sloth bear moving through dense bushes.'),
(1, 5, '2025-05-17 21:20:00', 'Valley Entrance', 'Pangolin spotted near ranger station.');


SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;
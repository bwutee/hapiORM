-- Add test data

-- Companies
INSERT INTO company (id, name, city, country) VALUES (1, 'Eli Libby', 'Indianapolis', 'USA');
INSERT INTO company (id, name, city, country) VALUES (2, 'Johnsten & Johnsten', 'New Brunswick', 'USA');
INSERT INTO company (id, name, city, country) VALUES (3, 'Ancienta', 'Boston', 'USA');
INSERT INTO company (id, name, city, country) VALUES (4, 'Pfighter', 'New York', 'USA');
INSERT INTO company (id, name, city, country) VALUES (5, 'Prayer', 'Leverkusen', 'Germany');

-- Vaccines
INSERT INTO vaccine (id, company_id, name, release_date) VALUES (1, 1, 'Vaccuum', '2019-05-15');
INSERT INTO vaccine (id, company_id, name, release_date) VALUES (2, 1, 'Vacancy', '2020-12-20');
INSERT INTO vaccine (id, company_id, name, release_date) VALUES (3, 2, 'Vacation', '2019-07-22');
INSERT INTO vaccine (id, company_id, name, release_date) VALUES (4, 3, 'Vancantly', '1995-11-01');
INSERT INTO vaccine (id, company_id, name, release_date) VALUES (5, 3, 'Vacationland', '1999-02-14');
INSERT INTO vaccine (id, company_id, name, release_date) VALUES (6, 4, 'Vacinology', '2005-09-28');
INSERT INTO vaccine (id, company_id, name, release_date) VALUES (7, 5, 'Vacillate', '2007-07-17');
INSERT INTO vaccine (id, company_id, name, release_date) VALUES (8, 5, 'Vaccinator', '2020-03-13');

-- Patients
INSERT INTO patient (id, first_name, last_name, phone) VALUES (1, 'Adam', 'Zapel', '952-555-1212');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (2, 'Anna', 'Conda', '553-555-1213');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (3, 'Barb', 'Dwyer', '202-555-5632');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (4, 'Bill', 'Foldes', '693-555-5155');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (5, 'Iona', 'Ford', '369-555-6933');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (6, 'June', 'Bugg', '536-555-2969');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (7, 'Paige', 'Turner', '533-555-1969');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (8, 'Polly', 'Esther', '942-555-9931');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (9, 'Rick', 'Shaw', '739-555-6939');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (10, 'Sarah', 'Bellum', '993-555-1131');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (11, 'Stanley', 'Cupp', '393-555-1551');
INSERT INTO patient (id, first_name, last_name, phone) VALUES (12, 'Walter', 'Mellon', '912-555-3361');

-- Vaccinations
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (1, 1);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (2, 1);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (3, 2);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (4, 3);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (5, 6);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (6, 6);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (6, 7);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (6, 9);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (7, 12);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (7, 2);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (8, 10);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (3, 9);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (3, 4);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (8, 11);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (7, 5);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (8, 8);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (2, 8);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (1, 10);
INSERT INTO vaccination (vaccine_id, patient_id) VALUES (5, 11);

-- Update sequences to avoid collisions with existing PKs

SELECT setval('company_id_seq', 101, false);
SELECT setval('patient_id_seq', 101, false);
SELECT setval('vaccine_id_seq', 101, false);

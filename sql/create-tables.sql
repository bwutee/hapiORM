-- Create all tables.

CREATE TABLE company
(
    id      serial  NOT NULL
        CONSTRAINT company_pk
            PRIMARY KEY,
    name    varchar NOT NULL,
    city    varchar NOT NULL,
    country varchar NOT NULL
);

COMMENT ON TABLE company IS 'Pharma Company';

CREATE TABLE vaccine
(
    id           serial  NOT NULL
        CONSTRAINT vaccine_pk
            PRIMARY KEY,
    company_id   integer NOT NULL
        CONSTRAINT vaccine_company_id_fk
            REFERENCES company,
    name         varchar NOT NULL,
    release_date date    NOT NULL
);

CREATE TABLE patient
(
    id         serial  NOT NULL
        CONSTRAINT patient_pk
            PRIMARY KEY,
    first_name varchar NOT NULL,
    last_name  varchar NOT NULL,
    phone      varchar NOT NULL
);

CREATE TABLE vaccination
(
    vaccine_id integer NOT NULL
        CONSTRAINT vaccination_vaccine_id_fk
            REFERENCES vaccine,
    patient_id integer NOT NULL
        CONSTRAINT vaccination_patient_id_fk
            REFERENCES patient,
    CONSTRAINT vaccination_pk
        PRIMARY KEY (vaccine_id, patient_id)
);

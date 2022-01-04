CREATE TABLE Doctor(
    d_id VARCHAR(5),
    d_name VARCHAR(50),
    d_phone VARCHAR(12)
);

ALTER TABLE Doctor ADD PRIMARY KEY (d_id);

CREATE TABLE Patient(
    p_id VARCHAR(5),
    p_name VARCHAR(50),
    diagnosis VARCHAR(100),
    age SMALLINT
);

ALTER TABLE Patient ADD PRIMARY KEY(p_id);


CREATE TABLE Medicine(
    med_id VARCHAR(5),
    med_name VARCHAR(50)
);

ALTER TABLE Medicine ADD PRIMARY KEY (med_id);


CREATE TABLE Bed(
    B_id VARCHAR(5),
    ward_no SMALLINT
);

ALTER TABLE Bed ADD PRIMARY KEY (B_id);


CREATE TABLE Prescription(
    p_id VARCHAR(5),
    d_id VARCHAR(5),
    med_id VARCHAR(5)
);

ALTER TABLE Prescription ADD PRIMARY KEY (p_id);
ALTER TABLE Prescription ALTER COLUMN d_id SET NOT NULL;
ALTER TABLE Prescription ADD FOREIGN KEY (p_id) REFERENCES Patient (p_id);
ALTER TABLE Prescription ADD FOREIGN KEY (d_id) REFERENCES Doctor (d_id);
ALTER TABLE Prescription ADD FOREIGN KEY (med_id) REFERENCES Medicine (med_id);


CREATE TABLE Bed_Patient(
    p_id VARCHAR(5),
    B_id VARCHAR(5),
    in_date date,
    out_date date
);

ALTER TABLE Bed_Patient ADD PRIMARY KEY (p_id);
ALTER TABLE Bed_Patient ALTER COLUMN B_id SET NOT NULL;
ALTER TABLE Bed_Patient ADD FOREIGN KEY (p_id) REFERENCES Patient (p_id);
ALTER TABLE Bed_Patient ADD FOREIGN KEY (B_id) REFERENCES Bed (B_id);


INSERT INTO Doctor (d_id, d_name, d_phone) VALUES ('20050', 'Deeanne Hakonsen', '685-921-7455');
INSERT INTO Doctor (d_id, d_name, d_phone) VALUES ('37436', 'Lucita Vairow', '412-269-6919');
INSERT INTO Doctor (d_id, d_name, d_phone) VALUES ('8', 'Darla Frossell', '946-679-8495');
INSERT INTO Doctor (d_id, d_name, d_phone) VALUES ('847', 'Billie Sliney', '951-783-4989');
INSERT INTO Doctor (d_id, d_name, d_phone) VALUES ('35', 'Harris Lowres', '421-270-8105');

INSERT INTO Patient (p_id, p_name, diagnosis, age) VALUES ('2075', 'Morgen Tsarovic', 'Astragalus crassicarpus Nutt. var. cavus Barneby', 35);
INSERT INTO Patient (p_id, p_name, diagnosis, age) VALUES ('179', 'Dmitri Wherrit', 'Eichhornia azurea (Sw.) Kunth', 28);
INSERT INTO Patient (p_id, p_name, diagnosis, age) VALUES ('079', 'Baryram Langmaid', 'Aspicilia polychroma (Anzi) Nyl.', 42);
INSERT INTO Patient (p_id, p_name, diagnosis, age) VALUES ('108', 'Christina Carbine', 'Mitella ×intermedia Bruhin ex Small & Rydb. (pro sp.)', 16);
INSERT INTO Patient (p_id, p_name, diagnosis, age) VALUES ('253', 'Dean Dumbelton', 'Ribes menziesii Pursh var. leptosmum (Coville) Jeps.', 20);

INSERT INTO Medicine (med_id, med_name) VALUES ('3335', 'ED A-HIST');
INSERT INTO Medicine (med_id, med_name) VALUES ('0331', 'TRAMADOL HYDROCHLORIDE');
INSERT INTO Medicine (med_id, med_name) VALUES ('58', 'YES TO TOMATOES ROLLER BALL SPOT STICK');
INSERT INTO Medicine (med_id, med_name) VALUES ('5364', 'ThyroShield');
INSERT INTO Medicine (med_id, med_name) VALUES ('72', 'sotalol hydrochloride');

INSERT INTO Bed (B_id, ward_no) VALUES ('9299', 184);
INSERT INTO Bed (B_id, ward_no) VALUES ('87113', 917);
INSERT INTO Bed (B_id, ward_no) VALUES ('28019', 886);
INSERT INTO Bed (B_id, ward_no) VALUES ('19852', 374);
INSERT INTO Bed (B_id, ward_no) VALUES ('5882', 53);

INSERT INTO Prescription (p_id, d_id, med_id) VALUES ('2075', '20050', '3335');
INSERT INTO Prescription (p_id, d_id, med_id) VALUES ('179', '37436', '3335');
INSERT INTO Prescription (p_id, d_id, med_id) VALUES ('079', '37436', '58');
INSERT INTO Prescription (p_id, d_id, med_id) VALUES ('108', '37436', '72');
INSERT INTO Prescription (p_id, d_id, med_id) VALUES ('253', '8', '5364');

INSERT INTO Bed_Patient (p_id, B_id, in_date, out_date) VALUES ('2075', '9299', '2020-12-23', '2021-05-31');
INSERT INTO Bed_Patient (p_id, B_id, in_date, out_date) VALUES ('179', '87113', '2020-12-23', '2021-09-11');
INSERT INTO Bed_Patient (p_id, B_id, in_date, out_date) VALUES ('079', '28019', '2020-11-16', '2021-06-10');
INSERT INTO Bed_Patient (p_id, B_id, in_date, out_date) VALUES ('108', '19852', '2021-01-14', '2021-03-05');
INSERT INTO Bed_Patient (p_id, B_id, in_date, out_date) VALUES ('253', '5882', '2020-12-08', '2021-05-14');
Create database pharmacy1;

use pharmacy1;
CREATE TABLE tabletss(
tablet_id INT PRIMARY KEY,
tablet_name VARCHAR(100),
tablet_weight VARCHAR(100),
disease VARCHAR(100),
symptom VARCHAR(50));
INSERT INTO tabletss(tablet_id,tablet_name,tablet_weight,disease,symptom)
VALUES 
(01,'paracetamol','500mg','fever','High body temparature'),
(02,'Ibuprofen 400 mg','400 mg','Pain & Inflammation','Body pain, swelling'),
(03,'Cetirizine 10 mg','10 mg','Allergy','Sneezing,itching'),
(04,'Dolo 650','650 mg','Fever & Pain','Fever, headache'),
(05,'Azithromycin 500 mg','500 mg','Bacterial Infection','Sore throat, fever');

ALTER TABLE tabletss ADD Cost VARCHAR(100);
ALTER TABLE tabletss RENAME COLUMN Cost TO tcost;

UPDATE tabletss SET tcost="200" WHERE tablet_id="01";
ALTER TABLE tabletss DROP COLUMN tcost;
ALTER TABLE tabletss ADD age_group VARCHAR(50);

UPDATE tabletss SET age_group='Children' WHERE tablet_id='01';
UPDATE tabletss SET age_group='Adults' WHERE tablet_id='02';
UPDATE tabletss SET age_group='Adults' WHERE tablet_id='03';
UPDATE tabletss SET age_group='Adults' WHERE tablet_id='04';
UPDATE tabletss SET age_group='Adults' WHERE tablet_id='05';

SELECT symptom, COUNT(*) AS total_tablets
FROM tabletss
GROUP BY symptom;

SELECT age_group, COUNT(*) AS total_tablets
FROM tabletss
GROUP BY age_group
HAVING COUNT(*) > 1;

SELECT
MIN(tablet_weight) AS minimum_weight,
MAX(tablet_weight) AS maximum_weight
FROM tabletss;

SELECT
symptom,
GROUP_CONCAT(tablet_name) AS tablets,
COUNT(*) AS total_tablets
FROM tabletss
GROUP BY symptom;
select * from tabletss;
ALTER TABLE tabletss ADD qty INT;

UPDATE tabletss SET qty=15 WHERE tablet_id=01;
UPDATE tabletss SET qty=22 WHERE tablet_id=02;
UPDATE tabletss SET qty=18 WHERE tablet_id=03;
UPDATE tabletss SET qty=10 WHERE tablet_id=04;
UPDATE tabletss SET qty=39 WHERE tablet_id=05;

SELECT tablet_id,tablet_name,(tablet_weight*qty) AS total_weight,symptom FROM tabletss;

SELECT 
tablet_id,
tablet_name,
tablet_weight,
symptom
FROM tabletss
WHERE tablet_weight>=500 AND age_group="Adults";
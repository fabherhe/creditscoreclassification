-- Table creation, important step before import the csv
CREATE TABLE credit_score_classification (
    age INTEGER,
    gender VARCHAR(20),
    income DECIMAL,
    education VARCHAR(100),
    marital_status VARCHAR(50),
    number_of_children INTEGER,
    home_ownership VARCHAR(50),
    credit_score INTEGER
);

-- Checking if the table was created correctly 
\dt

-- Checking the table structure 
\d credit_score_classification

-- Correction data type 
ALTER TABLE credit_score_classification ALTER COLUMN credit_score TYPE text;

-- Copying the data from one csv file
\copy credit_score_classification FROM 'C:\Users\fhern\OneDrive\Documentos\SQL\assification\Credit Score Classification Dataset.csv' DELIMITER ',' CSV HEADER;

-- Checking first 10 rows
SELECT * FROM credit_score_classification LIMIT 10;

-- How many records we got
SELECT COUNT(*) AS total_registros
FROM credit_score_classification;

-- Average income 
SELECT AVG(income) as promedio_ingresos FROM credit_score_classification;

-- Records by gender 
SELECT gender, COUNT(*) AS Total
FROM credit_score_classification
GROUP BY gender;

-- Average income by gender
select gender, avg(income) as promedio_ingreso_gender
from credit_score_classification
group by gender;

-- Average income by number of children 
select number_of_children, AVG(income) as Income_per_children
FROM credit_score_classification
group by number_of_children;

-- Average income by age in ascending order
select age, avg(income) as income_by_age
FROM credit_score_classification
group by age
order by age asc; 

-- Average income by marital status
SELECT marital_status, AVG(Income) AS Promedio_Ingresos
FROM credit_score_classification
GROUP BY marital_status;

-- Average income by gender and marital status
SELECT gender, marital_status, AVG(income) AS income_by_gender_and_marital_status
FROM credit_score_classification
GROUP BY gender, marital_status
ORDER BY income_by_gender_and_marital_status;

-- Average income by educational level 
select education, avg(income) as income_by_education
from credit_score_classification
group by education;

-- Average income by gender and educational level 
SELECT gender, education, AVG(income) AS gender_edu_income
FROM credit_score_classification
GROUP BY gender, education
ORDER BY gender_edu_income ASC;

-- How many people are per educational level
SELECT gender, education, COUNT(*) AS count_of_people
FROM credit_score_classification
GROUP BY gender, education
ORDER BY count_of_people;



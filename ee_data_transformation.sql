SELECT *
FROM EmploymentEquityDB.dbo.ee_meta;

SELECT *
FROM EmploymentEquityDB.dbo.ee_profile_all

/*
  Project: 71point4 Junior Data Analyst Assessment - Employment Equity Analysis
  Author: Teboho Hamilton Tladi
  Database: SQL Server (TEE\SQLEXPRESS)
  
  Approach:
  1. Preserves raw source integrity: ee_meta.csv and ee_profile_all.csv are imported without altering source values.
  2. Uses CROSS APPLY (VALUES ...) to unpivot wide annual metadata columns (2013–2024) from ee_meta into a normalized longitudinal structure.
  3. Joins unpivoted metadata to ee_profile_all on [ee_ref] and [submission_year] to create [ee_combined_master] for Power BI reporting.
*/

USE EmploymentEquityDB;
GO

SELECT 
    p.submission_year,
    p.ee_ref,
    m.dti_registration_name,
    m.industry_sector,
    m.seta_classification,
    m.business_type,
    m.province_physical,
    m.city_town_physical,
    p.occupation_level,
    p.African_Female, p.AFRICAN_male,
    p.coloured_female, p.coloured_MALE,
    p.Indian_FEMALE, p.indian_male,
    p.white_female, p.white_male,
    p.foreign_female, p.foriegn_male
INTO dbo.ee_combined_master
FROM EmploymentEquityDB.dbo.ee_profile_all AS p
INNER JOIN (
    SELECT ee_ref, submission_year, dti_registration_name, industry_sector, seta_classification, business_type, province_physical, city_town_physical
    FROM EmploymentEquityDB.dbo.ee_meta
    CROSS APPLY (
        VALUES 
            (2013, dti_registration_name_2013, industry_sector_2013, seta_classification_2013, business_type_2013, province_physical_2013, city_town_physical_2013),
            (2014, dti_registration_name_2014, industry_sector_2014, seta_classification_2014, business_type_2014, province_physical_2014, city_town_physical_2014),
            (2015, dti_registration_name_2015, industry_sector_2015, seta_classification_2015, business_type_2015, province_physical_2015, city_town_physical_2015),
            (2016, dti_registration_name_2016, industry_sector_2016, seta_classification_2016, business_type_2016, province_physical_2016, city_town_physical_2016),
            (2017, dti_registration_name_2017, industry_sector_2017, seta_classification_2017, business_type_2017, province_physical_2017, city_town_physical_2017),
            (2018, dti_registration_name_2018, industry_sector_2018, seta_classification_2018, business_type_2018, province_physical_2018, city_town_physical_2018),
            (2019, dti_registration_name_2019, industry_sector_2019, seta_classification_2019, business_type_2019, province_physical_2019, city_town_physical_2019),
            (2020, dti_registration_name_2020, industry_sector_2020, seta_classification_2020, business_type_2020, province_physical_2020, city_town_physical_2020),
            (2021, dti_registration_name_2021, industry_sector_2021, seta_classification_2021, business_type_2021, province_physical_2021, city_town_physical_2021),
            (2022, dti_registration_name_2022, industry_sector_2022, seta_classification_2022, business_type_2022, province_physical_2022, city_town_physical_2022),
            (2023, dti_registration_name_2023, industry_sector_2023, seta_classification_2023, business_type_2023, province_physical_2023, city_town_physical_2023),
            (2024, dti_registration_name_2024, industry_sector_2024, seta_classification_2024, business_type_2024, province_physical_2024, city_town_physical_2024)
    ) v(submission_year, dti_registration_name, industry_sector, seta_classification, business_type, province_physical, city_town_physical)
) AS m 
ON p.ee_ref = m.ee_ref AND p.submission_year = m.submission_year;

SELECT *
FROM dbo.ee_combined_master;
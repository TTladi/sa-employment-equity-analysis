## Project Overview
A data analysis and modelling project looking at 12 years (2013 to 2024) of South African Employment Equity (EEA2) submissions across industry sectors.

### Data Preparation and SQL Modelling
- **Source Consolidation:** Joined raw employer details ('ee_meta') with workforce demographic counts ('ee_profile_all') into a single table (ee_combined_master).
- **Schema Normalization:** Used T-SQL 'CROSS APPLY (VALUES ...)' to unpivot wide annual reporting columns into over 42,000 structured multi-year records.
- **Data Integrity:** Kept raw source files and historical reporting labels (including split temporary employee categories) unchanged so the data stays easy to verify.

### Key Findings (Power BI Dashboard)
- **Overall Representation:** Historically Disadvantaged Individuals (HDI) make up 90.26% of the tracked workforce (around 2M Male and 2M Female).
- **Transformation Over Time (2013 to 2024):** Overall HDI representation rose from around 88.2% in 2013 to a high of roughly **93%** in 2022, holding above **92%** in 2024.
- **Management Level Gaps:** While African males and female employees hold large majorities in unskilled, temporary, and technical roles, their share drops sharply at Senior Management and Top Management levels.

### Repository Contents
- 'ee_data_transformation.sql' – SQL Server script for restructuring, joining, and checking the data.
- 'Employment_Equity_Dashboard_Teboho_Tladi.pbix' – Power BI report with DAX measures and 'Industry Sector' filtering
- 'Teboho_Tladi_EE_Analysis_Report.pdf' – Written report covering methods, data limits and recommendations.

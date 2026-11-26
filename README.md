# sa-employment-equity-analysis
Longitudinal SQL Server and Power BI analysis of South African Employment Equity data (2013–2024), normalizing multi-year employer metadata via CROSS APPLY to track workforce transformation and gender representation across management tiers.

## Project Overview
An end-to-end data analysis & modelling project examining 12 years (2013–2024) of South African Employment Equity (EEA2) submissions across industry sectors.

### Data Preparation & SQL Modelling
- **Source Consolidation:** Combined raw employer metadata (`ee_meta`) with workforce demographic counts (`ee_profile_all`) into a unified relational table (`ee_combined_master`).
- **Schema Normalization:** Used T-SQL `CROSS APPLY (VALUES ...)` to unpivot wide annual reporting columns into 42,000+ normalized longitudinal records.
- **Data Integrity:** Preserved raw source files and historical reporting labels (such as split temporary employee categories) without manual alteration to keep the data auditable.

### Key Findings (Power BI Dashboard)
- **Overall Representation:** Historically Disadvantaged Individuals (HDI) account for **90.26%** of the total tracked workforce (~2M Male, ~2M Female).
- **Transformation Velocity (2013–2024):** Overall HDI representation grew steadily from **~88.2%** in 2013 to a peak of **~93%** in 2022, stabilizing above **92%** in 2024.
- **Management Tier Bottlenecks:** While African males and female employees hold strong majorities in unskilled, temporary, and technical tiers, representation narrows sharply at Senior Management and Top Management levels.

### Repository Contents
- `ee_data_transformation.sql` – SQL Server script for schema normalization, joins, and validation.
- `Employment_Equity_Dashboard_Teboho_Tladi.pbix` – Interactive Power BI report with DAX measures and `Industry Sector` filtering.
- `Teboho_Tladi_EE_Analysis_Report.pdf` – Written report covering methodology, limitations, and recommendations.

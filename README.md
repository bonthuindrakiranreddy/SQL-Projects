# SQL-Projects

This repository demonstrates how SQL can be a powerful tool for data cleaning and exploratory data analysis (EDA). It showcases a complete workflow applied to a real-world dataset on global layoffs. The project highlights how SQL, coupled with visualization tools like Excel or BI platforms, can deliver actionable insights from raw data.

## Project Overview:
This project involves cleaning and analyzing a dataset on global layoffs. The goals were to enhance data integrity, address inconsistencies, and uncover meaningful patterns and trends. The insights will be visualized using external tools in future, completing the analytical pipeline.

## Key Features
## Data Cleaning:
- **Duplicate Removal:** Leveraged ROW_NUMBER() and partitioning to identify and eliminate redundant rows.
- **Standardization:** Unified text fields (e.g., merging variations of “Crypto”), corrected country names, and formatted dates.
- **Null Value Handling:** Replaced blanks with NULL, populated missing fields, and removed unusable rows.
- **Preserving Raw Data:** Operated on a staging table to ensure data integrity.

## Exploratory Data Analysis (EDA)
- **Aggregate Insights:** Analyzed layoffs by company, country, and year.
-  **Time-Series Analysis:** Identified monthly trends and calculated rolling totals.
-  **Ranking:** Ranked companies by total layoffs within each year.

## SQL Techniques Used
- Window functions (ROW_NUMBER(), DENSE_RANK)
- Common Table Expressions (CTEs)
- String functions (TRIM, SUBSTRING)
-- Date formatting and conversion (STR_TO_DATE, DATE)
-- Joins and aggregations

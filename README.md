# Walmart_Sales
Walmart Sales Analysis
## Project Overview

This project is an end-to-end data analysis solution developed to extract key business insights from Walmart sales data. I used Python for data processing and analysis, SQL for advanced querying, and structured analytical methods to solve business-driven questions. The project demonstrates practical skills in data cleaning, feature engineering, SQL analysis, and data pipeline creation.

# Project Steps
## 1. Environment Setup

Tools Used: Visual Studio Code (VS Code), Python, SQL (PostgreSQL)

I set up a structured workspace in VS Code and organized the project directories to ensure smooth development and efficient data handling.

## 2. Data Acquisition

Data Source: Kaggle – Walmart Sales Dataset

Downloaded the Walmart sales dataset using the Kaggle API and stored the data in the data/ directory for easy access and reference.

## 3. Installing Libraries and Loading Data

Installed the required Python libraries using:

pip install pandas numpy sqlalchemy psycopg2

Then loaded the dataset into a Pandas DataFrame for initial exploration and transformation.

## 4. Data Exploration

Performed exploratory data analysis to understand the dataset structure and identify potential issues.

Key methods used:

.info() to inspect data types

.describe() for statistical summaries

.head() to preview records

This helped in identifying inconsistencies, missing values, and data distribution patterns.

## 5. Data Cleaning

Performed multiple preprocessing steps to ensure data quality:

Removed duplicate records

Handled missing values by dropping or imputing where necessary

Corrected inconsistent data types (e.g., converting dates to datetime)

Cleaned currency formatting using .replace()

Validated the dataset after cleaning to ensure consistency

## 6. Feature Engineering

Created additional features to enhance analytical capabilities.

Example:

Calculated Total Amount per transaction

total_amount = unit_price * quantity

This new column simplified aggregation and SQL-based analysis.

## 7. Loading Data into Databases

Connected Python to PostgreSQL using SQLAlchemy and loaded the cleaned dataset into both databases.

Steps performed:

Established database connections

Automated table creation

Inserted cleaned data into tables

Verified successful data loading using SQL queries

## 8. SQL Analysis

Wrote and executed complex SQL queries to answer business questions such as:

Revenue trends across branches and product categories

Identification of best-selling categories

Sales performance by city, branch, and payment method

Peak sales hours and customer purchasing patterns

Profit margin comparison across branches

Each query was documented with its objective, logic, and findings.

## 9. Project Documentation and Publishing

Documented the entire workflow using Markdown and Jupyter Notebooks and published the project on GitHub including:

README documentation

SQL query scripts

Python notebooks

Project structure and instructions

Requirements

Python: 3.8+
Database: PostgreSQL

Python Libraries

pandas

numpy

sqlalchemy

psycopg2

Kaggle API key was used for dataset download.

Project Structure
|-- data/                     # Raw and processed datasets
|-- sql_queries/              # SQL scripts for analysis
|-- notebooks/                # Jupyter notebooks for Python analysis
|-- README.md                 # Project documentation
|-- requirements.txt          # Python dependencies
|-- main.py                   # Data loading, cleaning, and processing script
Results and Insights

Sales Insights

Identified top-performing product categories and branches

Determined the most commonly used payment methods

Profitability Analysis

Analyzed profit margins across branches and product categories

Customer Behavior

Evaluated customer ratings

Identified peak shopping hours and payment preferences

Future Enhancements

Possible extensions include:

Integration with Power BI or Tableau dashboards

Incorporation of additional datasets for deeper analysis

Automation of the data pipeline for scheduled data ingestion and analysis

License

This project is released under the MIT License.

Acknowledgments

Data Source: Kaggle – Walmart Sales Dataset
Inspiration: Walmart business case studies on sales and supply chain optimization

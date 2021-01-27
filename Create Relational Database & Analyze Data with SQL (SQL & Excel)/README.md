### Portfolio Project
# Create Relational Database & Analyze Data with SQL (SQL & Excel)
## Topic: FIFA WorldCup Performance Analysis (1930-2014)

The **purpose** of this project is to demonstrate my understanding of Database related knowledge and my competency in **SQL** coding and **MS Excel** data visualization.
The goal of this project is to exhibit five stages of the data lifecycle through the use of **SQL** and **MS Excel**. An insightful **dashboards** will be created as an end result.

Project scope:
1. Data Collection from various sources
2. Creating tables and loading data into SQL databases. 
3. Data Preparation on the raw data, perform data cleaning and transformation operations.
4. Data Analysis using SQL
5. Ceateing Interactive Dashboard and Visualization using excel Dashboards
6. Presenting the data with power point and dashboard

### 1. Data Collection
Data sources:
- [kaggle - FIFA World Cup-All the results from World Cups ](https://www.kaggle.com/abecklas/fifa-world-cup)<br>

This dataset consists of 3 CSV files: 
1. **WorldCups.csv**: 10 attributes 20 rows, showing all information about all the World Cups in the history including **Year**, **Host Country**, **Champion**, etc.
2. **WorldCupMatches.csv**: 20 attributes 852 rows, showing all the results from the matches contested as part of the cups including **Datetime**, **Stage**, **Team**, **Goal**, **Attendance**, **Referee** etc.
3. **WorldCupPlayers.csv**: 9 attributes 37,784 rows, showing all information about players correspond to the matches including **Coach Name**, **Position**, **Line-up**, etc.

### 2. SQL databases
I have designed the Entity-Relationship Diagram (ERD) and Relational Schema based on the collected data, which adhere to 3 most common levels of normalization to ensure data integrity. The tools are from [ERD Plus](https://erdplus.com/).


### 3. Data Preparation
Once I have the database schema, I prepare the data by cleaning, harmonising, transforming the data using using python and export each of the entity to csv format.  
I created SG Crime database using **SQL Server Management Studio (SSMS)**. 
Data imported into the database through flat file (.csv). 
I created constraint for some of attributes to ensure data integrity.

### 4. Data Analysing using SQL
This step is to discover the underying insights from the dataset by answering the following questions:
- Is there an increase in the overall crime rate over the years?
- What is teh most common type of crime?
- Is crime cases vary greatly by neighborhood?
- What is the offences that seeing increases in recent year?
- Who are more vulnerable to the crime of concern?

### 5. Interactive Dashboard using MS Excel
I created three interactive dashboard in Excel:
- Overall crime
- Five preventable crime, unlicensed money lending & harassment by Neighborhood Police Center (NPC)
- Person Arrested and Victims by Selected Major Offences

## Summary:
- Crime rate through remain low, but seeing increasing trend in two consecutive years 2018, and 2019.
- Most common types of crime is Commercial crimes.
- Total crime cases reported vary by NPC. 
- Increase in Outrage of Modesty cases trend remain a concern.
- Male is more vulnerable to Cheating related offences, but female is more impacted in Outrage of Modesty.


```python

```


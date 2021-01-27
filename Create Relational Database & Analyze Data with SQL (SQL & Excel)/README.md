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
After creating database schema, I have conducted initial data cleaning and transformation by using **Power Query** and export each of the entity into csv format.  
I have created FIFA WorldCup database in **SQL Server Management Studio (SSMS)**, then I have created tables based on schema in sequence. <br>
I loaded data into corresponding tables by using SQL statements. After that, I've carried out further data cleaning process in SQL before start of data analysis.

### 4. Data Analysing using SQL
In this project, I attempt to discover the underlying insights from this dataset to answer these questions:
- What are the Quick Facts about World Cup?
- What is the distribution of participant countries?
- How did Host Countries perform in each World Cup?
- Who are the Top Teams/Dart Horses?
- What are the most common Scores?
To answer the above questions, I've carried out a few major queries(please refer to 'SQL' folder for the detailed SQL script ) and figure out the answers accordingly. I've creat several **view** to store these answers in order to export them into MS Excel.

### 5. Interactive Dashboard using MS Excel
After importing data from **SQL Sever** into **MS Excel**, I've leveraged **Pivot Table** and **Slicer** to create Interactive Dashboard.
On the most left, I've also created 2 filters to filter out countries according to their Qualified times and Average position, which helps us to find out the Countries' Names before clicking on slicers for desired information.

This Interactive Dashboard contains these following information:
- Country Position in 1986-2014 (Sliced by Countries)
- Total number of Champion Countries/Qualified Countries/Host Countries, Total number of World Cups
- Geopraphic Distribution of Champion Countries/Qualified Countries
- Distribution of Champion Countries
- Host Countries Historical Position (Sliced by Year), Host Countries Average Position
- Score Distribution (Sliced by Year & Stage)

## Summary:
Top Teams: 
- Brazil: 5 Champion, Stable high performance.
- Germany:4 Champion, Stable high performance.
- Italy: 4 Champion, performance falling downwards.
- Argentina: 2 Champion, performance uprising.
- France: 1 Champion, performance uprising.

Rank 16 for Continuous 6 World-Cup: 
- Mexico

Dark Horses:
- Turkey, ranked in 3rd place
- Ukraine, ranked in 8th place
- Senegal, ranked in 8th place

Most Common Score:
- 0-1
- 0-2




```python

```


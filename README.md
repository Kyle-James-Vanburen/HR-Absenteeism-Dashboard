# Employee Absenteeism Analysis Dashboard 
 
Welcome to the Employee Absenteeism Analysis Dashboard. This project aims to provide in-depth analysis of employee absenteeism data to assist HR in making informed decisions. By leveraging Excel, MySQL, and Power BI, we've transformed raw data into actionable insights. Below, you'll find all the information you need to access and understand this analysis.

## Requirements
To interact with this dashboard, ensure you have the following tools installed:

• Microsoft Excel (for accessing CSV files): 
Free web version link for Excel: https://www.office.com/launch/excel?ui=en-US&rs=US&auth=2                                                                                                                               

The Excel CSV files served as the source data for importing information into MySQL, enabling the creation of database columns through the import wizard. You can access these files using the following link: 
https://drive.google.com/drive/folders/1LFCXsc0qZPS3NklzIXpFrrMCogETlMPu?usp=sharing



• Power BI Desktop (for advanced data visualization): 
Web version link for Power BI, however you will be asked to make a Power BI account: https://app.powerbi.com/groups/me/reports/e805d794-f3c2-4ebf-8da2-94cd04f809a2/ReportSection?experience=power-bi

## Data Sources
We utilized three Excel CSV files to construct our database:

• Compensations Data: Employee compensations associated with specific ID numbers.

• Distinct Reasons for Absence: Unique reasons for absence.

• Descriptive Employee Information: Employee details, dates, and absence counts.

## Analysis Details

### Situation

HR required a detailed analysis of absence hours for working employees. Data provided included compensations, distinct absence reasons, and descriptive employee information.

### Task

Analyze the impact of age, education, children, BMI, and seasons on absence hours. Investigate absence reasons and transportation expenses for comparisons.

### Actions Taken

• Utilized MySQL's import data wizard and SQL queries to transform data from Excel sheets.

• Applied DAX (Data Analysis Expressions) functions using Power Query Editor to organize the data.

• Implemented slicer filters for precise data viewing based on seasons.

• Created visualizations including donut charts, line charts, scatter charts, and matrix tables.

### Results

• Identified Winter and July as peak season and month for absenteeism.

• Medical consultations led in absence reasons, and $179 transportation expenses correlated with higher absenteeism.

• July had the highest average absenteeism time (10.96 hours), 168.29% more than February (4.08 hours).

## SQL Queries Overview

1. Create a Join Table

       SELECT * FROM work.absenteeism_at_work AS aaw
       LEFT JOIN work.compensation AS comp ON aaw.ID = comp.ID
       LEFT JOIN work.reasons AS r ON aaw.`Reason for absence` = r.Number;

2. Find Healthy Employees for a Bonus

       SELECT * FROM work.absenteeism_at_work
       WHERE 'Social drinker' = 0 AND 'Social smoker' = 0
       AND 'Body mass index' < 25
       AND 'Absenteeism time in hours' < (SELECT AVG('Absenteeism time in hours') FROM work.absenteeism_at_work);

3. Compensation Rate Increase for Non-Smokers

       SELECT COUNT(*) AS nonsmokers FROM work.absenteeism_at_work WHERE 'Social smoker' = 0;

4. Optimized Query

       SELECT
   
           aaw.ID,
           r.Reason,
           `Month of absence`,
           `Body mass index`,

       CASE
   
           WHEN `Body mass index` < 18.5 THEN 'Underweight'
           WHEN `Body mass index` BETWEEN 18.5 AND 24.9 THEN 'Healthy'
           WHEN `Body mass index` BETWEEN 25 AND 30 THEN 'Overweight'
           WHEN `Body mass index` > 30 THEN 'Obese'
           ELSE 'Unknown'
           END AS `BMI category`,

       CASE
   
           WHEN `Month of absence` IN (12, 1, 2) THEN 'Winter'
           WHEN `Month of absence` IN (3, 4, 5) THEN 'Spring'
           WHEN `Month of absence` IN (6, 7, 8) THEN 'Summer'
           WHEN `Month of absence` IN (9, 10, 11) THEN 'Fall'
           ELSE 'Unknown'

       END AS
   
       `Season name`,
       `Month of absence`,
       `Day of the week`,
       `Transportation expense`,
       `Education`,
       `Son`,
       `Social drinker`,
       `Social smoker`,
       `Pet`,
       `Disciplinary failure`,
       `Age`,
       `Work load Average/day`,
       `Absenteeism time in hours`
  
       FROM
   
          work.absenteeism_at_work AS aaw
          LEFT JOIN work.compensation AS comp ON aaw.ID = comp.ID
          LEFT JOIN work.reasons AS r ON aaw.`Reason for absence` = r.Number;

### Contact ###

For questions or further assistance, please contact the project maintainer:
Email: vanburen.kyle@yahoo.com

Feel free to explore the data and gain valuable insights into employee absenteeism patterns. Thank you for your interest in my analysis dashboard!

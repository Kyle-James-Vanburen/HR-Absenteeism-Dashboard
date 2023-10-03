# HR-Absenteeism-Dashboard
You will need to use Excel to access the CSV files, heres a link for the free web version of Excel: https://www.office.com/launch/excel?ui=en-US&rs=US&auth=2

Excel CSV files that were used to transport data into MySQL to create my database columns via import wizard. Link is bellow: 
https://drive.google.com/drive/folders/1LFCXsc0qZPS3NklzIXpFrrMCogETlMPu?usp=sharing

You will also need to install a free desktop version of Power BI

Heres a weblink if you dont want to install Power BI, however you will be asked to make a Power BI account: https://app.powerbi.com/groups/me/reports/e805d794-f3c2-4ebf-8da2-94cd04f809a2/ReportSection?experience=power-bi

# S.T.A.R

SITUATION - HR needs their absence hours to be more analyzed for working employees. HR has provided me with three Excel CSV data sheets. One sheet with compensations data for each employee associated with a specific ID number. A second sheet with distinct(no duplicates)reasons for absence. And a third sheet with descriptive employee infromation with dates and count of each employees absence.

TASK - I need to know does age, education, children, and BMI have an impact in absence hours? I will also check and see if any of the four season contribute to absence hours. And last, I will analyze the reasons of absence and expense of transportation for comparisons.

ACTION - 

MySQL query explanation: This SQL script analyzes employee absenteeism data from the "absenteeism_at_work" table to perform various operations, including data joining, employee bonus calculation, and optimization of the initial query.

### 1. Create a Join Table

-- Create a join table

SELECT * FROM work.absenteeism_at_work AS aaw

LEFT JOIN work.compensation AS comp ON aaw.ID = comp.ID

LEFT JOIN work.reasons AS r ON aaw.`Reason for absence = r.Number;

This query creates a join table by combining data from the "absenteeism_at_work," "compensation," and "reasons" tables based on matching IDs and reasons for absence.

### 2. Find the Most Healthy Employees for a Bonus

-- Find the most healthy employees for a bonus

SELECT * FROM work.absenteeism_at_work

WHERE 'Social drinker' = 0 AND 'Social smoker' = 0

AND 'Body mass index' < 25

AND 'Absenteeism time in hours' < (SELECT AVG('Absenteeism time in hours') FROM work.absenteeism_at_work);

This query identifies employees eligible for a bonus based on specific health criteria, including not being a social drinker, not being a social smoker, having a body mass index (BMI) below 25, and having absenteeism hours below the average.

### 3. Compensation Rate Increase for Non-Smokers

-- Compensation rate increase for non-smokers / BUDGET $983,221

-- A .68 cent increase per hour / $1,414.4 increase per year

SELECT COUNT(*) AS nonsmokers FROM work.absenteeism_at_work WHERE 'Social smoker' = 0;

This query calculates the number of non-smoking employees and proposes a compensation rate increase for them, along with an estimated budget impact.

### 4. Optimized Query

-- Optimize starting query "get rid of wildcard"

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
    
    END AS `Season name`,
    
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

  This optimized query retrieves essential employee absenteeism data, categorizes BMI and season, and joins relevant tables while eliminating unnecessary wildcards.
    
    
CONTACT: If you have any questions or need further assistance, please feel free to contact the project maintainer at vanburen.kyle@yahoo.com.



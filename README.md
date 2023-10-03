# Employee Absenteeism Analysis Dashboard

Welcome to the Employee Absenteeism Analysis Dashboard. This project aims to provide in-depth analysis of employee absenteeism data to assist HR in making informed decisions. By leveraging Excel, MySQL, and Power BI, we've transformed raw data into actionable insights. Below, you'll find all the information you need to access and understand this analysis.

##Requirements
To interact with this dashboard, ensure you have the following tools installed:

•Microsoft Excel (for accessing CSV files): 
Free web version link for Excel: https://www.office.com/launch/excel?ui=en-US&rs=US&auth=2                                                                                                                               

The Excel CSV files served as the source data for importing information into MySQL, enabling the creation of database columns through the import wizard. You can access these files using the following link: 
https://drive.google.com/drive/folders/1LFCXsc0qZPS3NklzIXpFrrMCogETlMPu?usp=sharing



•Power BI Desktop (for advanced data visualization): 
Web version link for Power BI, however you will be asked to make a Power BI account: https://app.powerbi.com/groups/me/reports/e805d794-f3c2-4ebf-8da2-94cd04f809a2/ReportSection?experience=power-bi

##Data Sources
We utilized three Excel CSV files to construct our database:

Compensations Data: Employee compensations associated with specific ID numbers.
Distinct Reasons for Absence: Unique reasons for absence.
Descriptive Employee Information: Employee details, dates, and absence counts.

##Analysis Details
Situation
HR required a detailed analysis of absence hours for working employees. Data provided included compensations, distinct absence reasons, and descriptive employee information.

Task
Analyze the impact of age, education, children, BMI, and seasons on absence hours. Investigate absence reasons and transportation expenses for comparisons.

Actions Taken
Utilized MySQL's import data wizard and SQL queries to transform data from Excel sheets.
Applied DAX (Data Analysis Expressions) functions using Power Query Editor to organize the data.
Implemented slicer filters for precise data viewing based on seasons.
Created visualizations including donut charts, line charts, scatter charts, and matrix tables.
Results
Identified Winter and July as peak seasons for absenteeism.
Medical consultations led in absence reasons, and $179 transportation expenses correlated with higher absenteeism.
July had the highest average absenteeism time (10.96 hours), 168.29% more than February (4.08 hours).

-- create a join table 
select * from work.absenteeism_at_work AS aaw
left join work.compensation AS comp
ON aaw.ID = comp.ID

left join work.reasons AS r
ON aaw.`Reason for absence` = r.Number;

-- find the most healthy employees for a bonus
select * from work.absenteeism_at_work
where `Social drinker` = 0 and `Social smoker` = 0
and `Body mass index` < 25 and 
`Absenteeism time in hours` < (SELECT AVG(`Absenteeism time in hours`) from work.absenteeism_at_work);

-- compensation rate increase for non-smokers / BUDGET $983,221
-- A .68 cent increase per hour / $1,414.4 increase per year
select count(*) as nonsmokers from work.absenteeism_at_work 
where `Social smoker` = 0;

-- optimize starting query "get rid of wildcard" 
select aaw.ID, r.Reason, `Month of absence`, `Body mass index`,
case when `Body mass index` < 18.5 then 'Underweight'
	 when `Body mass index` between 18.5 and 24.9 then 'Healthy'
     when `Body mass index` between 25 and 30 then 'Overweight'
     when `Body mass index` > 30 then 'Obese'
     else 'Unkown' END as `BMI category`,
case when `Month of absence` in (12, 1, 2) then 'Winter'
	 when `Month of absence` in (3, 4, 5) then 'Spring'
     when `Month of absence` in (6, 7, 8) then 'Summer'
     when `Month of absence` in (9, 10, 11) then 'Fall'
     else 'Unknown' END as `Season name`,
     
`Month of absence`, `Day of the week`, `Transportation expense`, `Education`, `Son`, 
`Social drinker`, `Social smoker`, `Pet`, `Disciplinary failure`, `Age`, 
`Work load Average/day`, `Absenteeism time in hours`
from work.absenteeism_at_work AS aaw
left join work.compensation AS comp
ON aaw.ID = comp.ID

left join work.reasons AS r
ON aaw.`Reason for absence` = r.Number;
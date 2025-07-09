Select*
from HREmployee

--Find employees who have been with the company for more than 5 years.

select EmployeeNumber , yearsatcompany
from HREmployee
where YearsAtCompany > 5
order by YearsAtCompany asc

--Find the average years of experience (TotalWorkingYears) for each Job Role

Select JobRole ,avg(Totalworkingyears) as average
from HREmployee
group by JobRole

--Compare attrition rate by department

select Department, count(*) as totalemplyee, sum(case when Attrition = 'yes' then 1 else 0 end) as Emplyeeleft,
Round(CONVERT(float, sum(case when Attrition = 'yes' then 1 else 0 end) )/ count(*) * 100, 2 )as PercentageOfAttrition
from HREmployee
group by Department
order by PercentageOfAttrition desc

--Find job roles with the highest average income

select*
from HREmployee

select jobrole,cast(avg(monthlyincome) as decimal(10,2)) as AverageMonthlyIncome
from HREmployee
group by JobRole 
order by AverageMonthlyIncome desc
--Round(Convert(int,avg(monthlyincome)),4)


--List employees nearing retirement (e.g., age > 60)

select *
from HREmployee

select Employeenumber,age, case when age > 55 then 'retire soon' else 'Active' end as RetirementStatus
from HREmployee


SELECT EmployeeNumber, Age
FROM HREmployee
WHERE Age > 55;


--Calculate average income by gender and education level

select gender,education,cast(avg(MonthlyIncome)as decimal(10,2)) as averageincome
from HREmployee
group by Gender,Education
order by Education

-- Identify the top 5 job roles with the highest attrition

select*
from HREmployee

select Top 5 jobrole,  sum(case when Attrition = 'yes' then 1 else 0 end) as peopleleft
from HREmployee
group by JobRole
order by peopleleft desc

--Compare average years at company by marital status

select *
from HR..HREmployee

select maritalstatus ,cast(avg(yearsatcompany) as decimal(10,2)) as Averagyears
from HR..HREmployee
group by MaritalStatus
order by Averagyears

--Find employees who got a promotion in the last 3 years

SELECT 
    EmployeeNumber, 
    YearsSinceLastPromotion
FROM HR..HREmployee
WHERE YearsSinceLastPromotion <= 3
ORDER BY YearsSinceLastPromotion ASC;

--Analyze attrition rate by education field

select EducationField, COUNT (*) as emplyeecount, sum(case when Attrition = 'yes' then 1 else 0 end) PeopleLeft ,
Round(CONVERT(float, sum(case when Attrition = 'yes' then 1 else 0 end) )/ count(*) * 100, 2 )as PercentageOfAttritionByField
from HR..HREmployee
group by EducationField
order by PercentageOfAttritionByField desc

--Find the average years at the company by gender and job role

select gender,jobrole,CONVERT(DECIMAL(10, 2), AVG(YearsAtCompany)) AS AverageYears
from HR..HREmployee
group by Gender,JobRole
order by averageyears

--Identify employees who work overtime and also have high job satisfaction

select EmployeeNumber,JobSatisfaction ,OverTime
from HR..HREmployee 
where JobSatisfaction > 3
and overtime = 'Yes'
--case when OverTime = 'yes' then 1 else 0 end as PeopleWhoOvertime

--Compare Attrition rates by Gender and Marital Status

select gender,maritalstatus,sum(case when Attrition = 'yes' then 1 else 0 end) as Peopleleft,count(*) as employeecount,
ROUND(CONVERT(float,sum(case when Attrition = 'yes' then 1 else 0 end))/COUNT(*)*100,2) as AVG
from HR..HREmployee
group by Gender,MaritalStatus
order by AVG desc

--Analyze Relationship Between Distance From Home and Attrition

select *
from HR..HREmployee

Select case 
when DistanceFromHome between 0 and 5 then '0-5' 
when DistanceFromHome between 6 and 10 then '6-10'
when DistanceFromHome between 11 and 15 then '11-15'
when DistanceFromHome between 16 and 20 then '16-20'
else '21+' end as Distancetohome,
count(*) as  EmployeeCount,
sum(case when Attrition = 'yes' then 1 else 0 end) as Peopleleft,
ROUND(CONVERT(float,sum(case when Attrition = 'yes' then 1 else 0 end)/COUNT(*)*100),2) as AttirionPerDistance
from HR..HREmployee
group by case
when DistanceFromHome between 0 and 5 then '0-5' 
when DistanceFromHome between 6 and 10 then '6-10'
when DistanceFromHome between 11 and 15 then '11-15'
when DistanceFromHome between 16 and 20 then '16-20'
else '21+' end
order by Distancetohome

SELECT 
  CASE 
    WHEN DistanceFromHome BETWEEN 0 AND 5 THEN '0-5' 
    WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10'
    WHEN DistanceFromHome BETWEEN 11 AND 15 THEN '11-15'
    WHEN DistanceFromHome BETWEEN 16 AND 20 THEN '16-20'
    ELSE '21+' 
  END AS DistanceToHome,
  COUNT(*) AS EmployeeCount,
  SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END) AS PeopleLeft,
  ROUND(
    CAST(SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END) AS FLOAT) 
    / COUNT(*) * 100, 
    2
  ) AS AttritionPerDistance

FROM HR..HREmployee

GROUP BY 
  CASE 
    WHEN DistanceFromHome BETWEEN 0 AND 5 THEN '0-5' 
    WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10'
    WHEN DistanceFromHome BETWEEN 11 AND 15 THEN '11-15'
    WHEN DistanceFromHome BETWEEN 16 AND 20 THEN '16-20'
    ELSE '21+' 
  END

ORDER BY DistanceToHome;

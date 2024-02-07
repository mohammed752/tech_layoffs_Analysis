create schema layOffs;
use layOffs;

#1. Retrieve information about all companies:
Select * from tech_layoffs;

#2. Count the number of layoffs for each country:
Select Country, count(*) as Count from tech_layoffs
group by Country
order by Count desc;

#3. Find the average percentage change in company size after layoffs:
select Company, avg(Company_Size_after_layoffs)
FROM tech_layoffs
group by Company;

#4. Identify companies with the highest money raised:
SELECT Company, Money_Raised_in_$_mil
FROM tech_layoffs
ORDER BY Money_Raised_in_$_mil desc;

#5. Count the number of layoffs by industry:
Select industry, count(laid_off) as Count from tech_layoffs
group by industry
order by Count desc;

Select industry, sum(laid_off) as Sum from tech_layoffs
group by industry
order by Sum desc
limit 10;

#6. Sum the number of layoffs by Company:
Select Company, sum(laid_off) as sums from tech_layoffs
group by Company
order by sums desc
limit 10;

Select Company, count(laid_off) as Count from tech_layoffs
group by Company
order by Count desc
limit 10;

#7. List companies with layoffs in a specific location:
SELECT Company, Location_HQ, Country, Percentage
FROM tech_layoffs
WHERE Location_HQ = 'San Francisco Bay Area';

#8. Find companies with layoffs before a specific date:
SELECT Company, Date_layoffs, Percentage
FROM tech_layoffs
WHERE Date_layoffs < '2023-11-01';

#9. SELECT Company, Continent, Percentage
SELECT Company, Continent, Percentage
FROM tech_layoffs
WHERE Continent = 'Asia' AND Percentage > 50;

#10 Retrieve information about companies with layoffs and their corresponding industry.
SELECT t.Company, t.Percentage, i.Industry
FROM tech_layoffs t
JOIN tech_layoffs i ON t.Company = i.Company;

#11. Find companies that raised more than the average amount of money.             
SELECT Company, Money_Raised_in_$_mil
FROM tech_layoffs
WHERE Money_Raised_in_$_mil > (SELECT AVG(Money_Raised_in_$_mil) FROM tech_layoffs);

#12. Rank companies based on the percentage of layoffs.
SELECT Company, Percentage, RANK() OVER (order by Percentage) AS Layoff_Rank
FROM tech_layoffs;

#13. Count the number of layoffs for each month.
SELECT DATE_FORMAT(Date_layoffs, '%Y-%m') AS Month, COUNT(*) AS Layoffs_Count
FROM tech_layoffs
GROUP BY Month;

#14. company's which made 100 percent layoff's
Select Company, Company_Size_after_layoffs
from tech_layoffs
where percentage = 100;

#15. which stage has more layoffs
select stage, sum(laid_off) as tots from tech_layoffs
group by stage
order by tots desc;
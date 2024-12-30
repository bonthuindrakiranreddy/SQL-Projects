-- Exploratory Data Analysis --

SELECT * FROM layoffs_staging2;

SELECT MAX(total_laid_off) FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off) FROM layoffs_staging2;

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1;

SELECT company, SUM(total_laid_off)
from layoffs_staging2
GROUP BY company
Order by 2 DESC;


SELECT country, SUM(total_laid_off)
from layoffs_staging2
GROUP BY country
Order by 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
from layoffs_staging2
GROUP BY YEAR(`date`)
Order by 2 DESC;

SELECT company, SUM(percentage_laid_off)
from layoffs_staging2
GROUP BY company
Order by 2 DESC;

SELECT SUBSTRING(`date`, 6,2) AS `Month`, SUM(total_laid_off)
from layoffs_staging2
GROUP BY `Month`
Order by 2 DESC;

SELECT company, YEAR(`date`), SUM(total_laid_off)
from layoffs_staging2
GROUP BY company, YEAR(`date`)
Order by company ASC;

with company_year(company, years, total_laid_off) as
(
 SELECT company, YEAR(`date`), SUM(total_laid_off)
	from layoffs_staging2
	GROUP BY company, YEAR(`date`)
), Company_Year_Rank as 
(Select *, dense_rank() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
from company_year
Where years is not null
)
Select * from Company_Year_Rank
WHERE Ranking <=5;

-- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC;

-- now use it in a CTE so we can query off of it
WITH DATE_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;
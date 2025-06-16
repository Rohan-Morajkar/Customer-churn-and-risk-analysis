-- Q1. Monthly churn rate
SELECT tenure, 
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY tenure
ORDER BY tenure;

-- Q2. Top 5 customers with highest total charges
SELECT customerID, TotalCharges
FROM customer_churn
ORDER BY TotalCharges DESC
LIMIT 5;

-- Q3. Average monthly charges by contract type
SELECT Contract,
       ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customer_churn
GROUP BY Contract;

-- Q4. Churn rate by InternetService type
SELECT InternetService,
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY InternetService;

-- Q5. Churn count and rate by gender
SELECT gender,
       COUNT(*) AS total_customers,
       SUM(Churn = 'Yes') AS churned_customers,
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY gender;

-- Q6. Contract type with highest churn rate
SELECT Contract,
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC
LIMIT 1;

-- Q7. Impact of TechSupport on churn
SELECT TechSupport,
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY TechSupport;

-- Q8. Total revenue from retained customers
SELECT ROUND(SUM(TotalCharges), 2) AS total_revenue_retained
FROM customer_churn
WHERE Churn = 'No';

-- Q9. Tenure groups and churn count
SELECT 
  CASE 
    WHEN tenure <= 12 THEN '0-12 months'
    WHEN tenure <= 24 THEN '13-24 months'
    WHEN tenure <= 48 THEN '25-48 months'
    ELSE '49+ months'
  END AS tenure_group,
  COUNT(*) AS total_customers,
  SUM(Churn = 'Yes') AS churned_customers
FROM customer_churn
GROUP BY tenure_group;

-- Q10. Average tickets raised by churn status
SELECT Churn,
       ROUND(AVG(numAdminTickets), 2) AS avg_admin_tickets,
       ROUND(AVG(numTechTickets), 2) AS avg_tech_tickets
FROM customer_churn
GROUP BY Churn;

-- Q11. Payment method preferences by churn status
SELECT PaymentMethod, 
       COUNT(*) AS total_customers,
       SUM(Churn = 'Yes') AS churned
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churned DESC;

-- Q12. Partner status and churn rate
SELECT Partner,
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY Partner;

-- Q13. Churn rate by SeniorCitizen status
SELECT SeniorCitizen,
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY SeniorCitizen;

-- Q14. Most common InternetService among churned customers
SELECT InternetService, COUNT(*) AS churned_count
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY churned_count DESC
LIMIT 1;

-- Q15. Churn rate by streaming services usage
SELECT StreamingTV, StreamingMovies,
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY StreamingTV, StreamingMovies;

-- Q16. Total charges outliers with short tenure
SELECT *
FROM customer_churn
WHERE tenure < 3 AND TotalCharges > 500
ORDER BY TotalCharges DESC;

-- Q17. Customers using all four services (TV, Movies, Backup, Security)
SELECT COUNT(*) AS all_services_users
FROM customer_churn
WHERE StreamingTV = 'Yes'
  AND StreamingMovies = 'Yes'
  AND OnlineBackup = 'Yes'
  AND OnlineSecurity = 'Yes';

-- Q18. Retention rate (opposite of churn rate)
SELECT 
  ROUND(SUM(Churn = 'No') / COUNT(*) * 100, 2) AS retention_rate
FROM customer_churn;

-- Q19. Churn rate for customers with multiple lines
SELECT MultipleLines,
       ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY MultipleLines;

-- Q20. Top 3 tenure values with highest churn count
SELECT tenure,
       SUM(Churn = 'Yes') AS churn_count
FROM customer_churn
GROUP BY tenure
ORDER BY churn_count DESC
LIMIT 3;

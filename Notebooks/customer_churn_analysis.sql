SELECT * FROM customer_data

/*Total Customers*/
SELECT COUNT(DISTINCT "Customer_ID") AS total_customers
FROM customer_data;
/*Total churned*/
SELECT COUNT(*) AS total_churn
FROM customer_data
WHERE "Customer_Status" = 'Churned';
/*Gender Analysis*/
SELECT 
    "Gender",
    COUNT("Gender") AS TotalCount,
    ROUND(
        COUNT("Gender") * 100.0 / (SELECT COUNT(*) FROM customer_data),
        2
    ) AS Percentage
FROM customer_data
GROUP BY "Gender";
/*contract analysis by percentage*/
SELECT 
    "Contract",
    COUNT("Contract") AS TotalCount,
    ROUND(
        COUNT("Contract") * 100.0 / (SELECT COUNT(*) FROM customer_data),
        2
    ) AS Percentage
FROM customer_data
GROUP BY "Contract";

/*Customer Status Revenue Analysis*/
SELECT 
    "Customer_Status",
    COUNT(*) AS TotalCount,
    SUM("Total_Revenue") AS TotalRev,
    ROUND(
        (
            SUM("Total_Revenue") * 100.0 /
            (SELECT SUM("Total_Revenue") FROM customer_data)
        )::numeric,
        2
    ) AS RevPercentage
FROM customer_data
GROUP BY "Customer_Status";

/*State-wise Customer Percentage*/
SELECT 
    "State",
    COUNT("State") AS TotalCount,
    ROUND(
        COUNT("State") * 100.0 /
        (SELECT COUNT(*) FROM customer_data),
        2
    ) AS Percentage
FROM customer_data
GROUP BY "State"
ORDER BY Percentage DESC;
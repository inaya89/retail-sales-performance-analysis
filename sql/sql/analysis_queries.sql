Q1: Profit margin by region and category
SELECT 
    region,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM sales
GROUP BY region, category
ORDER BY total_sales DESC;

Q2: Discount bracket impact on Central Furniture profit
SELECT 
    CASE 
        WHEN discount = 0 THEN '0%'
        WHEN discount > 0 AND discount <= 0.20 THEN '1-20%'
        WHEN discount > 0.20 AND discount <= 0.40 THEN '21-40%'
        ELSE '40%+'
    END AS discount_bracket,
    COUNT(*) AS num_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit), 2) AS avg_profit_per_order
FROM sales
WHERE region = 'Central' AND category = 'Furniture'
GROUP BY discount_bracket
ORDER BY discount_bracket;

-- Q3: Sales and profit by customer segment
SELECT 
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) AS num_orders
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;

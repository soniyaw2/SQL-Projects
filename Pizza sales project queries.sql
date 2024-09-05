-- Pizza Sales

-- Total Revenue
SELECT 
    SUM(total_price) AS total_revenue
FROM
    pizza_sales;

-- Total Revenue
SELECT 
    SUM(total_price) AS total_revenue
FROM
    pizza_sales;

-- Total Pizzas sold
SELECT 
    SUM(quantity) AS total_pizzas_sold
FROM
    pizza_sales;

-- Total orders
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales;

-- Avg pizzas per order
SELECT 
    SUM(quantity) / COUNT(DISTINCT order_id) AS avg_pizzas_per_order
FROM
    pizza_sales;


-- Daily Trend for total orders
SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales
GROUP BY DAYNAME(order_date);

-- Monthly trend for total orders
SELECT 
    MONTHNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY total_orders DESC;

-- Percentage of sales by pizza category
SELECT 
    pizza_category,
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales),
            2) AS perc_of_sales
FROM
    pizza_sales
GROUP BY pizza_category
ORDER BY perc_of_sales DESC;

-- Percentage of sales by pizza size
SELECT 
    pizza_size,
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales),
            2) AS perc_of_sales
FROM
    pizza_sales
GROUP BY pizza_size
ORDER BY perc_of_sales DESC;

-- Total pizzas sold by pizza category
SELECT 
    pizza_category, SUM(quantity) AS total_quantity
FROM
    pizza_sales
WHERE
    MONTH(order_date) = 1
GROUP BY pizza_category
ORDER BY total_quantity DESC;

-- Top 5 best sellers by Revenue
SELECT 
    pizza_name, SUM(total_price) AS total_revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Bottom 5 worst sellers by Revenue
SELECT 
    pizza_name, SUM(total_price) AS total_revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue
LIMIT 5; 

-- Top 5 best sellers by total quantity
SELECT 
    pizza_name, SUM(quantity) AS total_quantity
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

-- Bottom 5 worst sellers by total quantity
SELECT 
    pizza_name, SUM(quantity) AS total_quantity
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity
LIMIT 5;

-- Top 5 best sellers by total orders
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

-- Bottom 5 worst sellers by total orders
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_orders
LIMIT 5;



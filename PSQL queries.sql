-- Question 1: What are the different payment methods, and how many transactions and
-- items were sold with each method?

SELECT 
    payment_method,
    COUNT(invoice_id) AS total_transactions,
    SUM(quantity) AS total_items_sold
FROM sales_data
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- Question 2: Which category received the highest average rating in each branch?

WITH category_ratings AS (
    SELECT
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY AVG(rating) DESC
        ) AS rank_in_branch
    FROM sales_data
    GROUP BY branch, category
)

SELECT
    branch,
    category,
    ROUND(avg_rating::numeric,2)
FROM category_ratings
WHERE rank_in_branch = 1;

-- Question 3: What is the busiest day of the week for each branch based on transaction volume?

WITH branch_day_transactions AS (
    SELECT
        branch,
        TO_CHAR(date::date, 'Day') AS day_name,
        COUNT(*) AS transaction_count,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(*) DESC
        ) AS rank_day
    FROM sales_data
    GROUP BY branch, TO_CHAR(date::date, 'Day')
)

SELECT
    branch,
    day_name,
    transaction_count
FROM branch_day_transactions
WHERE rank_day = 1;

-- Question 4: How many items were sold through each payment method?

SELECT
    payment_method,
    SUM(quantity) AS total_quantity_sold
FROM sales_data
GROUP BY payment_method
ORDER BY total_quantity_sold DESC;

-- Question 5: What are the average, minimum, and maximum ratings for each category in each city?

SELECT
    city,
    category,
    ROUND(AVG(rating)::numeric,2) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM sales_data
GROUP BY city, category
ORDER BY city, avg_rating DESC;

-- Question 6: What is the total profit for each category, ranked from highest to lowest?

SELECT
    category,
    ROUND(SUM(total_price * profit_margin)::numeric,2) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_profit DESC;

-- Question 7: What is the most frequently used payment method in each branch?

WITH payment_counts AS (
    SELECT
        branch,
        payment_method,
        COUNT(*) AS payment_count,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(*) DESC
        ) AS rank_payment
    FROM sales_data
    GROUP BY branch, payment_method
)

SELECT
    branch,
    payment_method,
    payment_count
FROM payment_counts
WHERE rank_payment = 1;

-- Question 8: How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?

WITH sales_shift AS (
    SELECT
        branch,
        CASE
            WHEN time < '12:00:00' THEN 'Morning'
            WHEN time BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM sales_data
)

SELECT
    branch,
    shift,
    COUNT(*) AS total_transactions
FROM sales_shift
GROUP BY branch, shift
ORDER BY branch, total_transactions DESC;

-- Question 9: Which branches experienced the largest decrease in revenue compared to the previous year?

WITH yearly_revenue AS (
    SELECT
        branch,
        EXTRACT(YEAR FROM date) AS year,
        SUM(total_price) AS revenue
    FROM sales_data
    GROUP BY branch, year
),

revenue_change AS (
    SELECT
        branch,
        year,
        revenue,
        LAG(revenue) OVER (
            PARTITION BY branch
            ORDER BY year
        ) AS previous_year_revenue,
        revenue - LAG(revenue) OVER (
            PARTITION BY branch
            ORDER BY year
        ) AS revenue_change
    FROM yearly_revenue
)

SELECT
    branch,
    year,
    revenue,
    ROUND(previous_year_revenue::numeric,2),
    ROUND(revenue_change::numeric,2)
FROM revenue_change
WHERE revenue_change < 0
ORDER BY revenue_change
LIMIT 5;
CREATE SCHEMA dannys_diner;
SET search_path = dannys_diner;

CREATE TABLE sales (
  "customer_id" VARCHAR(1),
  "order_date" DATE,
  "product_id" INTEGER
);

INSERT INTO sales
  ("customer_id", "order_date", "product_id")
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  "product_id" INTEGER,
  "product_name" VARCHAR(5),
  "price" INTEGER
);

INSERT INTO menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  "customer_id" VARCHAR(1),
  "join_date" DATE
);

INSERT INTO members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');

/* What is the total amount each customer spent at
the restaurant? */

SELECT sales.customer_id, SUM(menu.price) AS total_amt_spent
FROM `martintthai`.`sales` sales
JOIN `martintthai`.`menu` menu ON sals.product_id = menu.product_id
GROUP BY sales.customer_id

/* How many days has each customer visited the
restaurant? */

SELECT customer_id, COUNT(DISTINCT(order_date)) AS days_visited
FROM `martintthai`.`sales` sales
GROUP BY customer_id

/* What is the first item from the menu purchased by each customer? */

set global sql_mode=''; 

/* Disables strict mode so we don't have to do an
only_full_group_by */

SELECT sales.customer_id, MIN(sales.order_date) AS date_ordered, product_name AS first_item_purchased
FROM `martintthai`.`sales` sales
JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
GROUP BY sales.customer_id

/* What is the most purchased item on the menu and how many times was it purchased
by all customers? */

SELECT product_name, COUNT(product_name) AS times_purchased
FROM `martintthai`.`sales` sales
JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
GROUP BY product_name

-- MOST PURCHASED ITEM: RAMEN (8 TIMES)

/* Which item was the most popular for each customer? */

SELECT customer_id, product_name, COUNT(product_name) AS times_purchased
FROM `martintthai`.`sales` sales
JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
GROUP BY customer_id, product_name
ORDER BY times_purchased DESC

/* Which item was purchased first by the customer after they became a member? */

SELECT *, order_date-join_date AS time_passed_til_first_purchase
FROM `martintthai`.`sales` sales 
JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
JOIN `martintthai`.`members` members ON sales.customer_id = members.customer_id
WHERE join_date < order_date
ORDER BY time_passed_til_first_purchase ASC

/* Which item was purchased just before the customer became a member? */

SELECT *, join_date - order_date AS time_passed_til_became_member
FROM `martintthai`.`sales` sales 
JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
JOIN `martintthai`.`members` members ON sales.customer_id = members.customer_id
WHERE join_date > order_date
ORDER BY time_passed_til_became_member ASC

/* What is the total items and amount spent for each member before they became a
member? */

SELECT sales.customer_id, COUNT(sales.product_id) AS total_items_bought
FROM `martintthai`.`sales` sales 
JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
JOIN `martintthai`.`members` members ON sales.customer_id = members.customer_id
WHERE join_date > order_date
GROUP BY sales.customer_id

SELECT sales.customer_id, SUM(menu.price) AS total_amt_spent
FROM `martintthai`.`sales` sales 
JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
JOIN `martintthai`.`members` members ON sales.customer_id = members.customer_id
WHERE join_date > order_date
GROUP BY sales.customer_id

/* If each $1 equates to 10 points and sushi has a 2x points multiplier - how
many points would each customer have? */

SELECT sales.customer_id,
SUM(CASE WHEN sales.product_id = 1 THEN price * 20
WHEN sales.product_id = 2 THEN price * 10
WHEN sales.product_id = 3 THEN price * 10
END) AS total_points
FROM `martintthai`.`sales` sales 
LEFT JOIN `martintthai`.`members` members ON sales.customer_id = members.customer_id
LEFT JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
GROUP BY sales.customer_id

/* In the first week after a customer joins the program (including their join
date) they earn 2x points on all items, not just sushi - how many points do
customer A and B have at the end of January? */

WITH sales_with_membership_wk AS
    (SELECT sales.customer_id,
    sales.order_date,
    members.join_date,
    DATE_ADD(join_date, INTERVAL 6 DAY) AS end_double_pts_week,
    menu.product_name,
    menu.price
    FROM `martintthai`.`sales` sales 
    JOIN `martintthai`.`menu` menu ON sales.product_id = menu.product_id
    JOIN `martintthai`.`members` members ON sales.customer_id = members.customer_id)

SELECT customer_id,
SUM(CASE WHEN order_date BETWEEN join_date AND end_double_pts_week THEN price * 20
WHEN (order_date NOT BETWEEN join_date AND end_double_pts_week) AND  product_name = 'sushi' THEN price * 20
ELSE price * 10 
END) points
FROM sales_with_membership_wk
WHERE order_date < '2021-02-01'
GROUP BY customer_id
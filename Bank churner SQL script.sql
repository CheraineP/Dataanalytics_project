-- Open table 
SELECT * FROM FINANCE.BANKCHURNERS; 

-- The amount of customers that have churned = 1627
SELECT COUNT(clientnum) AS "Bank Churners"
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer';


-- AVG, Min, Max Credit limit of churners, 8136.0166, 1438, 34516
SELECT AVG(credit_limit) AS 'AVG c-limit', MIN(credit_limit) AS 'MIN C-LIMIT', MAX(CREDIT_LIMIT) AS 'MAX c-LIMIT'
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer';


-- EDUCATION LEVEL
-- The amount of customers who have churned according to education level 
-- college-154, doctorate-95, graduate-487, high school-306, postgraduate-92, uneducated-237, unknown-256
SELECT COUNT(clientnum) AS "Bank Churners", education_level, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer'
group by education_level
order by 2;

-- AGE RANGE
-- the number of customers who have churned, younger than 55 = 1365
SELECT COUNT(clientnum) AS "Bank Churners", customer_age, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND customer_age < 55;

-- the number of customers who have churned and are older than 55 = 62
SELECT COUNT(clientnum) AS "Bank Churners", customer_age, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND customer_age > 55;


-- the nummber of customers who have churned according to marital status. 
-- divorced - 121, married-709, single-668, unknown-129
SELECT COUNT(clientnum) AS "Bank Churners", marital_status, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer'
group by marital_status
order by 2;


-- the number of customers who have churned according to gender. female - 930  male-697
SELECT COUNT(clientnum) AS "Bank Churners", gender, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer'
group by gender;

-- DEPENDANTS
-- the number of customers who have churned with 2 or less dependents = 821
SELECT COUNT(clientnum) AS "Bank Churners", dependent_count, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND dependent_count < 3;


-- the number of customers who have churned with 3 or more dependents = 324
SELECT COUNT(clientnum) AS "Bank Churners", dependent_count, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND dependent_count > 3;


-- INCOME STATUS
-- the number of customers who have churned with income less than 40k = 612
SELECT COUNT(clientnum) AS "Bank Churners", income_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND income_category = 'less than $40k';

-- the nummber of customers who have chured with income 40k - 60k = 271
SELECT COUNT(clientnum) AS "Bank Churners", income_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND income_category = '$40k - $60k';

-- the number of customers who have churned with income of 60k - 80K = 189
SELECT COUNT(clientnum) AS "Bank Churners", income_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND income_category = '$60k - $80k';

-- the number of customers who have churned with income of 80k - 120k = 242
SELECT COUNT(clientnum) AS "Bank Churners", income_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND income_category = '$80k - $120k'; 


-- the nummber of customers who have churned with income of more thank 120k = 126
SELECT COUNT(clientnum) AS "Bank Churners", income_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND income_category = '$120k +';


-- CARD CATERGORY
-- the number of customers who have churned with blue card = 1519
SELECT COUNT(clientnum) AS "Bank Churners", card_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND card_category = 'Blue';

-- number of customers who have churned with silver card = 82
SELECT COUNT(clientnum) AS "Bank Churners", card_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND card_category = 'Silver';

-- number of customers who have churned with gold card = 21
SELECT COUNT(clientnum) AS "Bank Churners", card_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND card_category = 'Gold';

-- numbe rof custoemrs who have churned with platinum card = 5
SELECT COUNT(clientnum) AS "Bank Churners", card_category, attrition_flag
FROM FINANCE.BANKCHURNERS
WHERE attrition_flag = 'attrited customer' AND card_category = 'Platinum';


-- MONTHS ON THE BOOK
-- number of churners in categories, less that 30 months, 31-40, 41-50, 51-60, 60+
SELECT clientnum AS "Bank Churners", months_on_book, attrition_flag,
CASE
WHEN months_on_book <= 30 THEN 'less than 30 months'
WHEN months_on_book BETWEEN 31 AND 40 THEN '31 - 40 MONTHS'
WHEN months_on_book BETWEEN 41 AND 50 THEN '41-50 MONTHS'
WHEN MONTHS_ON_BOOK BETWEEN 51 AND 60 THEN '51-60 MONTHS'
ELSE '60+'
END AS ' churners months on book'
FROM finance.bankchurners
where attrition_flag = 'attrited customer';

-- AVERAGE UTILISATION 
-- average utilisation of churners and non churners
-- Existing customers = 0.296  Attrited customers = 0.162
SELECT AVG(AVG_UTILIZATION_RATIO), attrition_flag AS 'Bank Churner'
From FINANCE.BANKCHURNERS
GROUP BY attrition_flag;


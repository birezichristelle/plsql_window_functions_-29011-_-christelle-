JOIN.SQL

INNER JOIN
SELECT 
    c.full_name,
    a.account_id,
    t.amount,
    t.txn_date
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id
INNER JOIN transactions t ON a.account_id = t.account_id
WHERE t.txn_type = 'Deposit';

LEFT JOIN
SELECT 
    c.customer_id,
    c.full_name,
    c.branch_id
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

RIGHT JOIN
SELECT 
    acc_types.type AS account_type,
    COUNT(t.transaction_id) AS txn_count
FROM (
    SELECT 'Savings' AS type UNION SELECT 'Checking' UNION SELECT 'Loan'
) acc_types
LEFT JOIN accounts a ON acc_types.type = a.account_type
LEFT JOIN transactions t ON a.account_id = t.account_id
GROUP BY acc_types.type;

FULL OUTER JOIN

SELECT c.full_name, t.amount, t.txn_date
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id

UNION

SELECT c.full_name, t.amount, t.txn_date
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
RIGHT JOIN customers c ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELF JOIN

SELECT 
    c1.full_name AS customer_A,
    c2.full_name AS customer_B,
    c1.branch_id
FROM customers c1
JOIN customers c2 
  ON c1.branch_id = c2.branch_id 
  AND c1.customer_id < c2.customer_id
WHERE c1.branch_id = 1001;

-- 1. Total transactions and fraudulent transactions
SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) AS fraudulent_transactions
FROM transactions;

-- 2. Distribution of transaction types
SELECT type, COUNT(*) AS type_count
FROM transactions
GROUP BY type
ORDER BY type_count DESC;

-- 3. Fraudulent transactions by type
SELECT type, COUNT(*) AS fraud_count
FROM transactions
WHERE isFraud = 1
GROUP BY type
ORDER BY fraud_count DESC;

-- 4. Average amount for fraud vs. non-fraud
SELECT isFraud, AVG(amount) AS avg_amount
FROM transactions
GROUP BY isFraud;

-- 5. Most flagged accounts
SELECT nameOrig, COUNT(*) AS flagged_count
FROM transactions
WHERE isFlaggedFraud = 1
GROUP BY nameOrig
ORDER BY flagged_count DESC;

-- 6. Most frequent destination accounts
SELECT nameDest, COUNT(*) AS txn_count
FROM transactions
GROUP BY nameDest
ORDER BY txn_count DESC
LIMIT 5;

-- 7. Accounts sending the most money
SELECT nameOrig, SUM(amount) AS total_sent
FROM transactions
GROUP BY nameOrig
ORDER BY total_sent DESC
LIMIT 5;

-- 8. Average balance of fraudulent vs. non-fraudulent accounts
SELECT isFraud, AVG(oldbalanceOrg) AS avg_balance
FROM transactions
GROUP BY isFraud;

-- 9. Average transaction amount per type
SELECT type, AVG(amount) AS avg_amount
FROM transactions
GROUP BY type
ORDER BY avg_amount DESC;

-- 10. Fraud rate per transaction type
SELECT type,
       SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS fraud_rate
FROM transactions
GROUP BY type;

-- 11. Transactions where origin balance didn’t change
SELECT COUNT(*) AS unchanged_origin_balance
FROM transactions
WHERE oldbalanceOrg = newbalanceOrig;

-- 12. Transactions where destination balance didn’t change
SELECT COUNT(*) AS unchanged_dest_balance
FROM transactions
WHERE oldbalanceDest = newbalanceDest;

-- 13. Both balances unchanged in fraud cases
SELECT COUNT(*) AS static_balance_frauds
FROM transactions
WHERE isFraud = 1
  AND oldbalanceOrg = newbalanceOrig
  AND oldbalanceDest = newbalanceDest;

-- 14. Frauds flagged by the system
SELECT COUNT(*) AS flagged_frauds
FROM transactions
WHERE isFraud = 1 AND isFlaggedFraud = 1;

-- 15. Fraud by step (time interval)
SELECT step, COUNT(*) AS fraud_count
FROM transactions
WHERE isFraud = 1
GROUP BY step
ORDER BY fraud_count DESC;

# Detecting Fraud in Financial Transactions using SQL

This repository demonstrates fraud detection in financial transactions using **SQL queries**.  
The dataset is based on the **PaySim** mobile money simulation dataset, which contains over 6 million transactions.

---

## 📌 Contents
- **queries.sql** → SQL queries for fraud detection  
- **Detecting Fraud in Financial Transactions using SQL.pptx** → Project presentation  

---

## ⚙️ Features
- SQL aggregation and filtering queries  
- Fraud detection by transaction type  
- Anomaly detection (unchanged balances, flagged frauds, etc.)  
- Fraud patterns across time (steps)  

---

## 🛠 Example Queries
- Total transactions and fraudulent transactions  
- Fraudulent transaction distribution by type  
- Average fraud vs. non-fraud transaction amount  
- Fraud rate by transaction type  
- Fraud frequency over time steps  

---

## 🚀 How to Run
Run the queries in `queries.sql` on your database:
```sql
-- Example: Fraudulent transaction count by type
SELECT type, COUNT(*) AS fraud_count
FROM transactions
WHERE isFraud = 1
GROUP BY type
ORDER BY fraud_count DESC;


Dataset

Dataset used:
PaySim Synthetic Financial Dataset For Fraud Detection

Source:
https://www.kaggle.com/datasets/ealaxi/paysim1

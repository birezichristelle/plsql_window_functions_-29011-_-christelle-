BUSINESS PROBLEM

Ten branches make up the regional commercial bank Unity Bank. Using information from transactions, the Retail Banking Department is trying to identify high-value customers, minimize customer loss, and boost branch performance.
The Retail Banking Department faces challenges in understanding customer behavior, identifying high-value clients, and detecting at-risk (inactive) customers. Currently, data is stored in separate tables for customers, accounts, and transactions, making it difficult to: Identify top depositors per branch, Track monthly deposit trends, Segment customers by activity level, Reactivate dormant accounts.

This project uses SQL JOINs and Window Functions in MySQL 8.0 (via XAMPP) to turn raw data into useful business insights that support customer retention, targeted marketing, and branch performance optimization.

DATABASE SCHEMA

![Description](screenshots/ER_Diagram.png)
  
SUCCESS CRITERIA

This analysis fulfills the following measurable objectives using MySQL window functions:

1. Top 5 depositors per branch → RANK()
   ![Description](screenshots/ranks.png)
3. Running monthly deposit total per branch → SUM() OVER() with ROWS UNBOUNDED PRECEDING
   ![Description](screenshots/Aggregate.png)
4. Month-over-month % change in average deposit size → LAG()
   ![Description](screenshots/Navigation.png)
6. Customer quartiles by transaction count → NTILE(4)
   ![Description](screenshots/Distribution.png)
8. 3-month moving average of daily deposits → AVG() OVER(ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)

KEY INSIGHTS

DESCRIPITIVE INSIGHTS

Branch 1001 (Kigali Main) generated RWF 300,000 in total deposits from January to March 2025.
Alice Uwamariya was the top depositor with RWF 140,000, contributing 47% of her branch’s total.
3 out of 8 customers (Thomas Mutoni) had zero transactions — classified as fully dormant.

DIAGNOSTICS INSIGHTS

Average deposit size dropped by 41.6% from January (RWF 85,625) to February (RWF 50,000), likely due to reduced payroll deposits after the holiday season.
Branch 1002’s top customer (Marie Mukamana) deposited RWF 300,000 — more than double Branch 1001’s leader — suggesting stronger corporate client relationships.

RECOMMENDATIONS

Launch a “Salary Advance” product for payroll customers to stabilize off-cycle deposits.
Offer fee waivers and priority service to Quartile 1 customers (top 25%) to increase loyalty.
Send personalized reactivation offers (e.g., “We miss you! 10% bonus on your next deposit”) to Quartile 4 customers and fully dormant accounts.

REFERENCES

Lecture - 01 Introduction to SQL Command Basics.pdf

Lecture - 02 Introduction to GitHub.pdf


CREATE TABLE loan_borrowers (
    borrower_id VARCHAR(50) PRIMARY KEY,
    age INT,
    employment_status VARCHAR(100),
    province VARCHAR(100),
    monthly_income NUMERIC(15, 2),
    credit_limit NUMERIC(15, 2),
    outstanding_amount NUMERIC(15, 2),
    monthly_installment NUMERIC(15, 2),
    num_active_lending_apps INT,
    dpd_days INT,
    twp90_status VARCHAR(50),
    primary_default_root_cause VARCHAR(100)
);


SELECT 
    employment_status,
    COUNT(borrower_id) AS total_borrowers_macet,
    SUM(total_loan_outstanding_idr) AS total_outstanding_macet,
    ROUND(AVG(total_loan_outstanding_idr), 2) AS avg_exposure_per_borrower
FROM loan_borrowers
WHERE twp90_default_status = 'Default-Macet-TWP90'
GROUP BY employment_status
ORDER BY total_borrowers_macet DESC;

SELECT 
    twp90_default_status,
    COUNT(borrower_id) AS total_borrowers,
    ROUND(AVG(debt_service_ratio)::numeric, 2) AS avg_dsr,
    ROUND(AVG(credit_limit_utilization_ratio)::numeric * 100, 2) AS avg_limit_utilization_pct
FROM loan_borrowers
GROUP BY twp90_default_status
ORDER BY avg_dsr DESC;

SELECT 
    primary_default_root_cause,
    COUNT(borrower_id) AS total_cases,
    ROUND(
        COUNT(borrower_id) * 100.0 / (SELECT COUNT(*) FROM loan_borrowers), 
        2
    ) AS percentage_share
FROM loan_borrowers
GROUP BY primary_default_root_cause
ORDER BY total_cases DESC;

SELECT 
    borrower_id,
    employment_status,
    monthly_income_idr,
    total_loan_outstanding_idr,
    ROUND(debt_service_ratio::numeric, 2) AS calculated_dsr,
    ROUND(credit_limit_utilization_ratio::numeric, 2) AS calculated_utilization,
    num_active_lending_apps,
    twp90_default_status,
    CASE 
        WHEN debt_service_ratio > 0.8 
             OR credit_limit_utilization_ratio > 0.8 
             OR num_active_lending_apps >= 5 THEN 'Tier 3: High Risk (Critical)'
        WHEN debt_service_ratio > 0.5 
             OR credit_limit_utilization_ratio > 0.6 
             OR num_active_lending_apps >= 3 THEN 'Tier 2: Medium Risk (Watchlist)'
        ELSE 'Tier 1: Low Risk (Safe)'
    END AS customer_risk_tier
FROM loan_borrowers;
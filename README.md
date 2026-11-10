# End-to-End P2P Lending & Paylater Credit Risk Analytics
### *Portfolio Default Driver Analysis, Early Warning System (EWS) Framework, and Mitigation Strategy*

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15.0-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-Interactive_Dashboard-E97627?style=for-the-badge&logo=tableau&logoColor=white)
![Domain](https://img.shields.io/badge/Industry-Credit_Risk_&_Fintech-black?style=for-the-badge)

---

## Executive Summary

This project conducts a comprehensive end-to-end credit risk evaluation of a **10,000-borrower P2P lending portfolio**, representing **Rp99.02 Billion** in total outstanding balance. 

The primary objective is to identify systemic credit default drivers, diagnose debt service vulnerabilities, and engineer an actionable **Early Warning System (EWS) Risk Tiering Model** to mitigate Non-Performing Loans (NPL / TWP90) and protect portfolio cash flows.

---

## Key Portfolio Metrics & Insights

| Key Metric | Value | Executive Assessment |
| :--- | :---: | :--- |
| **Total Active Portfolio** | **10,000 Borrowers** | Total evaluated loan population across Indonesia |
| **Total Loan Outstanding** | **Rp99.02 Billion** | Total exposure evaluated in the 2026 dataset |
| **Portfolio TWP90 Default Rate** | **25.38%** | Critical risk level exceeding healthy industry baseline (~5%) |
| **Median DSR (Defaulted Group)** | **1.68x** | Severe cash deficit; debt obligations exceed total income by 68% |
| **Limit Utilization (Defaulted Group)**| **87.03%** | Extreme credit dependence and limit maxing behavior |
| **Primary Root Cause Driver** | **Compulsive / FOMO (35.88%)** | Lifestyle-driven consumption leading to debt spirals (53.66% macet pool share) |

---

## Key Findings & Analytical Deep-Dive

### 1. Sectoral Exposure Concentration
* **Formal Private Employees (990 defaulted borrowers)** and **Gig Workers / Ojol (450 defaulted borrowers)** constitute the vast majority of non-performing loan volume.
* While default rates across employment sectors appear evenly distributed (~25%), absolute monetary exposure is heavily concentrated in formal workers due to higher granted credit limits.

### 2. Debt Service Ratio (DSR) & Limit Utilization Thresholds
* Performing borrowers maintain a healthy median DSR of **0.30x** and limit utilization of **41.46%**.
* Non-performing borrowers (*Default-Macet-TWP90*) demonstrate a median DSR of **1.68x** combined with **87.03% limit utilization**, signaling structural insolvency prior to default.

### 3. Primary Root Cause Analysis
* **Compulsive-FOMO-Spending (35.88%)** acts as the primary top-of-funnel trigger across total loan applications.
* Once borrowers transition into severe delinquency, **Gali-Lubang-Debt-Spiral (53.66%)** dominates as the primary operational cause of non-recovery.

---

## Early Warning System (EWS) Risk Framework

To proactively prevent delinquency escalation, a rule-based 3-Tier risk framework was engineered using SQL and Python:

```
                  Early Warning System (EWS)
                              │
         ┌────────────────────┼────────────────────┐
         ▼                    ▼                    ▼
┌───────────────────┐┌───────────────────┐┌───────────────────┐
│ Tier 1: Low Risk  ││Tier 2: Medium Risk││ Tier 3: High Risk │
│     (12.26%)      ││     (30.59%)      ││     (57.15%)      │
├───────────────────┤├───────────────────┤├───────────────────┤
│ • DSR ≤ 0.50      ││ • DSR > 0.50      ││ • DSR > 0.80      │
│ • Limit Util ≤ 60%││ • Limit Util > 60%││ • Limit Util > 80%│
│ • Active Apps < 3 ││ • Active Apps ≥ 3 ││ • Active Apps ≥ 5 │
└───────────────────┘└───────────────────┘└───────────────────┘

```
---

## Strategic Recommendations & Action Plan

1. **Immediate Underwriting Policy Reform:** Cap maximum allowable DSR at **0.50x** (50% of income) and restrict credit limit expansion for borrowers holding **≥3 active lending applications**.
2. **Automated EWS Intervention:** Trigger immediate limit freezes and restructuring offers for borrowers flagged under **Tier 2 (Watchlist)** before DPD exceeds 30 days.
3. **Behavioral Fraud & Multi-App Monitoring:** Integrate real-time credit bureau APIs to detect cross-platform multi-borrowing behavior (*Gali-Lubang*) during application intake.

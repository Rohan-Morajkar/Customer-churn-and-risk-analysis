# Customer Churn & Risk Analysis Dashboard

## Project Background
As a Data Analyst at **TelcoCo**—a consumer telecommunications provider operating since 2010 with both B2C and B2B subscription models—I was tasked with understanding patterns of customer churn and identifying those at highest risk of leaving. TelcoCo offers broadband and voice services across fiber-optic and DSL networks to over 7,000 active subscribers, generating \$16 million in annual revenue and \$456 K in monthly recurring charges. Key KPIs include total customer base, customers at risk, churn rate , yearly charges and monthly charges.

**Insights and recommendations are provided on the following key areas:**
- **Category 1: Demographics of Churned Customers**  
- **Category 2: Subscription Services & Add-ons**  
- **Category 3: Account & Billing Information**  
- **Category 4: Contract Type & Tenure Risk**

The SQL queries used to inspect and clean the raw data can be found here: [SQL Inspection & Cleaning](./sql/inspection_and_cleaning.sql)  
Targeted SQL queries for business-driven questions can be found here: [Business-Question SQL](./sql/business_questions.sql)  
An interactive Power BI dashboard is published here: [Power BI Report ↗](https://app.powerbi.com/…your-report-link…)



###  Data Cleaning Process

The dataset underwent a thorough cleaning process to ensure accuracy and consistency before analysis. Below are the key actions taken:

- **Handled Missing Values:**
  - Converted `NaN` or blank values in categorical columns (e.g., `gender`, `partner`, `internet_service`, `payment_method`, etc.) into a unified placeholder `"unknown"`.
  - Removed rows with missing `customer_id` as it is a critical identifier (affecting ~5.1% of the data).

- **Standardized Anomalous Values:**
  - In the `senior_citizen` column, an unexpected decimal value `0.801191362620998` was corrected by first converting to blank and then to `"unknown"`.
  - In the `tenure` column, an outlier value `162.457185405808` was similarly handled by converting it to blank and then to `"unknown"`.

- **Uniform Handling Across Columns:**
  - All binary or categorical columns were treated consistently — where both `NaN` and blank cells were replaced with `"unknown"` for clarity in downstream analysis.

- **Summary of Impact:**
  - Approximately **2–5%** of rows were affected per column.
  - Actions were logged for 37 unique cleaning issues across 21+ columns.

> All cleaning steps were recorded in a structured log format, including the column name, issue description, affected row count, magnitude, and resolution.



## Executive Summary

**Top 3 takeaways** for the **Marketing Director**:  
1. **Fiber-optic users churn 69% more** than DSL or non-Internet customers.  
2. **Month-to-month contracts** drive the highest churn (≈83%); multi-year contracts retain best.  
3. Customers without **online security** or **tech support** are 15–30% more likely to churn.


![Screenshot 2025-06-11 160126](https://github.com/user-attachments/assets/922f2af8-1193-4b9c-99bc-1bc6c596836f)



## Insights Deep Dive

### Category 1: Demographics of Churn
1. **Gender parity**: Females (50.7%) and males (49.3%) churn at nearly equal rates, suggesting no strong gender bias in attrition.  
2. **Senior citizens** constitute 25% of churned share in total customers.  
3. **Partners vs. Dependents**: Customers with partners churn 36% vs. dependents at 17%, indicating family composition matters.  
4. **Subscription tenure**: Over half (53%) of churned customers have been with us < 1 year.

<p align="center">
  <img src="https://github.com/user-attachments/assets/0bd56dc7-60c5-48f9-bead-33f9877fca90" width="700" alt="Dashboard Screenshot"/>
</p>


### Category 2: Subscription Services & Add-Ons
1. **Streaming TV & Movies (44%)** are the most common add-ons among churners—suggesting content bundles alone aren’t enough to retain.  
2. **Tech support (17%)** and **online security (16%)** subscriptions are under-leveraged by those who leave.  
3. **Device protection (29%)** and **online backup (28%)** subscribers show modestly lower churn rates—potential upsell targets.  

<p align="center">
  <img src="https://github.com/user-attachments/assets/a3efc5c4-f518-4f80-b9ca-2429ce69cd3d" width="600" alt="Churn by subscribed services"/>
</p>



### Category 3: Account & Billing Information
1. **Electronic check users** churn at 57.3%, far above mailed or bank-transfer methods.  
2. **Paperless billing** customers (74.9% of churners) have a slightly higher churn rate, possibly due to bill-notice fatigue.  
3. **Payment method choice is linked to customer loyalty** Customers using automatic payment methods like bank transfers (13.8%) and credit cards (12.4%) show the lowest churn rates, indicating that encouraging auto-pay setups could reduce friction and increase retention.
4. **Contract length has a powerful impact on churn** Churn is extremely high for monthly contracts (88.5%), while it drops sharply for 1-year (8.8%) and 2-year (2.5%) contracts. Offering loyalty perks or pricing benefits for longer-term plans can significantly reduce churn risk.
   
<p align="center">
  <img src="https://github.com/user-attachments/assets/e61d4f0e-3b78-4204-a285-194309aa2fb6" width="600" height="200"  alt="Contract vs. churn and tenure"/>
</p>

### Category 4: Contract Type & Tenure Risk
1. **Month-to-month contracts**: 88.55% churn rate .  
2. **One year contract ( 1 year)** segment churns at 8.88.  
3. **Two year contracts (2 years)** segment churns at 2.57.  

<p align="center">
  <img src="https://github.com/user-attachments/assets/74c265d6-e6f7-4fca-ac34-17b14f8b9467" width="600" height="300" alt="Contract vs. churn and tenure"/>
</p>





## Recommendations
Based on the above insights, we recommend the **Customer Success & Product teams** consider:

1. **Promote longer-term contracts** with tiered discounts or value bundles to month-to-month subscribers—target high-churn segments with a “Commit & Save” campaign.  
2. **Upsell security & support packages** at onboarding—offer trials for online security, backup, and tech support to reduce early-tenure churn.  
3. **Review electronic check & paperless billing flows** for clarity—send friendly reminders and personalized offers to reduce bill-related cancellations.  
4. **Bundle streaming & core Internet services** with loyalty incentives—leverage video content partnerships to increase stickiness.  
5. **Design a senior citizen loyalty program**—tailor service bundles for customers 65+ to counter their elevated churn rate. 

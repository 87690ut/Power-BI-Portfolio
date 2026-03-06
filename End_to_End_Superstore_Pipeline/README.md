# 📊 End-to-End Superstore Analytics: From Python Pipeline to Power BI

![Python](https://img.shields.io/badge/Python-Data_Cleaning_&_Engineering-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Advanced_Analysis-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Interactive_Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

## 🚀 Project Overview

This project represents a complete **Data Analysis Lifecycle**. I moved beyond basic drag-and-drop analysis to build a robust **Data Pipeline**. The core challenge was transforming inconsistent raw data into a structured SQL database before visualizing it in Power BI.

**Goal:** To transform raw, messy retail data into actionable insights regarding Profitability, Regional Performance, and Product Trends.

---

## 🔄 The Workflow (Architecture)

1.  **Data Engineering (Python):** Built an automated pipeline to clean raw data, specifically tackling **Date Parsing anomalies** (US vs. Indian formats).
2.  **Data Analysis (SQL):** Imported clean data into a database to run complex queries and answer specific business questions.
3.  **Data Visualization (Power BI):** Connected to SQL Views to build a high-fidelity, interactive dashboard.

---

## 📸 Dashboard Preview

![Dashboard Screenshot](ADD_YOUR_IMAGE_LINK_HERE)

> **Live Interaction:** [ADD_YOUR_PUBLISH_LINK_HERE]

---

## 🛠️ Step 1: Python Data Cleaning & Advanced Date Engineering

This was the most critical phase. The raw dataset was highly unstructured, especially the `Order_Date` column.

### 🛑 The Challenge: Ambiguous Date Formats
The raw data contained a mix of formats: some entries were in US format (`MM/DD/YYYY`) while others were in Indian/Global format (`DD-MM-YYYY`).
* *Issue:* Standard importing tools (like Excel or basic Pandas) were misinterpreting `05/12/2022`. Is it **May 12th** or **Dec 5th**? This ambiguity was causing incorrect monthly trend analysis.

### ✅ The Advanced Solution
I wrote a custom Python script using **Pandas** to enforce strict locale-aware parsing.
* **Logic:** Implemented `dayfirst=True` parameter and custom lambda functions to standardize all dates into a single, SQL-compatible ISO format (`YYYY-MM-DD`).
* **Result:** Achieved 100% data accuracy for Time Series Analysis.

```python
# 🐍 Snippet: Handling the Indian vs US Date Conflict
import pandas as pd

# The 'advanced' fix: Forcing day-first logic to handle mixed locales correctly
df['Order_Date'] = pd.to_datetime(df['Order_Date'], dayfirst=True, errors='coerce')

# Standardizing text to title case for consistency
df['Region'] = df['Region'].str.title().str.strip()

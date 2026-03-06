# 📊 End-to-End Superstore Analytics: From Python Pipeline to Power BI

![Python](https://img.shields.io/badge/Python-Data_Engineering-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Advanced_Analysis-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Interactive_Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

## 🚀 Project Overview

This is a complete **End-to-End Data Engineering & Analytics Project**.
The raw data presented significant challenges with date formatting and data types. Instead of manual fixing in Excel, I built an **Automated Python Pipeline** to handle format anomalies before analyzing it in SQL and visualizing it in Power BI.

---

## 🛠️ PHASE 1: Python Data Engineering (The Core Logic)

The raw dataset had major data quality issues regarding Date formats. I wrote a Python script to automate the cleaning process.

### 🛑 Challenge: The "Universal" Date Parsing Problem
The input data contained dates in mixed formats (e.g., some `DD-MM-YYYY`, some `MM/DD/YYYY`). Standard tools failed to parse this correctly, leading to potential data loss or incorrect month trends.

### ✅ My Solution: Automatic Format Detection
I implemented a robust parsing technique using Pandas that automatically detected and standardized mixed date formats into a single SQL-compatible ISO format (`YYYY-MM-DD`).

```python
# 🐍 Code Snippet: Automatic Date Parsing
import pandas as pd

# The script automatically parses mixed date formats into a standard ISO format
# ensuring 100% accuracy for Time Series Analysis without manual intervention.
# 'dayfirst=True' handles the ambiguous dates (e.g., 12-05-2022) correctly.
df['Order_Date'] = pd.to_datetime(df['Order_Date'], dayfirst=True, errors='coerce')

# Exporting clean data for SQL ingestion
df.to_csv('superstore_cleaned.csv', index=False)
```

---

## 🛠️ PHASE 2: SQL Data Analysis
Once the data was clean, I pushed it to a SQL database to run business validation queries.

* **Type Conversion Fix:** In SQL, I explicitly cast `Sales` and `Profit` fields to **Decimal/Numeric** types because they were initially detected as text strings. This ensured accurate aggregation (SUM/AVG) in Power BI.
* **View Creation:** Created optimized SQL Views to fetch only relevant data for the dashboard.

---

## 🛠️ PHASE 3: Power BI Advanced Visualization

### 1. 🎨 UI Engineering: The "Container" Strategy
**Problem:** Applying shadows to grouped icons and text resulted in a broken, fragmented look.
**Solution:** I placed a rounded rectangle shape behind the text/icon group and applied the shadow *only* to this container. This created a smooth, floating card effect.

### 2. 🗺️ Logic: Dynamic Map Coloring
**Problem:** The default map showed all bubbles in the same color, hiding performance issues.
**Solution:** I applied **Conditional Formatting** based on Profit:
* 🔴 **Red Bubbles:** Negative Profit (Loss).
* 🟢 **Green Bubbles:** Positive Profit.
* *Result:* Instantly highlighted that high-sales regions like **Texas** were actually loss-making.

### 3. 🎛️ Navigation: Custom Slicer Panel
To keep the dashboard clean, I built a hidden **Side Menu** for filters (Year, Region) using **Bookmarks** and the **Selection Pane**, complete with a "Reset All" button.

---

### 👨‍💻 Tech Stack
* **Python:** Pandas (Automated Date Parsing)
* **SQL:** Data Transformation & Validation
* **Power BI:** DAX, Data Modeling, Advanced UI Design

---

### 🔗 Author
**Uttam Tiwari**
*Full-Stack Data Analyst*
* [LinkedIn Profile Link]
* [GitHub Profile Link]
*

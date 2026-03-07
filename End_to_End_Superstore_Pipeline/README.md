# 🚀 End-to-End Superstore Analytics: Engineering & Business Intelligence Pipeline

![Python](https://img.shields.io/badge/Python-Data_Engineering-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data_Warehousing-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Advanced_Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

## 💼 Executive Summary
This project is not just a dashboard; it is a **Full-Stack Data Solution**.
I simulated a real-world scenario where the raw data was **unstructured, messy, and inconsistent**. Instead of manual fixes, I engineered an automated **ETL Pipeline** using Python, validated the logic in SQL, and built a high-performance Power BI report.

---

## 🏗️ The Architecture (Data Flow)

```mermaid
Raw CSV (Messy) --> [Python Script] --> Clean CSV (Structured) --> [SQL Database] --> [Power BI Dashboard]
```

* **Input:** 50,000+ Raw sales records with mixed date formats and text-based numbers.
* **Process:** Automated cleaning using Custom Parsers, Type Casting, and Normalization.
* **Output:** Interactive Decision-Making Tool for Stakeholders.

---

## 🛠️ PHASE 1: Advanced Data Engineering (Python)
*The Reality: Real-world data is never clean.*

### 🛑 The "Date Parsing" Nightmare
The raw data contained a mix of **Indian (`DD-MM-YYYY`)** and **US (`MM/DD/YYYY`)** formats. Standard Pandas import failed, treating dates as objects or swapping months/days.

### ✅ The Solution: 'dateutil' Library Implementation
Pandas alone wasn't enough. I imported the specialized **`dateutil`** library to inspect every single row individually.
* **Logic:** I applied a custom parsing function with **`dayfirst=True`**.
* **Result:** This forced the system to correctly identify the Day vs Month logic for every entry, ensuring 100% accuracy.

```python
# 🐍 Snippet: The "Universal" Date Parser using dateutil
import pandas as pd
from dateutil.parser import parse  # Importing the advanced parser

# Standard tools failed on mixed formats. 
# I used a Lambda function to apply 'dateutil.parse' to every row.
# 'dayfirst=True' ensures Indian/International format is prioritized.

df['Order_Date'] = df['Order_Date'].apply(lambda x: parse(str(x), dayfirst=True))
```

---

## 🛠️ PHASE 2: SQL Validation & Business Logic
*Before visualization, I ensured the numbers were mathematically correct.*

### 🛑 The "Text vs Number" Trap
During import, `Sales` and `Profit` columns were detected as **Text** due to currency symbols (`$`). This made aggregation (SUM/AVG) impossible in Power BI.

### ✅ The Solution: Explicit Type Casting
I created a **SQL View** to serve as the "Single Source of Truth," casting columns to strict Decimal types.

```sql
-- Creating a View to feed Power BI
CREATE VIEW v_sales_analytics AS
SELECT 
    order_id,
    region,
    category,
    -- Casting text to precision decimals to prevent rounding errors
    CAST(REPLACE(sales, '$', '') AS DECIMAL(10,2)) AS sales_val,
    CAST(REPLACE(profit, '$', '') AS DECIMAL(10,2)) AS profit_val
FROM superstore_cleaned;
```

---

## 🛠️ PHASE 3: Power BI User Experience (UX) Engineering
*I moved beyond basic charts to create a "Product," not just a report.*

### 1. 🖱️ Report Page Tooltips (Drill-Through)
**Feature:** Standard tooltips are limited. I created a custom **"Mini-Report"** that appears when you hover over a State.
* **Benefit:** It instantly shows the "Top 5 Products" for that specific region without the user having to leave the main map view.

### 2. 🎨 UI Engineering: The "Container Strategy"
**Design Challenge:** When grouping Icons and KPI cards, applying shadows directly caused the visual to look "broken" or fragmented.
**My Fix:** I implemented a **Background Container Strategy**.
* I placed a rounded rectangle "plate" behind every visual group.
* Applied the shadow *only* to the background plate.
* **Result:** This created a clean, unified card look without glitches.

### 3. 🗺️ Dynamic Conditional Logic (Red/Green)
**Insight:** A state with High Sales can still be a Loss-Maker.
**Logic:** I applied a DAX rule to color map bubbles dynamically.
* 🟢 **Green:** Profitable
* 🔴 **Red:** Loss-making (Immediate attention required)
* *Result:* This instantly flagged **Texas** as a critical problem area despite high revenue.

---

### 👨‍💻 Author
**Uttam Tiwari**
*Full-Stack Data Analyst | Turning Data into Decisions*
* [LinkedIn Profile]
* [GitHub Profile]

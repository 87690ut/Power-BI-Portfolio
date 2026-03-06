# 📊 End-to-End Superstore Analytics: From Python Pipeline to Power BI

![Python](https://img.shields.io/badge/Python-Data_Cleaning_&_Engineering-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Advanced_Analysis-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Pro_Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

## 🚀 Project Overview

This is not just a dashboard; it is a **Full-Stack Data Analytics Project**. I manually built the entire data pipeline from scratch because the raw data was too messy for direct analysis.

**My Journey:**
Raw CSV ➔ **Python** (Complex Cleaning & Date Parsing) ➔ **SQL** (Business Logic & Validation) ➔ **Power BI** (Advanced UI & Storytelling).

---

## 🛠️ PHASE 1: Data Engineering with Python (The Hardest Part)
*The raw data contained mixed date formats (Indian vs US) and inconsistent text, which broke standard SQL imports.*

### 🛑 The "Date Format" Crisis
The dataset had dates like `12-05-2022`. Standard parsers were confused: Is it **May 12th** or **Dec 5th**? This ambiguity was destroying my Monthly Sales Trends.

### ✅ The Solution (Advanced Parsing)
I wrote a custom cleaning script using `Pandas` to enforce **Locale-Specific Parsing**.

```python
import pandas as pd

# 1. Handling Mixed Date Formats (Indian DD-MM vs US MM-DD)
# I used 'dayfirst=True' to explicitly tell Python to prioritize the International format.
df['Order_Date'] = pd.to_datetime(df['Order_Date'], dayfirst=True, errors='coerce')

# 2. Handling Missing Values (Imputation)
# Instead of dropping rows, I filled missing Sales with the Median value to preserve data.
df['Sales'].fillna(df['Sales'].median(), inplace=True)

# 3. Exporting for SQL
# Saved as a clean CSV ready for database ingestion.
df.to_csv('superstore_cleaned.csv', index=False)
```

---

## 🛠️ PHASE 2: SQL Analysis & Logic Validation
*Before visualizing, I needed to ensure the numbers were accurate. Direct import was causing aggregation errors.*

### 🛑 The "Text vs Number" Trap
When importing data into Power BI from SQL Views, the `Sales` and `Profit` columns were being detected as **Text (Strings)**. This meant Power BI was "Counting" rows instead of "Summing" values.

### ✅ The Solution (Explicit Casting)
I modified the SQL query and Power Query transformations to force the data type to **Decimal Number (Fixed Decimal)**.

* **Key Query Logic:** Created Views to pre-aggregate data for faster dashboard performance.
* **Business Questions Solved:**
    1.  *Which Region is the most profitable?* (West)
    2.  *Top 5 Products causing the highest loss?* (Identified specific machines in the South region).

---

## 🛠️ PHASE 3: Power BI Advanced Visualization
*I moved away from standard "Flat" reports to a "App-like" User Experience.*

### 1. 🎨 UI Engineering: The "Container" Strategy
**The Problem:** I wanted a modern card look. But when I applied shadows to grouped elements (Icon + Text), the shadow broke and looked fragmented.
**The Fix:** I implemented a **Container Method**.
* Created a rounded rectangle "plate" as the background.
* Placed icons and text *on top* of the plate (floating).
* Applied the shadow *only* to the back plate.

### 2. 🗺️ Dynamic Heat Map (The "Red/Green" Logic)
The default map showed all bubbles in Blue, which hid the actual story.
**My Logic:**
* **Green:** Positive Profit (Healthy Markets).
* **Red:** Negative Profit (Loss-making Markets).
* *Insight:* This instantly revealed that **Texas** and **Ohio** are major bleed points despite having high Sales volume.

### 3. 🎛️ Custom Slicer Panel (Bookmarks)
To save canvas space, I didn't clutter the screen with dropdowns.
* Built a collapsible **Side Menu**.
* Used **Bookmarks** & **Selection Pane** to toggle the panel using "Menu" and "Close (X)" buttons.
* Added a **"Reset All"** button to clear filters with one click.

---

## 📉 Key Business Insights Derived
1.  **Discount Impact:** Products with >20% discount are generating 80% of the losses.
2.  **Category Trends:** "Technology" is the highest profit generator, whereas "Furniture" (specifically Tables) is dragging the overall margin down.
3.  **Ship Mode:** "Standard Class" is the most cost-effective shipping method for low-value orders.

---

### 👨‍💻 Tech Stack Used
* **Python:** Pandas, NumPy (Data Cleaning Pipeline)
* **SQL:** PostgreSQL (Data Warehousing & Views)
* **Power BI:** DAX, Bookmarks, Data Modeling (Star Schema)

---

### 🔗 Author
**Uttam Tiwari**
*Full-Stack Data Analyst*
* [LinkedIn] | [GitHub]

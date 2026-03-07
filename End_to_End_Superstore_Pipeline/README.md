# 🛒 Superstore Analytics: The "Accuracy-First" Approach

![Project Status](https://img.shields.io/badge/Status-Completed-success) ![Tools](https://img.shields.io/badge/Tools-PowerBI%20|%20MySQL%20|%20DAX-blue)

## 📖 Project Overview
Unlike standard sales dashboards that focus solely on high-level aggregates, this project was built with a primary focus on **Data Granularity and Row-Level Integrity**. 

The goal was to audit the Superstore dataset using **SQL** for backend verification and visualize the findings in **Power BI** with advanced context filtering. A critical part of this project involved debugging a complex "Filter Context" error where regional totals were masking individual customer performance.

---

## 🛠️ Technical Stack & Workflow

| Component | Tools Used | Key Application |
| :--- | :--- | :--- |
| **Database** | **MySQL Workbench** | Audited data via 8 complex queries (Window Functions, CTEs). |
| **Visualization** | **Power BI** | Built dynamic dashboards with Report Page Tooltips & Bookmarks. |
| **Logic Layer** | **Advanced DAX** | Used `RANKX`, `ALLSELECTED`, and Context Transition for accuracy. |
| **ETL** | **Python/Excel** | Initial data cleaning and format standardization. |

---

## 🧠 The "Sean Miller" Case Study: Solving Data Inaccuracy
*Most analysts stop at the visual. I went deeper to verify the numbers.*

### 1. The Challenge (The Aggregate Trap)
Initially, the "Top Regional Customer" matrix displayed misleading data. For example, the top customer in the South region showed sales of **$389,000+** (Regional Total) instead of their actual contribution.

### 2. The Solution (Context Transition)
I engineered a fix by shifting from Measure-based filtering to **Dimension-based Row Context**.
* **Old Method:** Used `Top N` filter on the visual (Failed - Global Scope).
* **New Method:** Implemented a localized ranking measure:
    ```dax
    Customer Rank = 
    RANKX(
        ALLSELECTED('superstore_cleaned'[customer_name]), 
        [Actual Top Customer Sales], 
        , 
        DESC
    )
    ```
* **Result:** Successfully isolated **Sean Miller** with the correct verified sales of **$23,669.21**.

---

## 📊 SQL Backend Verification (The 8-Query Audit)
Before visualizing, the data was stress-tested using MySQL.

* **Logistics Audit (Q8):** Calculated average shipping delays.
    * *Insight:* "Same Day" shipping averages **0.04 days**, while "Standard Class" takes **5.01 days**.
    * *Integration:* This verified data is now visualized in the dashboard via the **"Explore" Tooltip feature**.
* **Profitability Check (Q1):** Identified that the "Tables" sub-category is a loss-leader with high negative margins.
* **Regional Leaders (Q6):** Used `DENSE_RANK()` partition by Region to pre-validate the Power BI ranking logic.

---

## 📈 Power BI Dashboard Features

### 1. Dynamic "Explore" Feature
Due to space constraints, I implemented a **Hover-over KPI Strategy** for Logistics Analysis.
* **Interaction:** Hovering over the "Explore" icon reveals a hidden Report Page Tooltip.
* **Visual:** Displays the "Average Delivery Days by Ship Mode" chart (Verified against SQL Q8).

### 2. Intelligent Tooltips
* Hovering over a specific customer (e.g., Tamara Chand) dynamically filters the view to show **only** the products bought by her, ensuring the total matches her individual sales figures perfectly.
* ## 🎨 Advanced UX & UI Engineering
*Goal: Maximize insights within limited screen real estate using Bookmarks.*

### 1. The "Hover-to-Explore" Tooltip (Logistics)
* **Feature:** Hovering over the small "Avg Ship Time" KPI card triggers a hidden report page.
* **Result:** Instantly reveals the detailed "Delivery Days by Mode" chart (verified via SQL Q8) without leaving the main view.

### 2. Collapsible Slicer Panel (Space Optimization)
* **Problem:** Slicers (Date, Region, Category) were taking up 20% of the canvas.
* **Solution:** Implemented a **Hidden Slicer Panel** using **Bookmarks & Selection Pane**.
* **Interaction:** Clicking the "Filter" button slides the panel out; clicking "Close" hides it back. This keeps the dashboard clean and focused on data.
*

---

## 💡 Key Business Insights

1.  **Operational Efficiency:** The logistics team is meeting SLAs across all tiers. Recommendations include upselling "First Class" shipping to high-value customers for higher margins.
2.  **Customer Segmentation:**
    * **The "Whales":** Customers like Sean Miller & Tamara Chand drive profit.
    * **The "Frequent Flyers":** High-frequency buyers with smaller baskets identified via SQL (Q4) require a separate loyalty retention program.
3.  **Inventory Alert:** The **Canon ImageCLASS Copier** is the single highest profit-generating SKU and must be prioritized in Q4 inventory planning.

---

## 🚀 How to Run This Project
1.  **SQL Setup:** Import the `superstore_cleaned.csv` into MySQL and run the provided `analysis_queries.sql` file.
2.  **Power BI:** Open `Superstore_Executive_Dashboard.pbix`.
    * *Note:* Ensure the "Customer Rank" filter is set to "is 1" for the Matrix visual to see the corrected data.

---

**Author:** Uttam Tiwari  
*Data Analyst | SQL Expert | Power BI Developer*

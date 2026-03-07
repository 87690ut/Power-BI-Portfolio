# 📊 End-to-End Superstore Analytics: Simulation, Engineering & Executive Insights

![Python](https://img.shields.io/badge/Python-ETL_&_Simulation-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Advanced_Analysis-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Executive_Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

## 💼 Executive Summary
This project is a **Full-Stack Data Solution** simulating a real-world corporate environment.
Instead of using a pre-cleaned dataset, I **engineered the data** using Python (simulating cost/profit metrics), built an **Automated ETL Pipeline** to push it to a SQL Data Warehouse, and developed a **Navigation-Driven Power BI Dashboard** to solve critical business problems like "Profitless Growth."

**Live Dashboard Preview:**
![Dashboard Preview](LINK_TO_YOUR_DASHBOARD_IMAGE_HERE)

---

## 🏗️ The Architecture (Automated Pipeline)

```mermaid
Raw CSV (Messy) --> [Python: Date Parsing + NumPy Simulation] --> [SQLAlchemy Engine] --> [MySQL Database] --> [Power BI (Direct Connect)]
```

* **Data Engineering:** Automated ETL process using `SQLAlchemy` to load data directly into the database.
* **Business Simulation:** Used `NumPy` to generate synthetic `Cost` and `Profit` data to model real-world P&L scenarios.
* **Connectivity:** Power BI fetches data directly from the local MySQL server, ensuring real-time sync.

---

## 🛠️ PHASE 1: Advanced Python Engineering (ETL & Simulation)

### 🛑 Challenge 1: The "Date Parsing" Nightmare
The raw data contained mixed date formats (e.g., `12-05-2022` could be May 12th or Dec 5th). Standard parsers failed, leading to data corruption.

### ✅ Solution: Robust Custom Parsing (`dateutil`)
I implemented a custom error-handling function using the `dateutil` library.
* **Logic:** The `clean_date` function applies `dayfirst=True` row-by-row to correctly interpret ambiguous dates.
* **Code Snippet:**

```python
from dateutil import parser

def clean_date(date_str):
    try:
        # Handles mixed formats automatically (e.g., DD-MM vs MM-DD)
        return parser.parse(str(date_str), dayfirst=True)
    except:
        return pd.NaT  # Returns 'Not a Time' for errors instead of crashing

df['Order Date'] = df['Order Date'].apply(clean_date)
```

### 🛑 Challenge 2: Missing Business Metrics
The raw dataset only had "Sales" figures, lacking "Cost" or "Profit" data, making P&L analysis impossible.

### ✅ Solution: Business Scenario Simulation (`NumPy`)
I engineered synthetic financial data to create actionable insights.
* **Simulation:** Generated `Cost` as 70-90% of Sales using `np.random`.
* **Loss Injection:** Intentionally introduced a **Loss Mask** (10% probability) to simulate unprofitable orders, making the analysis realistic.

```python
# Generating Cost Ratios (70% to 90% of Sales)
cost_ratios = np.random.uniform(0.70, 0.90, df.shape[0])
df['Cost'] = df['Sales'] * cost_ratios

# Simulating 10% artificial loss cases for "Profitless Growth" analysis
loss_mask = np.random.choice([True, False], size=df.shape[0], p=[0.1, 0.9])
df.loc[loss_mask, 'Cost'] = df['Sales'] * 1.25  # Cost > Sales = Loss
```

### 🚀 Automation: Direct SQL Loading
Bypassed manual CSV handling by pushing data directly to MySQL using `SQLAlchemy`.

---

## 🛠️ PHASE 2: Advanced SQL Analysis (Window Functions)

I utilized SQL to solve complex questions that required ranking and historical comparison.

### 🔍 Key Solved Problems:

#### 1. 📈 Year-over-Year (YoY) Growth Analysis [Advanced]
**Problem:** Stakeholders needed to know exact growth percentages compared to the previous year.
**Solution:** Used the `LAG()` Window Function to access the previous year's row without complex self-joins.
```sql
WITH yrsale AS (
    SELECT year(order_date) as order_year, sum(sales) as current_sale
    FROM superstore_cleaned
    GROUP BY year(order_date)
)
SELECT order_year, 
       (current_sale - LAG(current_sale) OVER (ORDER BY order_year)) / 
       LAG(current_sale) OVER (ORDER BY order_year) * 100 as YOY_Growth
FROM yrsale;
```

#### 2. 🥇 Best Customer per Region (Ranking)
**Problem:** Identifying the top-performing client in each region dynamically.
**Solution:** Used `DENSE_RANK()` with `PARTITION BY` to handle ties and rank customers within their specific regions.
```sql
WITH Sal AS (
    SELECT region, customer_name, sum(sales) as Total_Sales,
    DENSE_RANK() OVER (PARTITION BY region ORDER BY sum(sales) DESC) as Rnk
    FROM superstore_cleaned
    GROUP BY region, customer_name
)
SELECT * FROM Sal WHERE Rnk = 1;
```

---

## 🛠️ PHASE 3: Power BI User Experience (UX) & Engineering

This is where technical accuracy meets user experience.

### 🌟 1. Custom Report Page Tooltips (The "Hover" Chart)
**Feature:** Standard tooltips are limited to text. I created a custom **"Mini-Report"** that appears when hovering over a map region.
* **Implementation:** Designed a separate page, set "Page Type" to Tooltip, and linked it to the main Visual.
* **Impact:** Users can see "Top 5 Products" for a specific state instantly without leaving the main view.

### 🌟 2. Geospatial Engineering ("Location Fix")
**Problem:** The Map visual incorrectly plotted generic city names (e.g., *Springfield*) in other countries.
**Solution:** Created a Calculated Column **`Location Fix`** hardcoded as "United States" and added it to the map hierarchy (City > State > Location Fix). This forced 100% accurate geocoding.

### 🌟 3. Time Intelligence (Auto Date Hierarchy)
**Feature:** Enabled **"Auto Date/Time"** in global settings.
**Impact:** Power BI automatically generated hierarchies (Year > Quarter > Month), allowing users to **Drill Down** from Annual trends to Daily performance with one click.

### 🌟 4. Advanced UI/UX
* **Navigation:** Implemented a collapsible **Side Menu** using Bookmarks (Menu/Reset) for a clean "App-like" feel.
* **Container Strategy:** Placed KPIs on rounded "Background Plates" with soft shadows to create a modern, floating aesthetic.
* **Dynamic Profit/Loss Map:** Bubbles are colored dynamically (**Green** = Profit, **Red** = Loss) to instantly flag high-risk areas like Texas.

---

## 📉 Key Insights Uncovered
1.  **Profitless Growth:** High sales in "Furniture" (Tables) are driving huge losses due to discount strategies.
2.  **Regional Anomalies:** Texas generates high revenue but is the #1 loss-making state.
3.  **Shipping Inefficiency:** "Same Day" shipping is often used for low-margin items, eating into profits.

---

### 👨‍💻 Author
**Uttam Tiwari**
*Full-Stack Data Analyst*
* [LinkedIn Profile] | [GitHub Profile]

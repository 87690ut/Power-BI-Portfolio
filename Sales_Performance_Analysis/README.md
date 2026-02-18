# 📊 Sales & Revenue Performance Analytics Dashboard

**Author:** Uttam Tiwari  
**Role:** Data Analyst / BCA Student  

## 🎯 Project Overview
This project is an end-to-end interactive Power BI dashboard designed to track and analyze the sales and revenue performance of a business across multiple markets. The goal is to provide management with clear, actionable insights into revenue trends, top-performing markets, and customer behavior to drive data-informed business decisions.

## 🛠️ Tools & Technologies Used
* **Tool:** Microsoft Power BI
* **Data Transformation:** Power Query (Data cleaning and formatting)
* **Calculations:** DAX (Data Analysis Expressions)
* **UI/UX Design:** Dark Corporate Theme with optimized Data-Ink Ratio.

## 🚀 Key Features & Technical Skills Demonstrated

### 1. Advanced DAX Measures
* Replaced implicit calculations with explicit measures for better performance.
* Used `SUM` for Total Revenue and Total Sales Quantity.
* Implemented `DISTINCTCOUNT` to accurately track **Total Unique Customers** and **Total Markets** without duplicate counting.

### 2. Time Intelligence & Drill-Down
* Solved the "Single Dot" graph distortion issue by creating a Time Hierarchy (Year -> Month).
* Enabled Drill-down functionality allowing users to smoothly transition from a yearly macro-view to a monthly micro-view for deeper trend analysis.

### 3. Interactive UI & Cross-Filtering
* Built an interconnected layout using a dynamic 'Tile' Slicer for Years.
* Selecting a specific Year or Market dynamically cross-filters all KPIs and visual trends without cluttering the screen.
* Removed redundant X-axis scales when Data Labels are active to maintain a clean, premium look.

## 💡 Crucial Business Insights Discovered
Based on the dashboard analysis, I extracted the following key business observations:

1. **Market Dominance:** The **Delhi NCR** market is the primary revenue driver, contributing the highest volume compared to all other cities combined.
2. **Zone Dependency:** The **North Zone** controls the absolute majority of the business, holding approximately **67%** of the total revenue share.
3. **VIP Customers:** A massive portion of sales quantity relies heavily on two major clients: **Surge Stores** and **Surface Stores**. 
4. **Data Trend Anomaly (The End-of-Period Drop):** A sharp decline is observed

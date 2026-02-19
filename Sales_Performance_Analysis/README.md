# 📊 Sales & Revenue Performance Analytics Dashboard (SQL-to-PowerBI)

**Author:** Uttam Tiwari  
**Role:** Data Analyst / BCA Student  

## 🎯 Project Overview
This project demonstrates a professional Data Analytics workflow where data is managed in a SQL Database and visualized in Power BI. Instead of using flat files, I used a structured database to build an interactive dashboard that tracks revenue, sales quantity, and market performance.

## DASHBOARD PREVIEW
![Sales performance dashboard]()

## 🛠️ Technical Workflow
1. **Data Sourcing:** Downloaded a professional **SQL Database Dump** file from a data repository.
2. **Database Management:** Successfully imported the `.sql` dump file into a local **MySQL/SQL Server** environment to set up the relational database.
3. **Power BI Connectivity:** Connected Power BI Desktop to the local SQL database to fetch real-time tables (Sales, Markets, Customers, Products).
4. **Data Modeling:** Established relationships between tables to create a **Star Schema** for efficient analysis.

## 🚀 Key Features & Solutions

### 1. The "Single Dot" Trend Fix
* **Problem:** Selecting a single year in the slicer caused line charts to collapse into a single data point (dot).
* **Solution:** Implemented a **Time Hierarchy (Year > Month)**. Now, when a year is selected, the dashboard automatically drills down to show monthly trends, ensuring a continuous and professional visualization.

### 2. Interactive KPI Metrics
* Developed dynamic measures using DAX:
    * **Total Revenue & Sales QTY:** Using `SUM` for overall performance.
    * **Total Customers & Markets:** Using `DISTINCTCOUNT` for unique counts.
* Optimized the UI by removing redundant axis titles and scales, focusing on **Data Labels** for a cleaner look.

## 💡 Key Business Insights
* **Primary Market:** **Delhi NCR** is the largest revenue contributor.
* **Regional Share:** The **North Zone** accounts for approximately **67%** of total business revenue.
* **Revenue Anomaly:** Identified a sharp drop in year-end sales, which was diagnosed as an **incomplete data cycle** for the final period, showcasing the importance of data auditing.

## ⚙️ How to Run
1. Import the SQL file from the `/data` folder into your local SQL Server.
2. Open the `.pbix` file and update the data source settings to link with your local database credentials.

# 📊 Global Job Trends Dashboard (2024)

## 📝 Project Overview
This project is a comprehensive analysis of the data job market, focusing on roles like Data Scientists, Data Engineers, and Data Analysts. 

**Latest Update:** The dashboard now features a **"Job Search Tool"**, allowing users to interactively filter jobs based on salary expectations, specific roles, and date ranges.

The goal is to help job seekers understand:
- Which roles pay the highest salaries?
- Is a degree strictly required for data roles?
- What are the trends for remote vs. on-site work?
- **(New)** detailed job filtering based on user preferences.

---

## ✨ Key Features & Pages

### 1. 🌍 Executive Summary (Main Dashboard)
- Provides a high-level view of the global market.
- **Key Metrics:** Median Salary by Country, Top Roles by Salary, and Remote Work Ratios.
- **Visuals:** Map visuals for location analysis and Bar charts for role comparison.

### 2. 🔍 Job Search Tool (Detailed Analysis)
- A dedicated interactive page for deep-diving into the data.
- **Dynamic Filtering:** Users can filter by **Job Title** (e.g., Data Scientist) and use a **Salary Slider** to find jobs within a specific pay range.
- **Education Insights:** Instantly updates to show the ratio of degree vs. no-degree requirements for the selected filters.

---

## 🔍 Key Insights Derived

Based on the analysis, here are the top findings:

### 💰 Salary Trends
- **Top Earners:** Senior Data Scientists and Senior Data Engineers command the highest median yearly salaries globally.
- **Location Impact:** The **United States** offers the highest median salaries compared to the UK, France, and India.

### 🎓 Education Requirements
- **Degree Not Always Mandatory:** Approximately **32.5%** of job postings did not explicitly mention a degree requirement.
- **Skill-Based Hiring:** Data Analysts and Data Engineers show a higher tendency for skill-based hiring compared to research-heavy roles.

### 📅 Work Schedule
- **Remote Reality:** Only **~13%** of jobs offer fully remote options, with the majority being On-Site or Hybrid.

---

## 🛠️ Technical Skills Used
- **Power BI:** Advanced dashboarding, Bookmarks, and Page Navigation.
- **DAX Measures:** Used for calculating Median Salary, Job Counts, and Dynamic Titles.
- **Data Modelling:** Star Schema implementation connecting Job Facts with Dimension tables.
- **UI/UX Design:** Custom sidebars, Slicers, and clear navigation layout.

---

## ⚙️ Backend Architecture & Data Modeling (ETL)

A robust dashboard requires a strong data foundation. In this project, significant work was done in the backend using **Power Query** and **Data Modeling** to ensure optimal performance and accuracy.

**Key Data Engineering Steps Taken:**
* **ETL Operations (Power Query):** Cleaned raw data, handled null values, and used advanced operations like **Merge** and **Append** to consolidate multiple data sources into unified tables.
* **Data Modeling:** Designed a highly efficient **Star/Snowflake Schema** connecting the main Fact table (`Job_posting_fact`) with multiple Dimension tables (`Company_dim`, `Skills_dim`, etc.).
* **Relationship Management:** Established proper 1-to-many (*:1) relationships and cross-filter directions to ensure accurate filtering across the entire dashboard.

**Data Model Snapshot:**
![Data Model Schema](./screenshots/data_model.png)

---
## 🚀 Latest Update: Interactive App Design (v2.0)

I have recently upgraded this dashboard from a static report to a fully interactive **Analytics Application**.

**New Features Added:**
* **📱 App-Like Navigation:** Replaced standard pages with a clean **Card-based UI** and navigation buttons (Bookmarks) for a seamless user experience.
* **🔍 Drill-Through Analysis:** Implemented deep-dive capabilities. Users can now right-click on a job role (e.g., Data Analyst) to see a dedicated detailed report with Gauge charts and specific metrics.
* **📈 Sparklines:** Added trend lines directly within data tables to visualize salary fluctuations over time without cluttering the view.
* **Job Search Tool:** A dedicated custom filter page for personalized job searching.

**Updated Dashboard Preview:**
![New Dashboard UI](Screenshot%202026-02-11%20203410.png)

---


## 📷 Dashboard Visuals


### 1. Job Search Tool (Interactive Page)
![Search Tool](Screenshot%202026-02-10%20185249.png)

### 2. Updated Dashboard With New UI
![New Dashboard](Screenshot%202026-02-11%20203410.png)
---
*Project maintained by Uttam Tiwari.*

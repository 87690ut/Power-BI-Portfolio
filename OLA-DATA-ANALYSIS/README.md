# 🚖 OLA Ride Data Analytics: End-to-End Project (SQL + Power BI)

**Project Managed by:** Uttam Tiwari, BCA Student

## 📌 Project Overview
This project is an end-to-end data analytics solution for tracking and analyzing OLA ride data. The goal of this dashboard is to provide actionable business insights regarding ride volume, revenue generation, cancellation rates, and customer/driver ratings. 

I built this project from scratch, starting with raw data cleaning in **SQL** and moving to advanced data modeling, DAX calculations, and interactive visualization in **Power BI**.

## 🛠️ Tech Stack & Tools Used
* **Database Management:** SQL (Data extraction, cleaning, and handling null/missing values)
* **Business Intelligence:** Power BI (Data Modeling, Dashboard Design, Interactive Visuals)
* **Calculations:** Advanced DAX (Data Analysis Expressions)

## 📊 Dashboard Architecture (5-Page Layout)
To ensure a clean UI/UX and avoid clutter, the dashboard is divided into 5 specific analytical views, following the corporate 'F-Pattern' design:
1. **Overall:** Executive summary of Total Bookings, Revenue, and Success Rate.
2. **Vehicle Type:** Breakdown of performance by ride types (Prime Sedan, SUV, Mini, E-Bike, etc.).
3. **Revenue:** Detailed financial tracking (Cash vs. UPI) and day-by-day revenue trends.
4. **Cancellation:** Deep dive into cancellation reasons by customers and drivers.
5. **Rating:** Performance evaluation based on customer and driver feedback.

## 💡 Key Business Insights
* **Total Ride Volume:** Handled a dataset of **40,539 total bookings**.
* **Success Rate:** Achieved a successful booking count of **25,207 rides** (~62% success rate).
* **Revenue Generation:** Total booking value stands at **13.76M**, with **Cash (7.5M)** and **UPI (5.6M)** being the dominant payment methods.
* **Cancellation Analysis:** The overall cancellation rate is **27.9% (11,291 rides)**.

## 🚧 Challenges Faced & How I Solved Them (My Learning Curve)
As a Data Analyst, I believe in problem-solving. Here are the real-world challenges I tackled during this project:

1. **Complex DAX Logic for Cancellation Rate:**
   * *Problem:* Calculating the exact cancellation percentage was giving errors (like 100% or 63.9%) because of text-based reason columns and hidden blank values.
   * *Solution:* Instead of basic mathematical divisions, I used advanced DAX functions like `CALCULATE`, `DIVIDE`, and logical operators (`IN`, `||`). I structured the code using `VAR` (Variables) to keep it modular and error-free.
   * *Formula Snippet:*
     ```dax
     CanceledBooking = CALCULATE([Total Bookings], 'Bookings'[Booking_Status] IN {"Canceled by Driver", "Canceled by Customer"})
     CanceledPercentage = DIVIDE([CanceledBooking], [Total Bookings], 0)
     ```

2. **Cross-Filtering vs. Business Logic:**
   * *Problem:* Clicking on the "Cancellation Reason" pie chart made the "Successful Bookings" KPI show `(Blank)`.
   * *Solution:* Initially, I thought this was a bug. However, applying pure business logic, a single ride cannot be both "Successful" and "Canceled" at the same time. I intentionally kept this behavior as it accurately represents the dataset's reality, rather than forcing numbers using the 'Edit Interactions' feature.

3. **UI/UX Optimization:**
   * *Action:* Removed data labels from high-density line charts (Revenue by Month) to reduce visual clutter. Maintained a consistent Dark Theme with OLA's brand colors and placed Slicers (Date/Day) logically on the top-right corner for better user interactivity.

## 📸 Dashboard Screenshots
*(Add your 5 dashboard screenshots here by dragging and dropping the images into GitHub)*
1. Overall View: ![Overall_Dashboard](Overall_Dashboard.png)
2. Revenue Analysis: 
3. Cancellation Insights: 
4. Vehicle Type: 
5. Ratings: 

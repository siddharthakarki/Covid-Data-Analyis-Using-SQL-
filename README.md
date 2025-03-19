# 🌍 **COVID-19 Vaccination & Death Analysis**

## 📌 **Project Overview**
This project provides a comprehensive analysis of **COVID-19 cases, deaths**, and **vaccination rates** worldwide. The analysis covers **global trends**, **regional breakdowns**, and detailed comparisons between **countries and continents** using SQL queries. Key insights include **death percentages**, **population-based infection rates**, and the impact of **vaccination progress**.

---

## 📊 **Dataset Information**
- **Tables**:  
  - **`coviddeaths`**: Information about total cases, new cases, deaths, and population  
  - **`covidvaccination`**: Vaccination data with daily new vaccinations  
- **Key Variables**:  
  - **`location`**: Country/Region  
  - **`date`**: Date of data collection  
  - **`total_cases`**, **`new_cases`**, **`total_deaths`**, **`population`**: Case and population statistics  
  - **`new_vaccinations`**: Daily new vaccinations  

---

## 🚀 **Key Objectives**  

### ✔️ **Global & Regional Insights**
- Investigate the relationship between **total cases**, **deaths**, and **vaccination rates** across different countries and continents.  

### ✔️ **Case Fatality Rate (CFR)**
- Calculate and analyze the **death percentage** for each country and continent.  

### ✔️ **Population vs. Cases**
- Analyze **COVID-19 case density** in relation to population size.  

### ✔️ **Vaccination Progress**
- Track **vaccination rates** and compare the **vaccination percentage** relative to the population.  

### ✔️ **Data Structures**
- Use **CTEs**, **temp tables**, and **views** to manage and present results efficiently.

---

## 🔍 **Methodology & Statistical Approach**  

### ✅ **Global Trends**  
- **Total cases and deaths** by continent and country.  
- Calculation of **death percentage** and **infected percentage** relative to population size.

### ✅ **Regional Comparison**  
- **Germany-focused analysis** of total cases vs. deaths.  
- Comparison of **countries with the highest death counts** relative to population.

### ✅ **Vaccination Progress**  
- Use of **rolling sums** for **vaccination rates** across countries using **window functions**.  
- Calculation of **vaccination percentages** relative to the population.

### ✅ **Data Management**  
- Use of **CTEs** (Common Table Expressions) for rolling calculations.  
- Creation of **temporary tables** to store intermediate results.  
- **Views** to simplify querying and analysis.

---

## 📈 **Key Findings**  

### 📍 **Global & Regional Insights**
- **Germany** showed a clear correlation between **total cases** and **death percentage**.  
- **High case fatality rates** in regions with large populations such as **Brazil** and **India**.  

### 📍 **Vaccination Progress**
- **Rolling vaccination sums** reveal the trend of vaccinations over time, indicating a **steady increase** in vaccinated populations across the globe.  
- Countries like **China** and **India** had the highest **total vaccinations**, but the **percentage of vaccinated population** was more gradual in larger populations.

### 📍 **Data Management Insights**
- Use of **views** greatly simplified the analysis and query management for large datasets.  
- **CTEs** provided an efficient way to calculate running totals for vaccinations.

---

## 🛠 **Technologies Used**  

- 📊 **SQL**: Extensive use of **joins**, **CTEs**, **window functions**, and **aggregate functions** for data manipulation.  
- 🗂 **Data Management**: Temporary tables and **views** for efficient data storage and querying.  
- 🌐 **Data Sources**: COVID-19 vaccination and death data from **Portfolio_Project**.

---

## 📢 **Conclusion & Future Work**  

- 🔹 **Vaccination rates** correlate positively with a reduction in **death percentages**, but further analysis of **vaccination equity** across different countries is needed.  
- 🔹 **Regional differences** in case fatality rate suggest that **health infrastructure** plays a critical role in the pandemic's outcome.  
- 🔹 Future work could include **predictive models** to forecast future trends based on current data.

---

## 💡 **Contributors**  

👤 **Siddhartha Karki**  
📧 **Sidkarki999@gmail.com**  
🌐 **LinkedIn**: www.linkedin.com/in/siddhartha-karki
📌 **Support & Contributions**  
⭐ **If you found this project useful, give it a star!**  
💬 **Feedback and contributions are welcome!** 🎯

---

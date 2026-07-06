# 📊 IT Support Cost Optimization & Customer Satisfaction Analysis

## 🚀 Overview

This project is an end-to-end **IT support analytics solution** built to analyze support-ticket cost, engineer workload, escalations, resolution performance, and customer satisfaction.

The analysis uses a dataset of **50,000 IT support tickets** and converts operational data into actionable insights through **SQL, Python, and Power BI**.

---

## 🎯 Business Problem

IT support teams need to reduce support costs while maintaining fast resolution times and high customer satisfaction.

This project addresses the following management objectives:

- Reduce total support cost
- Improve customer satisfaction above the target level
- Reduce unnecessary escalations
- Optimize engineer workload and allocation
- Identify issue categories and priorities that require attention

---

## 📂 Dataset

The dataset contains **50,000 IT support tickets** with fields such as:

- Ticket ID
- Issue Category
- Priority
- Resolution Time
- Cost per Engineer Hour
- Total Support Cost
- Engineer Hours
- Client Type
- Escalation Count / Escalation Status
- Customer Satisfaction Score
- CSAT Status
- Resolution Speed

> Note: The original business scenario mentions a large-scale support environment. This project uses a 50,000-ticket dataset for analysis and dashboard development.

---

## 🛠️ Tech Stack

- **MySQL** → Data creation, cleaning, validation, views, and business analysis queries
- **Python** → Exploratory analysis and supporting analysis
- **Power BI** → Interactive dashboards, DAX measures, and business storytelling
- **DAX** → KPI calculations and dashboard metrics

---

## 📊 Project Workflow

1. Created and loaded the IT support ticket dataset in MySQL  
2. Performed data validation and cleaning checks  
3. Created SQL views for analysis and dashboard reporting  
4. Wrote business-focused SQL queries for cost, workload, escalation, and satisfaction analysis  
5. Built DAX measures for key KPIs  
6. Developed a two-page Power BI dashboard  
7. Generated actionable recommendations from the findings  

---

## 📈 Dashboard Preview

### 🟦 Page 1 — IT Support Cost Optimization & Operations Overview

![IT Support Cost Optimization & Operations Overview](images/Page%201%20IT%20Support%20Cost%20Optimization%20%26%20Operations%20Overview.png)

This page tracks support cost, engineer workload, escalation patterns, issue-category contribution, priority, and client-type filters.

### 🟪 Page 2 — Customer Satisfaction & Resolution Analysis

![Customer Satisfaction & Resolution Analysis](images/Page%202%20Customer%20Satisfaction%20%26%20Resolution%20Analysis.png)

This page analyzes CSAT performance, resolution speed, resolution time by issue category, escalation volume, and CSAT target achievement.

---

## 📌 Key KPIs

| KPI | Value |
|---|---:|
| Total Tickets | 50K |
| Total Support Cost | 187.10M |
| Average Cost per Ticket | 3.74K |
| Average Resolution Time | 8.62 |
| Escalation Rate | 49.57% |
| Total Engineer Hours | 290.77K |
| Average CSAT | 3.83 |
| CSAT Target Met % | 39.15% |
| Fast Resolution % | 43.74% |

---

## 🔍 Key Insights

- **Hardware** issues have the highest support cost at approximately **40.18M**.
- **Hardware and Access** together contribute approximately **39.5%** of total support cost.
- High- and Critical-priority tickets account for approximately **62%** of escalations.
- Hardware also has the highest engineer workload at approximately **61.41K hours**.
- Average resolution time is highest for **Network** issues (**9.2**) and Hardware issues (**8.9**).
- Faster resolution is associated with higher customer satisfaction: Fast tickets have an average CSAT of **4.4**, compared with **2.8** for Slow tickets.
- **64.85%** of tickets achieved the CSAT target based on the dashboard’s CSAT-status analysis.

---

## 💡 Business Recommendations

- Prioritize root-cause analysis and preventive maintenance for **Hardware** and **Access** issues to reduce the largest cost drivers.
- Create dedicated escalation workflows for **High** and **Critical** tickets to control escalation volume.
- Improve troubleshooting playbooks and engineer capacity for **Network** and Hardware issues, where resolution times are highest.
- Use resolution-speed SLAs and ticket-routing rules to increase the share of fast resolutions.
- Review tickets below the CSAT target and identify recurring causes by issue category, priority, and client type.
- Balance engineer allocation based on workload by issue category instead of using a uniform allocation approach.

---

## 📁 Project Structure

```text
it-support-cost-optimization/
│
├── data/
│   └── IT support ticket dataset
│
├── sql/
│   ├── 1. Data_Creation.sql
│   ├── 2. View_Creation_in_Sql_For_Data_Analysis_And_Dashboard_building.sql
│   └── 3. Queries.sql
│
├── python/
│   └── IT_Support_Analysis.ipynb
│
├── powerbi/
│   └── IT_Support_Cost_Optimization_Dashboard.pbix
│
├── images/
│   ├── Page 1 IT Support Cost Optimization & Operations Overview.png
│   └── Page 2 Customer Satisfaction & Resolution Analysis.png
│
├── docs/
│   └── IT_Support_Cost_Optimization_Dashboard.pdf
│
└── README.md
```

---

## 🧠 Skills Demonstrated

- SQL data modeling and view creation
- Data validation and business analysis queries
- KPI design using DAX
- Power BI dashboard design and data storytelling
- Cost, workload, escalation, and CSAT analysis
- Translating analysis into operational recommendations

---

## 👤 Author

**Kaushal Gaur**  
Data Analyst

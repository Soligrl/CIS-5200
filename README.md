# Redfin Housing Market Analysis

This project analyzes housing market trends across U.S. states using Hive for data processing and Tableau for visualization. By leveraging big data techniques, we explored how home prices have changed over time and varied across regions, with a focus on temporal and spatial insights.

---

## 📌 What the Project Does
- Processes over **7GB** of Redfin housing data covering 10 years of property transactions
- Calculates average prices, price volatility, and growth by state
- Visualizes insights with **line charts, filled maps, heatmaps, and bar charts**

---

## 💡 Why the Project Is Useful
- Helps identify high-growth states based on price increases
- Highlights **market volatility** across time and location
- Supports decision-making for **investors, homebuyers, and policymakers**

---

## 🚀 How to Get Started
1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/thuynyle/redfin-housing-market-data)
2. Convert `.tsv` files to `.csv`
3. Upload to **HDFS** using Git Bash + SSH
4. Run Hive SQL queries (see `redfin_housing_queries.sql`)
5. Export results to CSV using Hive + HDFS
6. Visualize data in **Tableau**

---

## 🔧 Tools Used
- **Apache Hive** for SQL-based big data processing
- **HDFS** for distributed file storage
- **Tableau** for data visualization
- **Git Bash / SSH** for command-line operations

---

## 📊 Key Visualizations
- **Line Chart**: Median list price trends over time by state
- **Map**: Median list prices by state (2021 snapshot)
- **Heatmap**: Price volatility by state and year
- **Bar Chart**: Top 10 states with the highest price growth from 2012 to 2021

---

## 🆘 Where to Get Help
- Post questions in the GitHub Issues tab
- Refer to Hive and Tableau documentation for setup support

---

## 👩‍💻 Contributors
- **Solange Ruiz** (sruiz85) – Data processing, Hive scripting, data modeling, Tableau visualizations, and documentation
- **Christian Ahamba** – Key Findings, Implementation Workflow

Project completed as part of **CIS 5200** at **Cal State LA**, supervised by **Prof. Jongwook Woo**.

---

## 📁 Related Files
- `redfin_housing_queries.sql` – All Hive queries used
- `state_price_full.csv` – Output for Tableau
- Visuals and screenshots in `/charts` folder (optional)

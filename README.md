# Healthcare Data Warehouse

This repository contains a complete Data Warehouse project for healthcare data analysis using CSV source files, SSIS for ETL, T-SQL OLAP queries, and Power BI for dashboard visualization.

## 📁 Project Structure

```
healthcare-data-warehouse/
│
├── Dataset/                    # Raw dataset files (CSV format)
│   ├── dim_patient.csv
│   ├── dim_doctor.csv
│   ├── dim_hospital.csv
│   ├── dim_insurance.csv
│   ├── dim_date.csv
│   └── fact_hospital_visit.csv
│
├── Schema/                    # Data warehouse schema & SQL table definitions
│   ├── DatwareHealthcareSchema.png
│   └── table-definitions.sql
│
├── etl/                       # SSIS ETL process
│   ├── ssis-diagram.png
│   └── etl-description.md
│
├── Dashboard/                 # Power BI visualization
│   ├── Dashboard Data Warehouse Healthcare.pbix
│   └── dashboard-explanation.md
│
├── olap-queries/              # OLAP queries and results
│   ├── olap-queries.sql
│   ├── Screenshot OLAP Roll Up .jpg
│   ├── Screenshot OLAP Drill Down.jpg
│   ├── Screenshot OLAP Slice.jpg
│   ├── Screenshot OLAP Dice.jpg
│   └── Screenshot OLAP Pivot.jpg
│
└── README.md                  # Project documentation
```

## 🛠 Tools Used
- **Microsoft SQL Server** (for database + OLAP queries)
- **SSIS** (for ETL from CSV to SQL Server)
- **Power BI** (for dashboard/reporting)

## 🧾 Features

- Star schema data model
- Cleaned and structured healthcare data
- OLAP queries: Roll-Up, Drill-Down, Slice, Dice, Pivot
- Interactive dashboard with patient insights

## 📊 Dashboards Preview

Available in `/Dashboard` folder and viewable via Power BI Desktop.

## 🔁 ETL Overview

- Source: 6 CSV files
- SSIS used for:
  - Data Conversion to match database types
  - Aggregation
  - OLE DB Destination to load into SQL Server

Details in: [`etl/etl-description.md`](etl/etl-description.md)

## 🔎 OLAP Queries

Explore predefined queries in:
- [`olap-queries/olap-queries.sql`](olap-queries/olap-queries.sql)

With visual results in screenshots.

---

## 📬 Author

Made with ❤️ for academic purposes.
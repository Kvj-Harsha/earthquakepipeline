# Azure Data Engineering Pipeline: Earthquake API Ingestion & Medallion Architecture

## Overview

This project implements a modern data engineering pipeline on Azure to ingest, transform, and visualize earthquake data using the USGS Earthquake API. It applies the Medallion Architecture with Bronze, Silver, and Gold layers using Azure Databricks, Azure Data Factory, Azure Synapse Analytics, and Power BI.

## Architecture
![diagram](https://github.com/user-attachments/assets/6aa6d6a1-2691-4f99-bd66-ace5ec56a5a7)

----

![image](https://github.com/user-attachments/assets/75753311-a496-4d14-ab0b-3669d7578b15)


## Features

* **Dynamic API Ingestion**: Uses PySpark in Databricks to call and process data from the USGS API with dynamic `start_date` and `end_date`.
* **ADF Pipelines**: Orchestrates daily ingestion via scheduled triggers.
* **Medallion Architecture**:

  * **Bronze**: Raw JSON ingestion using `spark.read.json()`
  * **Silver**: Parsed and structured DataFrame transformations
  * **Gold**: Aggregated views and metrics written as managed tables
* **Synapse Layer**:

  * Ingests Gold layer data via PolyBase or COPY INTO
  * Provides T-SQL endpoint for analytics and Power BI
* **Power BI Dashboard**:

  * Connects to Synapse SQL endpoint
  * Map visualizations, trends, and KPIs
  * Filterable by location, magnitude, and time

## Technologies Used

* Azure Databricks (PySpark)
* Azure Data Factory
* Azure Synapse Analytics
* Azure Data Lake Storage Gen2
* Power BI
* PySpark, Delta Lake

## Directory Structure

```
/
├── notebooks/
│   ├── bronze_notebook.py
│   ├── silver_notebook.py
│   └── gold_notebook.py
├── pipeline/
│   └── adf_pipeline.json
├── synapse/
│   └── synapse_ingestion.sql
├── powerbi/
│   └── dashboard.pbix
└── README.md
```

## API Used

[USGS Earthquake GeoJSON API](https://earthquake.usgs.gov/fdsnws/event/1/)

**Query Example**:

```
https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2014-01-01&endtime=2014-01-02
```

## ADF PIPELINE

![Screenshot 2025-05-26 195918](https://github.com/user-attachments/assets/6d1b281b-2684-42b1-afbf-48fdbf1f9214)

## DASHBOARD

![Screenshot 2025-05-26 193133](https://github.com/user-attachments/assets/07c0156c-2361-4f50-ac0c-93835c4a395e)

## Enhancements (Future Scope)

* Implement **Autoloader** for continuous file ingestion
* Add **Unity Catalog** for centralized governance and discovery
* Integrate **Kafka** for real-time streaming ingestion
* Extend to **real-time Power BI dashboards** using DirectQuery
* CI/CD with GitHub Actions or Azure DevOps pipelines

---

This repository is designed with scalability, reliability, and modularity in mind. It reflects modern best practices in Azure-native data engineering workflows.

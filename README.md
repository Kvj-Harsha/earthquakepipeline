# Azure Data Engineering Pipeline: Earthquake API Ingestion & Medallion Architecture

## Overview

This project implements a modern data engineering pipeline on Azure to ingest, transform, and visualize earthquake data using the USGS Earthquake API. It applies the Medallion Architecture with Bronze, Silver, and Gold layers using Azure Databricks, Azure Data Factory, Azure Synapse Analytics, and Power BI.

## Architecture
![image](https://github.com/user-attachments/assets/6d4b7be0-900c-4a88-b107-b82e1d2b0db4)

```
          +-----------------------------+
          |  USGS Earthquake API       |
          +-------------+---------------+
                        |
                        v
          +-----------------------------+
          | Azure Data Factory (ADF)    |
          |  - Triggers Databricks Job |
          +-------------+---------------+
                        |
                        v
              +-------------------+
              | Azure Databricks  |
              |  Bronze Notebook  |
              +--------+----------+
                       |
                       v
              +-------------------+
              | Silver Notebook   |
              +--------+----------+
                       |
                       v
              +-------------------+
              | Gold Notebook     |
              +--------+----------+
                       |
                       v
           +--------------------------+
           | Azure Synapse Analytics |
           | - SQL Endpoint Layer    |
           +--------------------------+
                       |
                       v
               +----------------+
               | Power BI       |
               | Dashboards     |
               +----------------+
```

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

## Enhancements (Future Scope)

* Implement **Autoloader** for continuous file ingestion
* Add **Unity Catalog** for centralized governance and discovery
* Integrate **Kafka** for real-time streaming ingestion
* Extend to **real-time Power BI dashboards** using DirectQuery
* CI/CD with GitHub Actions or Azure DevOps pipelines

---

This repository is designed with scalability, reliability, and modularity in mind. It reflects modern best practices in Azure-native data engineering workflows.

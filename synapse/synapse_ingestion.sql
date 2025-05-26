
-- Synapse SQL Script: Ingest from Gold Delta Table

-- 1. Create External Data Source (if using ADLS)
CREATE EXTERNAL DATA SOURCE [GoldLake]
WITH (
    LOCATION = 'abfss://gold@<your-storage-account>.dfs.core.windows.net/'
);

-- 2. Create External File Format
CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat]
WITH (
    FORMAT_TYPE = PARQUET
);

-- 3. Create External Table over Delta/Parquet Output
CREATE EXTERNAL TABLE [dbo].[Earthquake_Gold]
(
    id NVARCHAR(100),
    time BIGINT,
    place NVARCHAR(255),
    mag FLOAT,
    depth FLOAT,
    latitude FLOAT,
    longitude FLOAT
)
WITH (
    LOCATION = 'earthquake/gold/',
    DATA_SOURCE = [GoldLake],
    FILE_FORMAT = [SynapseParquetFormat]
);
